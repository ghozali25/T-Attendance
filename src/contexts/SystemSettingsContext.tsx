import { createContext, useContext, useState, useEffect, useCallback, ReactNode } from "react";
import { api } from "@/lib/api";

export interface SystemSettings {
    companyName: string;
    clockInStart: string;
    clockInEnd: string;
    clockOutStart: string;
    clockOutEnd: string;
    lateThreshold: string;
    enableLocationTracking: boolean;
    enableNotifications: boolean;
    requirePhotoOnClockIn: boolean;
    autoClockOut: boolean;
    autoClockOutTime: string;
    maxLeaveDays: number;
    attendanceStartDate: string;
}

const defaultSettings: SystemSettings = {
    companyName: "PT. T-Attendance",
    clockInStart: "08:00",
    clockInEnd: "09:00",
    clockOutStart: "17:00",
    clockOutEnd: "18:00",
    lateThreshold: "09:00",
    enableLocationTracking: true,
    enableNotifications: true,
    requirePhotoOnClockIn: false,
    autoClockOut: false,
    autoClockOutTime: "22:00",
    maxLeaveDays: 12,
    attendanceStartDate: "2024-01-01", // Default to an earlier date so history is visible
};

// Helper function to safely parse integer with fallback
const safeParseInt = (value: string | undefined, fallback: number): number => {
    if (!value) return fallback;
    const parsed = parseInt(value, 10);
    return isNaN(parsed) ? fallback : parsed;
};

interface SystemSettingsContextType {
    settings: SystemSettings;
    isLoading: boolean;
    loadError: string | null;
    updateSettings: (newSettings: Partial<SystemSettings>) => Promise<void>;
    refetch: () => Promise<void>;
}

const SystemSettingsContext = createContext<SystemSettingsContextType | undefined>(undefined);

export const useSystemSettingsContext = () => {
    const context = useContext(SystemSettingsContext);
    if (!context) {
        throw new Error("useSystemSettingsContext must be used within a SystemSettingsProvider");
    }
    return context;
};

export const SystemSettingsProvider = ({ children }: { children: ReactNode }) => {
    const [settings, setSettings] = useState<SystemSettings>(defaultSettings);
    const [isLoading, setIsLoading] = useState(true);
    const [loadError, setLoadError] = useState<string | null>(null);

    const fetchSettings = useCallback(async () => {
        setLoadError(null);
        try {
            // Fetch settings from database
            const rows = await api.post<any[]>('/db/query', { 
                sql: 'SELECT setting_value FROM system_settings WHERE setting_key = ?',
                params: ['current_settings']
            });
            
            if (rows && rows.length > 0) {
                const dbSettings = JSON.parse(rows[0].setting_value);
                // Merge with defaults to handle new fields
                setSettings({ ...defaultSettings, ...dbSettings });
            } else {
                // No settings in DB, use defaults and save them
                setSettings(defaultSettings);
                await api.post('/db/execute', {
                    sql: 'INSERT INTO system_settings (setting_key, setting_value) VALUES (?, ?)',
                    params: ['current_settings', JSON.stringify(defaultSettings)]
                });
            }
        } catch (error: any) {
            console.error("Error fetching settings:", error);
            // Fallback to default but set error
            setSettings(defaultSettings);
            setLoadError(error.message || "Failed to load settings");
        } finally {
            setIsLoading(false);
        }
    }, []);

    useEffect(() => {
        fetchSettings();
    }, [fetchSettings]);

    const updateSettings = async (newSettings: Partial<SystemSettings>) => {
        // Optimistic Update
        const updatedSettings = { ...settings, ...newSettings };
        setSettings(updatedSettings);

        try {
            // Save to database
            await api.post('/db/execute', {
                sql: 'UPDATE system_settings SET setting_value = ? WHERE setting_key = ?',
                params: [JSON.stringify(updatedSettings), 'current_settings']
            });
            console.log("Settings updated in database");
        } catch (error: any) {
            console.error("Error updating settings:", error);
            // Revert on error? For now just throw
            throw error;
        }
    };

    return (
        <SystemSettingsContext.Provider value={{ settings, isLoading, loadError, updateSettings, refetch: fetchSettings }}>
            {children}
        </SystemSettingsContext.Provider>
    );
};
