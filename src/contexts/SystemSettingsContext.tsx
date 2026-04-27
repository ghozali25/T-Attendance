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
    companyName: "PT. Talenta Traincom Indonesia",
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
    attendanceStartDate: new Date(new Date().getFullYear(), new Date().getMonth(), 1).toISOString().split("T")[0], // Default to start of current month
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
            // TODO: Replace with actual API call when system settings endpoint is available
            // For now, use default settings
            setSettings(defaultSettings);
        } catch (error: any) {
            console.error("Error fetching settings:", error);
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
        setSettings((prev) => ({ ...prev, ...newSettings }));

        try {
            // TODO: Replace with actual API call when system settings endpoint is available
            console.log("Settings would be updated:", newSettings);
        } catch (error: any) {
            console.error("Error updating settings:", error);
            throw error;
        }
    };

    return (
        <SystemSettingsContext.Provider value={{ settings, isLoading, loadError, updateSettings, refetch: fetchSettings }}>
            {children}
        </SystemSettingsContext.Provider>
    );
};
