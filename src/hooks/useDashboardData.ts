import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useEffect } from "react";
import { getJakartaDate, getJakartaStartOfDayISO, getJakartaEndOfDayISO } from "@/lib/dateUtils";
import { formatInTimeZone } from "date-fns-tz";
import { startOfMonth, subMonths } from "date-fns";
import { ABSENSI_WAJIB_ROLE, EXCLUDED_USER_NAMES } from "@/lib/constants";
import { attendanceApi, profilesApi, journalsApi, leaveApi, usersApi, holidaysApi } from "@/lib/api";
import { db } from "@/integrations/mysql/client";

// Type definitions for dashboard data
export interface DashboardStats {
    totalEmployees: number;
    presentToday: number;
    lateToday: number;
    absentToday: number;
    departments: number;
    pendingLeave: number;
    onTimeRate: number;
    newEmployeesThisMonth: number;
    approvedLeaveThisMonth: number;
    attendanceThisMonth: number;
    attendanceRate: number;
}

export interface LiveStats {
    clockedInToday: number;
    lateToday: number;
    lastClockIn: string | null;
    hasData: boolean;
}

export interface RealTimeEmployee {
    id: string;
    user_id: string;
    full_name: string;
    department?: string;
    clock_in: string;
    clock_out: string | null;
    status: string;
    liveStatus: "online" | "present" | "late" | "inactive" | "idle" | "absent" | "leave" | "weekend";
    shift: string;
}

export interface MonthlyTrendData {
    month: string;
    year: number;
    attendanceRate: number;
    onTimeRate: number;
    total: number;
    late: number;
}

export interface DepartmentData {
    name: string;
    count: number;
    color: string;
}

export interface JournalData {
    id: string;
    user_id: string;
    full_name: string;
    content: string;  // Note: DB uses 'content', not 'title'
    created_at: string;
    date: string;
    status: "pending" | "approved" | "rejected" | "submitted" | "draft" | "need_revision";
    avatar_url?: string;
    department?: string;
    duration?: number;
}

export interface RecentJournalsResult {
    journals: JournalData[];
    needsReminder: boolean;
    employeesNeedingJournals: number;
    todayJournalsCount: number;
}


// Fetch IDs of employees
export const useEmployeeIds = () => {
    return useQuery({
        queryKey: ["employeeIds"],
        queryFn: async () => {
            try {
                console.log('[useEmployeeIds] Fetching employee IDs...');
                // Use API to get users from users table (includes roles)
                const users = await usersApi.getAll();
                console.log('[useEmployeeIds] Users fetched:', users?.length);
                console.log('[useEmployeeIds] Users data:', users);
                
                if (!users || !Array.isArray(users)) return new Set<string>();

                // Filter by role
                const roleArray = [...ABSENSI_WAJIB_ROLE];
                console.log('[useEmployeeIds] ABSENSI_WAJIB_ROLE:', roleArray);
                const filteredUsers = users.filter((u: any) => 
                    roleArray.includes(u.role)
                );
                console.log('[useEmployeeIds] Users after role filter:', filteredUsers.length);
                console.log('[useEmployeeIds] Filtered users:', filteredUsers);

                if (filteredUsers.length === 0) {
                    // Fallback: get all users
                    console.log('[useEmployeeIds] No users matched role filter, using all users');
                    return new Set(users.map((u: any) => u.id));
                }

                // Filter by name (exclude specific users)
                const validUsers = filteredUsers.filter((u: any) => {
                    if (!u.full_name) return true;
                    const nameLower = u.full_name.toLowerCase();
                    return !EXCLUDED_USER_NAMES.some(excluded => nameLower.includes(excluded.toLowerCase()));
                });
                console.log('[useEmployeeIds] Users after name filter:', validUsers.length);
                console.log('[useEmployeeIds] Valid users:', validUsers);

                // Use user_id instead of id for profiles
                const result = new Set(validUsers.map((u: any) => u.user_id || u.id));
                console.log('[useEmployeeIds] Returning employee IDs:', result.size);
                console.log('[useEmployeeIds] Employee IDs:', Array.from(result));
                return result;
            } catch (error) {
                console.error('[useEmployeeIds] Error:', error);
                return new Set<string>();
            }
        },
        staleTime: 1000 * 60 * 30, // 30 mins (roles rarely change)
    });
};


// Fetch Dashboard Stats (Counters) - Now always enabled and fetches directly
export const useDashboardStats = (karyawanUserIds: Set<string> | undefined) => {
    return useQuery({
        queryKey: ["dashboardStats", Array.from(karyawanUserIds || []).length],
        queryFn: async (): Promise<DashboardStats | null> => {
            try {
                console.log('[useDashboardStats] Fetching stats with user IDs:', karyawanUserIds?.size);
                const today = getJakartaDate();
                const startIso = getJakartaStartOfDayISO(today);
                const endIso = getJakartaEndOfDayISO(today);

                const startOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
                const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0, 23, 59, 59);

                // Use API to get profiles
                const profiles = await profilesApi.getAll();
                console.log('[useDashboardStats] Profiles fetched:', profiles?.length);
                if (!profiles || !Array.isArray(profiles)) return null;

                // Filter profiles by karyawanUserIds if provided
                let filterIds: Set<string>;
                if (karyawanUserIds && karyawanUserIds.size > 0) {
                    filterIds = karyawanUserIds;
                } else {
                    const validProfiles = profiles.filter((p: any) => {
                        if (!p.full_name) return true;
                        const nameLower = p.full_name.toLowerCase();
                        return !EXCLUDED_USER_NAMES.some(excluded => nameLower.includes(excluded.toLowerCase()));
                    });
                    // Use user_id instead of id for profiles
                    filterIds = new Set(validProfiles.map((p: any) => p.user_id || p.id));
                }

                const totalEmployees = filterIds.size > 0 ? filterIds.size : profiles.length;
                console.log('[useDashboardStats] Total employees:', totalEmployees);

                const todayStr = formatInTimeZone(today, 'Asia/Jakarta', 'yyyy-MM-dd');

                // Get attendance data using date column (more reliable for MySQL DATE type)
                const attendance = await db.query(
                    'SELECT user_id, status FROM attendance WHERE date = ?',
                    [todayStr]
                ) as any[];
                console.log('[useDashboardStats] Attendance records:', attendance?.length);

                const relevantAttendance = attendance?.filter((a: any) =>
                    filterIds.size === 0 || filterIds.has(a.user_id)
                ) || [];

                const present = relevantAttendance.length;
                const late = relevantAttendance.filter((a: any) => a.status === "late").length;
                const onTime = present - late;

                // Get leaves using db.query
                const approvedLeavesToday = await db.query(
                    'SELECT user_id FROM leave_requests WHERE status = ? AND start_date <= ? AND end_date >= ?',
                    ['approved', today.toISOString().split('T')[0], today.toISOString().split('T')[0]]
                ) as any[];
                console.log('[useDashboardStats] Approved leaves today:', approvedLeavesToday?.length);

                const relevantLeavesToday = approvedLeavesToday?.filter((l: any) =>
                    filterIds.size === 0 || filterIds.has(l.user_id)
                ) || [];

                const accountedForUserIds = new Set([
                    ...relevantAttendance.map((a: any) => a.user_id),
                    ...relevantLeavesToday.map((l: any) => l.user_id)
                ]);

                const targetProfiles = profiles.filter((p: any) => filterIds.has(p.id));
                
                // Check if today is weekend (Saturday = 6, Sunday = 0)
                const isWeekend = today.getDay() === 0 || today.getDay() === 6;
                console.log('[useDashboardStats] Is weekend:', isWeekend);
                
                // Only count as absent if it's not a weekend
                const absent = isWeekend ? 0 : targetProfiles.filter((p: any) => !accountedForUserIds.has(p.id)).length;
                console.log('[useDashboardStats] Absent count:', absent);

                // Calculate daily attendance rate (present / total employees)
                const dailyAttendanceRate = totalEmployees > 0 ? Math.round((present / totalEmployees) * 100) : 0;
                console.log('[useDashboardStats] Daily attendance rate:', dailyAttendanceRate);

                const onTimeRate = present > 0 ? Math.round((onTime / present) * 100) : 0;
                const uniqueDepartments = new Set(
                    profiles.map((p: any) => p.department).filter(Boolean)
                ).size;

                // Get pending leaves and journals
                const pendingLeaves = await db.query('SELECT id FROM leave_requests WHERE status = ?', ['pending']) as any[];
                const pendingJournals = await db.query('SELECT COUNT(*) as count FROM work_journals WHERE verification_status = ?', ['pending']) as any[];

                const pendingLeavesCount = pendingLeaves?.length || 0;
                const pendingJournalsCount = pendingJournals[0]?.count || 0;

                // Get approved leaves this month
                const approvedLeaves = await db.query(
                    'SELECT id, user_id FROM leave_requests WHERE status = ? AND start_date >= ? AND end_date <= ?',
                    ['approved', startOfMonth.toISOString().split('T')[0], endOfMonth.toISOString().split('T')[0]]
                ) as any[];

                const relevantApprovedLeaves = approvedLeaves?.filter((l: any) =>
                    filterIds.size === 0 || filterIds.has(l.user_id)
                ) || [];

                const newEmployees = profiles.filter((p: any) => {
                    if (!p.created_at) return false;
                    const created = new Date(p.created_at);
                    return created >= startOfMonth && created <= endOfMonth;
                }).length || 0;

                // Calculate attendance this month
                const attendanceThisMonthResult = await db.query(
                    'SELECT COUNT(*) as count FROM attendance WHERE clock_in >= ? AND clock_in <= ?',
                    [startOfMonth.toISOString(), endOfMonth.toISOString()]
                ) as any[];
                const attendanceThisMonthCount = attendanceThisMonthResult[0]?.count || 0;

                // Fetch holidays for the current month
                const fromYear = startOfMonth.getFullYear();
                let allHolidays: any[] = [];
                try {
                    allHolidays = await holidaysApi.getAll({ year: fromYear });
                } catch (e) {
                    console.warn('[useDashboardStats] Could not fetch holidays:', e);
                }

                const holidayDateSet = new Set(allHolidays.map((h: any) => 
                    new Date(h.date).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' })
                ));

                const workDaysThisMonth = getWorkingDaysInMonth(today, holidayDateSet);
                const expectedAttendance = totalEmployees * workDaysThisMonth;
                const attendanceRate = expectedAttendance > 0
                    ? Math.round((attendanceThisMonthCount / expectedAttendance) * 100)
                    : 0;

                const result = {
                    totalEmployees,
                    presentToday: present,
                    lateToday: late,
                    absentToday: absent,
                    departments: uniqueDepartments,
                    pendingLeave: pendingLeavesCount + pendingJournalsCount,
                    onTimeRate,
                    newEmployeesThisMonth: newEmployees,
                    approvedLeaveThisMonth: relevantApprovedLeaves.length,
                    attendanceThisMonth: attendanceThisMonthCount,
                    attendanceRate: dailyAttendanceRate // Use daily rate instead of monthly
                };
                console.log('[useDashboardStats] Returning stats:', result);
                return result;
            } catch (error) {
                console.error('[useDashboardStats] Error:', error);
                return null;
            }
        },
        staleTime: 1000 * 60 * 5,
        refetchInterval: 1000 * 60 * 5,
    });
};



// Fetch Live Stats (Today)
export const useLiveStats = (karyawanUserIds: Set<string> | undefined) => {
    return useQuery({
        queryKey: ["liveStats", Array.from(karyawanUserIds || []).length],
        queryFn: async (): Promise<LiveStats> => {
            try {
                const today = getJakartaDate();
                const startIso = getJakartaStartOfDayISO(today);
                const endIso = getJakartaEndOfDayISO(today);

                // Use db.query for attendance (complex query not available in API yet)
                const todayAttendance = await db.query(
                    'SELECT user_id, status, clock_in FROM attendance WHERE clock_in >= ? AND clock_in <= ? ORDER BY clock_in DESC',
                    [startIso, endIso]
                ) as any[];

                const validData = karyawanUserIds && karyawanUserIds.size > 0
                    ? todayAttendance?.filter((a: any) => karyawanUserIds.has(a.user_id)) || []
                    : todayAttendance || [];

                return {
                    clockedInToday: validData.length,
                    lateToday: validData.filter((a: any) => a.status === "late").length,
                    lastClockIn: validData[0]?.clock_in || null,
                    hasData: validData.length > 0
                };
            } catch (error) {
                console.error('Error fetching live stats:', error);
                return { clockedInToday: 0, lateToday: 0, lastClockIn: null, hasData: false };
            }
        },
        refetchInterval: 1000 * 60,
    });
};

// Fetch Weekly Trend (Optimized)
export const useWeeklyTrend = (karyawanUserIds: Set<string> | undefined) => {
    return useQuery({
        queryKey: ["weeklyTrend", Array.from(karyawanUserIds || []).length],
        queryFn: async () => {
            const today = getJakartaDate();
            const endDate = new Date(today);
            endDate.setDate(endDate.getDate() - 1);

            const startDate = new Date(endDate);
            startDate.setDate(startDate.getDate() - 6);

            const startIso = getJakartaStartOfDayISO(startDate);
            const endIso = getJakartaEndOfDayISO(endDate);

            const rangeAttendance = await db.query(
                'SELECT user_id, status, clock_in FROM attendance WHERE clock_in >= ? AND clock_in <= ?',
                [startIso, endIso]
            ) as any[];

            const days = ["Min", "Sen", "Sel", "Rab", "Kam", "Jum", "Sab"];
            const weekData = [];

            const validRecords = karyawanUserIds && karyawanUserIds.size > 0
                ? rangeAttendance?.filter((a: any) => karyawanUserIds.has(a.user_id)) || []
                : rangeAttendance || [];

            for (let i = 0; i < 7; i++) {
                const d = new Date(startDate);
                d.setDate(d.getDate() + i);
                const dateStr = d.toISOString().split("T")[0];

                const dayRecords = validRecords.filter((r: any) => {
                    return r.clock_in.startsWith(dateStr);
                });

                const hadir = dayRecords.filter((a: any) => a.status === "present" || a.status === "late").length;
                const terlambat = dayRecords.filter((a: any) => a.status === "late").length;

                weekData.push({
                    day: days[d.getDay()],
                    hadir,
                    terlambat
                });
            }

            return weekData;
        },
        staleTime: 1000 * 60 * 60,
    });
};

// ============================================================================
// NEW HOOKS FOR DASHBOARD ACTIVATION
// ============================================================================

// Real-Time Monitoring - Polling-based for MySQL (no realtime subscriptions)
export const useRealTimeMonitoring = (karyawanUserIds: Set<string> | undefined) => {
    return useQuery({
        queryKey: ["realTimeMonitoring", Array.from(karyawanUserIds || [])],
        queryFn: async () => {
            const today = getJakartaDate();
            const startIso = getJakartaStartOfDayISO(today);
            const endIso = getJakartaEndOfDayISO(today);

            let targetProfiles = [];

            if (karyawanUserIds && karyawanUserIds.size > 0) {
                const placeholders = Array.from(karyawanUserIds).map(() => '?').join(',');
                targetProfiles = await db.query(
                    `SELECT user_id, full_name, department FROM profiles WHERE user_id IN (${placeholders})`,
                    Array.from(karyawanUserIds)
                ) as any[];
            } else {
                targetProfiles = await db.query('SELECT user_id, full_name, department FROM profiles') as any[];
                targetProfiles = (targetProfiles || []).filter((p: any) => {
                    if (!p.full_name) return true;
                    const nameLower = p.full_name.toLowerCase();
                    return !EXCLUDED_USER_NAMES.some(excluded => nameLower.includes(excluded.toLowerCase()));
                });
            }

            const todayDateStr = formatInTimeZone(today, 'Asia/Jakarta', 'yyyy-MM-dd');

            const attendance = await db.query(
                'SELECT id, user_id, clock_in, clock_out, status FROM attendance WHERE date = ?',
                [todayDateStr]
            ) as any[];

            const leaves = await db.query(
                'SELECT user_id, leave_type FROM leave_requests WHERE status = ? AND start_date <= ? AND end_date >= ?',
                ['approved', todayDateStr, todayDateStr]
            ) as any[];

            const monitoringData = targetProfiles.map((profile: any) => {
                const record = attendance?.find((a: any) => a.user_id === profile.user_id);
                const leave = leaves?.find((l: any) => l.user_id === profile.user_id);

                let status = "absent";
                let liveStatus: "online" | "present" | "late" | "inactive" | "idle" | "absent" | "leave" = "absent";

                // Check if today is weekend (Saturday = 6, Sunday = 0)
                const isWeekend = today.getDay() === 0 || today.getDay() === 6;

                if (record) {
                    status = record.status;
                    const clockOutTime = record.clock_out ? new Date(record.clock_out) : null;

                    if (clockOutTime) {
                        liveStatus = "inactive";
                    } else if (record.status === "late") {
                        liveStatus = "late";
                    } else {
                        liveStatus = "present";
                    }
                } else if (leave) {
                    status = "leave";
                    liveStatus = "leave";
                } else if (isWeekend) {
                    // On weekends, mark as weekend instead of absent
                    status = "weekend";
                    liveStatus = "inactive";
                }

                return {
                    id: record?.id || `missing-${profile.user_id}`,
                    user_id: profile.user_id,
                    full_name: profile.full_name || "Unknown",
                    department: profile.department,
                    clock_in: record?.clock_in || null,
                    clock_out: record?.clock_out || null,
                    status: status,
                    liveStatus: liveStatus,
                    shift: record?.shift || "08:00 - 17:00",
                    leaveType: leave?.leave_type
                };
            });

            return monitoringData.sort((a, b) => {
                if (a.clock_in && b.clock_in) {
                    return new Date(b.clock_in).getTime() - new Date(a.clock_in).getTime();
                }
                if (a.clock_in) return -1;
                if (b.clock_in) return 1;
                return 0;
            });
        },
        refetchInterval: 1000 * 60 * 2,
    });
};

// 6-Month Attendance Trend - Monthly attendance percentages
export const useMonthlyTrend = (karyawanUserIds: Set<string> | undefined) => {
    return useQuery({
        queryKey: ["monthlyTrend", Array.from(karyawanUserIds || []).length],
        queryFn: async (): Promise<MonthlyTrendData[]> => {
            const today = getJakartaDate();
            const monthlyData: MonthlyTrendData[] = [];
            const monthNames = ["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Agu", "Sep", "Okt", "Nov", "Des"];

            const profiles = await db.query('SELECT user_id, full_name FROM profiles') as any[];

            let validProfileIds = new Set<string>();

            if (karyawanUserIds && karyawanUserIds.size > 0) {
                validProfileIds = karyawanUserIds;
            } else {
                const filtered = profiles?.filter((p: any) => {
                    if (!p.full_name) return true;
                    const nameLower = p.full_name.toLowerCase();
                    return !EXCLUDED_USER_NAMES.some(excluded => nameLower.includes(excluded.toLowerCase()));
                }) || [];
                validProfileIds = new Set(filtered.map((p: any) => p.user_id));
            }

            const totalEmployees = validProfileIds.size > 0 ? validProfileIds.size : 1;

            for (let i = 5; i >= 0; i--) {
                const targetMonth = new Date(today.getFullYear(), today.getMonth() - i, 1);
                const startOfMonth = new Date(targetMonth.getFullYear(), targetMonth.getMonth(), 1);
                const endOfMonth = new Date(targetMonth.getFullYear(), targetMonth.getMonth() + 1, 0, 23, 59, 59);

                const startIso = getJakartaStartOfDayISO(startOfMonth);
                const endIso = getJakartaEndOfDayISO(endOfMonth);

                const startStr = formatInTimeZone(startOfMonth, 'Asia/Jakarta', 'yyyy-MM-01');
                const endStr = formatInTimeZone(endOfMonth, 'Asia/Jakarta', 'yyyy-MM-dd');

                const monthAttendance = await db.query(
                    'SELECT user_id, status FROM attendance WHERE date >= ? AND date <= ?',
                    [startStr, endStr]
                ) as any[];

                const validRecords = karyawanUserIds && karyawanUserIds.size > 0
                    ? monthAttendance?.filter((a: any) => karyawanUserIds.has(a.user_id)) || []
                    : monthAttendance || [];

                // Fetch holidays for the year
                const year = targetMonth.getFullYear();
                let allHolidays: any[] = [];
                try {
                    allHolidays = await holidaysApi.getAll({ year });
                } catch (e) {
                    console.warn('[useMonthlyTrend] Could not fetch holidays:', e);
                }

                const holidayDateSet = new Set(allHolidays.map((h: any) => 
                    new Date(h.date).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' })
                ));

                const workingDays = getWorkingDaysInMonth(targetMonth, holidayDateSet);
                const totalPossibleAttendance = totalEmployees * workingDays;

                const presentCount = validRecords.filter((a: any) => a.status === "present" || a.status === "late").length;
                const lateCount = validRecords.filter((a: any) => a.status === "late").length;

                const attendanceRate = totalPossibleAttendance > 0
                    ? Math.round((presentCount / totalPossibleAttendance) * 100)
                    : 0;
                const onTimeRate = presentCount > 0
                    ? Math.round(((presentCount - lateCount) / presentCount) * 100)
                    : 0;

                monthlyData.push({
                    month: monthNames[targetMonth.getMonth()],
                    year: targetMonth.getFullYear(),
                    attendanceRate,
                    onTimeRate,
                    total: presentCount,
                    late: lateCount
                });
            }

            return monthlyData;
        },
        staleTime: 1000 * 60 * 60 * 2,
    });
};

// Department Distribution - Employee count per department
export const useDepartmentDistribution = (karyawanUserIds: Set<string> | undefined) => {
    return useQuery({
        queryKey: ["departmentDistribution", Array.from(karyawanUserIds || []).length],
        queryFn: async (): Promise<DepartmentData[]> => {
            const profiles = await db.query('SELECT user_id, department FROM profiles WHERE department IS NOT NULL') as any[];

            const validProfiles = karyawanUserIds && karyawanUserIds.size > 0
                ? profiles?.filter((p: any) => karyawanUserIds.has(p.user_id)) || []
                : profiles || [];

            const deptCounts = new Map<string, number>();
            validProfiles.forEach((p: any) => {
                const dept = p.department || "Tidak Ada Departemen";
                deptCounts.set(dept, (deptCounts.get(dept) || 0) + 1);
            });

            const distribution = Array.from(deptCounts.entries())
                .map(([name, count]) => ({ name, count }))
                .sort((a, b) => b.count - a.count);

            const DEPT_COLORS = [
                "#1A5BA8", "#00A0E3", "#7DC242", "#F59E0B", "#EF4444",
                "#8B5CF6", "#EC4899", "#14B8A6", "#F97316", "#6366F1"
            ];

            return distribution.map((dept, index) => ({
                ...dept,
                color: DEPT_COLORS[index % DEPT_COLORS.length]
            }));
        },
        staleTime: 1000 * 60 * 30,
    });
};

// Recent Journals - 5 most recent work journals with 4PM notification check
export const useRecentJournals = (karyawanUserIds: Set<string> | undefined) => {
    return useQuery({
        queryKey: ["recentJournals"],
        queryFn: async (): Promise<RecentJournalsResult> => {
            const today = getJakartaDate();
            const startIso = getJakartaStartOfDayISO(today);
            const endIso = getJakartaEndOfDayISO(today);

            const journals = await db.query(
                'SELECT id, user_id, content, created_at, verification_status, date, duration FROM work_journals WHERE deleted_at IS NULL ORDER BY created_at DESC LIMIT 10'
            ) as any[];

            const userIds = [...new Set(journals?.map((j: any) => j.user_id) || [])];

            const profileMap = new Map<string, { full_name: string, avatar_url?: string, department?: string }>();
            if (userIds.length > 0) {
                const placeholders = userIds.map(() => '?').join(',');
                const profiles = await db.query(
                    `SELECT user_id, full_name, avatar_url, department FROM profiles WHERE user_id IN (${placeholders})`,
                    userIds
                ) as any[];

                profiles?.forEach((p: any) => {
                    profileMap.set(p.user_id, {
                        full_name: p.full_name,
                        avatar_url: p.avatar_url,
                        department: p.department
                    });
                });
            }

            const validJournals: JournalData[] = (karyawanUserIds && karyawanUserIds.size > 0
                ? journals?.filter((j: any) => karyawanUserIds.has(j.user_id))
                : journals)
                ?.slice(0, 5)
                .map((j: any) => {
                    const profile = profileMap.get(j.user_id);
                    return {
                        id: j.id,
                        user_id: j.user_id,
                        full_name: profile?.full_name || "Unknown",
                        avatar_url: profile?.avatar_url,
                        department: profile?.department,
                        content: j.content || "No Content",
                        created_at: j.created_at,
                        date: j.date,
                        status: j.verification_status as JournalData["status"],
                        duration: j.duration
                    };
                }) || [];

            const now = getJakartaDate();
            const hour = now.getHours();
            const needsReminder = hour >= 16;

            const todayJournalsResult = await db.query(
                'SELECT COUNT(*) as count FROM work_journals WHERE created_at >= ? AND created_at <= ?',
                [startIso, endIso]
            ) as any[];
            const todayJournalsCount = todayJournalsResult[0]?.count || 0;

            const journalsFilledToday = todayJournalsCount || 0;
            const totalEmployees = karyawanUserIds?.size || 0;
            const employeesNeedingJournals = Math.max(0, totalEmployees - journalsFilledToday);

            return {
                journals: validJournals,
                needsReminder: needsReminder && employeesNeedingJournals > 0,
                employeesNeedingJournals,
                todayJournalsCount: journalsFilledToday
            };

        },
        refetchInterval: 1000 * 60 * 5,
        staleTime: 1000 * 60 * 2,
    });
};

// Helper: Count working days in a month (Mon-Fri) excluding holidays
function getWorkingDaysInMonth(date: Date, holidayDateSet?: Set<string>): number {
    const year = date.getFullYear();
    const month = date.getMonth();
    const firstDay = new Date(year, month, 1);
    const lastDay = new Date(year, month + 1, 0);

    let workingDays = 0;
    for (let d = new Date(firstDay); d <= lastDay; d.setDate(d.getDate() + 1)) {
        const dayOfWeek = d.getDay();
        const ds = d.toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
        
        if (dayOfWeek !== 0 && dayOfWeek !== 6 && (!holidayDateSet || !holidayDateSet.has(ds))) { 
            workingDays++;
        }
    }
    return workingDays;
}

// Helper
function getDayRangeIso(date: Date) {
    return {
        from: getJakartaStartOfDayISO(date),
        to: getJakartaEndOfDayISO(date)
    };
}

