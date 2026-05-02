import { addDays, format, isWithinInterval, parseISO } from "date-fns";
import { id } from "date-fns/locale";

export interface DailyAttendanceStatus {
    date: string; // YYYY-MM-DD
    formattedDate: string;
    dayName: string;
    status: 'present' | 'late' | 'early_leave' | 'absent' | 'leave' | 'permission' | 'sick' | 'alpha' | 'holiday' | 'future' | 'weekend';
    clockIn: string | null;
    clockOut: string | null;
    recordId: string | null;
    notes: string | null;
    isWeekend: boolean;
}

export interface LeaveRecord {
    start_date: string;
    end_date: string;
    leave_type: string;
    status: string; // 'approved'
}

/**
 * Generates a complete list of daily attendance statuses for a given period.
 * Automatically fills in missing dates with 'absent', 'weekend', 'future', 'leave', or 'holiday' statuses.
 * USES ASIA/JAKARTA TIMEZONE for comparison.
 */
export const generateAttendancePeriod = (
    startDate: Date,
    endDate: Date,
    records: any[],
    leaves: LeaveRecord[] = [],
    joinDate?: string | Date,
    holidays: any[] = []
): DailyAttendanceStatus[] => {
    const normalized: DailyAttendanceStatus[] = [];

    // Get Today in Jakarta YYYY-MM-DD to strictly determine "Future" vs "Past"
    const todayStr = new Date().toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });

    // Normalize Join Date
    let joinDateStr = '';
    if (joinDate) {
        // If it's a string, assume it's ISO or YYYY-MM-DD. If Date, format it.
        // Created_at is usually ISO string "2024-01-01T..."
        const d = new Date(joinDate);
        if (!isNaN(d.getTime())) {
            joinDateStr = d.toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
        }
    }

    const holidaySet = new Set(holidays.map((h: any) => h.date));

    let currentDate = new Date(startDate);
    currentDate.setHours(0, 0, 0, 0);

    const end = new Date(endDate);
    end.setHours(0, 0, 0, 0);

    while (currentDate <= end) {
        const dateStr = format(currentDate, 'yyyy-MM-dd');
        const dayOfWeek = currentDate.getDay(); // 0 = Sunday, 6 = Saturday

        // 1. Find existing attendance record
        // First try matching via the 'date' column (most reliable for manual entries)
        // Then fallback to normalizing clock_in timestamp to Jakarta timezone
        const record = records.find(r => {
            if (r.date) {
                const recordDate = r.date.includes('T') ? r.date.split('T')[0] : r.date;
                if (recordDate === dateStr) return true;
            }
            if (!r.clock_in) return false;
            const recordDateJakarta = new Date(r.clock_in).toLocaleDateString('en-CA', {
                timeZone: 'Asia/Jakarta'
            });
            return recordDateJakarta === dateStr;
        });

        // Check pre-employment (only if no record exists, to handle dummy data inconsistencies)
        if (!record && joinDateStr && dateStr < joinDateStr) {
            normalized.push({
                date: dateStr,
                formattedDate: format(currentDate, 'd MMMM yyyy', { locale: id }),
                dayName: format(currentDate, 'EEEE', { locale: id }),
                status: 'future', // Use 'future' to signify N/A / Pre-join
                clockIn: null,
                clockOut: null,
                recordId: null,
                notes: 'Belum Bergabung',
                isWeekend: dayOfWeek === 0 || dayOfWeek === 6
            });
            currentDate = addDays(currentDate, 1);
            continue;
        }



        // 2. Find Approved Leave
        // Check if dateStr is within any leave range
        const leave = leaves.find(l => {
            if (l.status !== 'approved') return false;
            const start = new Date(l.start_date).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
            const end = new Date(l.end_date).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
            return dateStr >= start && dateStr <= end;
        });

        // 3. Check if it's a holiday
        const holiday = holidays.find((h: any) => {
            const hDate = new Date(h.date).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
            return hDate === dateStr;
        });

        let status: DailyAttendanceStatus['status'] = 'absent';
        const isWeekend = dayOfWeek === 0 || dayOfWeek === 6;

        // --- STATUS DETERMINATION LOGIC ---

        if (record) {
            status = (record.status as any) || 'present';
        } else if (leave) {
            status = 'leave';
        } else if (holiday) {
            status = 'holiday';
        } else {
            // Comparison: dateStr vs todayStr
            if (dateStr > todayStr) {
                status = 'future';
            } else if (dateStr === todayStr) {
                // Today with no record yet -> Mark as absent (alpha) if not weekend
                if (isWeekend) {
                    status = 'weekend';
                } else {
                    status = 'alpha'; // Use 'alpha' for today's unclocked employees
                }
            } else if (isWeekend) {
                status = 'weekend';
            } else {
                // Past day (strictly < today), no record, not qualified leave, not weekend, not holiday -> ABSENT
                status = 'absent';
            }
        }

        normalized.push({
            date: dateStr,
            formattedDate: format(currentDate, 'd MMMM yyyy', { locale: id }),
            dayName: format(currentDate, 'EEEE', { locale: id }),
            status,
            clockIn: record?.clock_in || null,
            clockOut: record?.clock_out || null,
            recordId: record?.id || null,
            notes: record?.notes || (leave ? `Cuti: ${leave.leave_type}` : (holiday ? `Libur: ${holiday.name}` : null)),
            isWeekend
        });

        currentDate = addDays(currentDate, 1);
    }

    return normalized;
};
