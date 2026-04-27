/**
 * useJournalQuery - Enterprise-grade React Query hook for Work Journals
 * 
 * CRITICAL FEATURES:
 * - 10 minute staleTime (no refetch on navigation)
 * - keepPreviousData (no skeleton flash)
 * - Manual refresh only (user-triggered)
 * - Separate cache keys per module (admin vs employee vs manager)
 * 
 * This hook ensures journal data persists across navigation.
 */

import { useQuery, useQueryClient, useMutation } from '@tanstack/react-query';
import { db } from '@/integrations/mysql/client';
import { useAuth } from '@/hooks/useAuth';

// ========== TYPES ==========

export interface JournalData {
    id: string;
    content: string;
    date: string;
    duration: number;
    verification_status: string;
    manager_notes?: string;
    work_result?: 'completed' | 'progress' | 'pending';
    obstacles?: string;
    mood?: '😊' | '😐' | '😣';
    created_at: string;
    updated_at?: string;
    user_id: string;
    profiles?: {
        full_name: string;
        avatar_url: string | null;
        department?: string | null;
        position?: string | null;
    };
}

export interface JournalStats {
    totalToday: number;
    avgDuration: number;
    pendingCount: number;
    approvedCount: number;
    needsRevisionCount: number;
}

interface JournalQueryParams {
    page?: number;
    pageSize?: number;
    status?: string;
    search?: string;
    userId?: string; // For employee view (my journals only)
}

// ========== QUERY KEYS ==========
// Separate keys ensure different modules don't share/override cache

export const journalKeys = {
    // Base key
    all: ['journals'] as const,

    // Admin journals list
    adminList: (params: JournalQueryParams) =>
        [...journalKeys.all, 'admin', 'list', params] as const,

    // Admin stats
    adminStats: () =>
        [...journalKeys.all, 'admin', 'stats'] as const,

    // Employee journals (my journals)
    employeeList: (userId: string, params: JournalQueryParams) =>
        [...journalKeys.all, 'employee', userId, 'list', params] as const,

    // Employee stats
    employeeStats: (userId: string) =>
        [...journalKeys.all, 'employee', userId, 'stats'] as const,

    // Manager journals
    managerList: (params: JournalQueryParams) =>
        [...journalKeys.all, 'manager', 'list', params] as const,

    // Manager stats
    managerStats: () =>
        [...journalKeys.all, 'manager', 'stats'] as const,

    // Single journal detail
    detail: (id: string) =>
        [...journalKeys.all, 'detail', id] as const,
};

// ========== FETCH FUNCTIONS ==========

const ITEMS_PER_PAGE = 15;

async function fetchAdminJournals(params: JournalQueryParams): Promise<JournalData[]> {
    const { page = 0, pageSize = ITEMS_PER_PAGE, status = 'all', search = '' } = params;
    const offset = page * pageSize;
    const limit = pageSize;

    let sql = 'SELECT * FROM work_journals WHERE deleted_at IS NULL';
    const queryParams: any[] = [];

    if (status !== 'all') {
        if (status === 'submitted') {
            sql += ' AND (verification_status = ? OR verification_status = ?)';
            queryParams.push('submitted', 'submitted');
        } else {
            sql += ' AND verification_status = ?';
            queryParams.push(status);
        }
    }

    if (search) {
        sql += ' AND content LIKE ?';
        queryParams.push(`%${search}%`);
    }

    sql += ' ORDER BY date DESC LIMIT ? OFFSET ?';
    queryParams.push(limit, offset);

    const data = await db.query(sql, queryParams) as any[];

    if (!data || data.length === 0) return [];

    const userIds = [...new Set(data.map((j: any) => j.user_id))];
    const placeholders = userIds.map(() => '?').join(',');
    const profiles = await db.query(
        `SELECT user_id, full_name, avatar_url, department, position FROM profiles WHERE user_id IN (${placeholders})`,
        userIds
    ) as any[];

    const profileMap = new Map(profiles?.map((p: any) => [p.user_id, p]) || []);

    return data.map((journal: any) => ({
        ...journal,
        profiles: profileMap.get(journal.user_id) || {
            full_name: 'Unknown',
            avatar_url: null,
            department: null,
            position: null
        }
    })) as JournalData[];
}

async function fetchAdminStats(): Promise<JournalStats> {
    const todayStr = new Date().toISOString().split('T')[0];

    const totalTodayResult = await db.query(
        'SELECT COUNT(*) as count FROM work_journals WHERE deleted_at IS NULL AND date = ?',
        [todayStr]
    ) as any[];
    const totalToday = totalTodayResult[0]?.count || 0;

    const avgDurationResult = await db.query(
        'SELECT AVG(duration) as avg_duration FROM work_journals WHERE deleted_at IS NULL AND date = ?',
        [todayStr]
    ) as any[];
    const avgDuration = Number(avgDurationResult[0]?.avg_duration || 0);

    const pendingCountResult = await db.query(
        'SELECT COUNT(*) as count FROM work_journals WHERE verification_status = ?',
        ['pending']
    ) as any[];
    const pendingCount = pendingCountResult[0]?.count || 0;

    const approvedCountResult = await db.query(
        'SELECT COUNT(*) as count FROM work_journals WHERE verification_status = ?',
        ['approved']
    ) as any[];
    const approvedCount = approvedCountResult[0]?.count || 0;

    const needsRevisionCountResult = await db.query(
        'SELECT COUNT(*) as count FROM work_journals WHERE verification_status = ?',
        ['need_revision']
    ) as any[];
    const needsRevisionCount = needsRevisionCountResult[0]?.count || 0;

    return {
        totalToday,
        avgDuration,
        pendingCount,
        approvedCount,
        needsRevisionCount
    };
}

async function fetchEmployeeJournals(userId: string, params: JournalQueryParams): Promise<JournalData[]> {
    const { page = 0, pageSize = ITEMS_PER_PAGE, status = 'all' } = params;
    const offset = page * pageSize;
    const limit = pageSize;

    let sql = 'SELECT * FROM work_journals WHERE user_id = ? AND deleted_at IS NULL';
    const queryParams: any[] = [userId];

    if (status !== 'all') {
        sql += ' AND verification_status = ?';
        queryParams.push(status);
    }

    sql += ' ORDER BY date DESC LIMIT ? OFFSET ?';
    queryParams.push(limit, offset);

    const data = await db.query(sql, queryParams) as any[];

    return (data || []) as JournalData[];
}

// ========== HOOKS ==========

/**
 * Admin Journal List Hook
 * Cache key: ['journals', 'admin', 'list', params]
 */
export function useAdminJournals(params: JournalQueryParams = {}) {
    return useQuery({
        queryKey: journalKeys.adminList(params),
        queryFn: () => fetchAdminJournals(params),
        staleTime: 10 * 60 * 1000, // 10 minutes
        placeholderData: (previousData) => previousData, // Keep previous data while loading
    });
}

/**
 * Admin Journal Stats Hook
 * Cache key: ['journals', 'admin', 'stats']
 */
export function useAdminJournalStats() {
    return useQuery({
        queryKey: journalKeys.adminStats(),
        queryFn: fetchAdminStats,
        staleTime: 10 * 60 * 1000,
    });
}

/**
 * Employee Journal List Hook
 * Cache key: ['journals', 'employee', userId, 'list', params]
 */
export function useEmployeeJournals(params: JournalQueryParams = {}) {
    const { user } = useAuth();
    const userId = user?.id || '';

    return useQuery({
        queryKey: journalKeys.employeeList(userId, params),
        queryFn: () => fetchEmployeeJournals(userId, params),
        enabled: !!userId,
        staleTime: 10 * 60 * 1000,
        placeholderData: (previousData) => previousData,
    });
}

/**
 * Single Journal Detail Hook
 * Cache key: ['journals', 'detail', id]
 */
export function useJournalDetail(id: string | null) {
    return useQuery({
        queryKey: journalKeys.detail(id || ''),
        queryFn: async () => {
            if (!id) return null;

            const data = await db.query(
                'SELECT id, content, date, duration, user_id, status, verification_status, work_result, obstacles, mood, manager_notes, deleted_at FROM work_journals WHERE id = ?',
                [id]
            ) as any[];

            if (!data || data.length === 0) return null;
            const journal = data[0];

            if (journal.deleted_at) return null;

            const profile = await db.query(
                'SELECT full_name, avatar_url, department, position FROM profiles WHERE user_id = ?',
                [journal.user_id]
            ) as any[];

            return {
                ...journal,
                profiles: profile[0] || {
                    full_name: 'Unknown',
                    avatar_url: null,
                    department: null,
                    position: null
                }
            } as unknown as JournalData;
        },
        enabled: !!id,
        staleTime: 5 * 60 * 1000,
    });
}

/**
 * Hook to invalidate/refresh journal data
 * Call this after create/update/delete operations
 */
export function useJournalInvalidation() {
    const queryClient = useQueryClient();

    return {
        // Invalidate all journal queries
        invalidateAll: () => {
            queryClient.invalidateQueries({ queryKey: journalKeys.all });
        },

        // Invalidate admin journals only
        invalidateAdmin: () => {
            queryClient.invalidateQueries({ queryKey: [...journalKeys.all, 'admin'] });
        },

        // Invalidate employee journals only
        invalidateEmployee: (userId: string) => {
            queryClient.invalidateQueries({ queryKey: [...journalKeys.all, 'employee', userId] });
        },

        // Invalidate single journal detail
        invalidateDetail: (id: string) => {
            queryClient.invalidateQueries({ queryKey: journalKeys.detail(id) });
        },

        // Refresh stats only
        refreshStats: () => {
            queryClient.invalidateQueries({ queryKey: journalKeys.adminStats() });
            queryClient.invalidateQueries({ queryKey: journalKeys.managerStats() });
        },
    };
}

export default {
    useAdminJournals,
    useAdminJournalStats,
    useEmployeeJournals,
    useJournalDetail,
    useJournalInvalidation,
};
