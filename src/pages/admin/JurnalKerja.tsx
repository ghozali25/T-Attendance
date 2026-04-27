
import { useState, useEffect, useRef, useCallback } from "react";
import { useQuery, useQueryClient, useInfiniteQuery } from "@tanstack/react-query";
import { useAuth } from "@/hooks/useAuth";
import EnterpriseLayout from "@/components/layout/EnterpriseLayout";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import {
    LayoutDashboard, Users, Clock, BarChart3, Building2, Shield, Key,
    Settings, Database, BookOpen, CheckCircle, Download, FileSpreadsheet, Trash2,
    BookOpenCheck, ClipboardList
} from "lucide-react";
import { ADMIN_MENU_SECTIONS } from "@/config/menu";
import { db } from "@/integrations/mysql/client";
import { journalsApi, profilesApi } from "@/lib/api";
import { toast } from "@/hooks/use-toast";

import { cn } from "@/lib/utils";
// Components
import { JournalCardData } from "@/components/journal/JournalCard";
import { JournalTable } from "@/components/journal/JournalTable";
import { JournalFilters } from "@/components/journal/JournalFilters";
import { JournalReviewDetail } from "@/components/journal/JournalReviewDetail";
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog";

// ========== DATA FETCHING ==========

const ITEMS_PER_PAGE = 20;

const journalQueryKeys = {
    adminList: (status: string, search: string, dept: string, date?: Date) =>
        ['journals', 'admin', 'list', status, search, dept, date] as const,
};

async function fetchAdminJournals({ pageParam = 0, status, search, dept, date }: { pageParam: number, status: string, search: string, dept: string, date?: Date }) {
    const from = pageParam * ITEMS_PER_PAGE;
    const to = from + ITEMS_PER_PAGE - 1;

    try {
        // Use API to get journals
        const allJournals = await journalsApi.getAll();
        if (!allJournals || !Array.isArray(allJournals)) return [];

        let filtered = allJournals.filter((j: any) => {
            if (status !== 'all' && j.verification_status !== status) return false;
            if (date) {
                const start = new Date(date);
                start.setHours(0, 0, 0, 0);
                const end = new Date(date);
                end.setHours(23, 59, 59, 999);
                const journalDate = new Date(j.date);
                if (journalDate < start || journalDate > end) return false;
            }
            if (search && !j.content.toLowerCase().includes(search.toLowerCase())) return false;
            return true;
        });

        // Sort by date descending
        filtered.sort((a: any, b: any) => new Date(b.date).getTime() - new Date(a.date).getTime());

        // Apply pagination
        const paginated = filtered.slice(from, to + 1);

        const userIds = [...new Set(paginated.map((j: any) => j.user_id))];
        
        // Use API to get profiles
        const allProfiles = await profilesApi.getAll();
        const profileMap = new Map<string, any>();
        
        if (allProfiles && Array.isArray(allProfiles)) {
            const filteredProfiles = dept !== 'all' 
                ? allProfiles.filter((p: any) => userIds.includes(p.id) && p.department === dept)
                : allProfiles.filter((p: any) => userIds.includes(p.id));
            
            filteredProfiles.forEach((p: any) => profileMap.set(p.id, p));
        }

        const formattedData = paginated.map((journal: any) => {
            const profile = profileMap.get(journal.user_id);
            if (dept !== 'all' && !profile) return null;

            return {
                ...journal,
                profiles: profile || { full_name: 'Unknown', avatar_url: null, department: '-', position: '-' }
            };
        }).filter(Boolean) as unknown as JournalCardData[];

        return formattedData;
    } catch (error) {
        console.error('Error fetching journals:', error);
        return [];
    }
}

const JurnalKerja = () => {
    const queryClient = useQueryClient();

    // State
    const [selectedIds, setSelectedIds] = useState<string[]>([]);
    const [viewJournal, setViewJournal] = useState<JournalCardData | null>(null);
    const [isDetailOpen, setIsDetailOpen] = useState(false);

    // Filters
    const [search, setSearch] = useState("");
    const [debouncedSearch, setDebouncedSearch] = useState("");
    const [status, setStatus] = useState("all");
    const [department, setDepartment] = useState("all");
    const [date, setDate] = useState<Date | undefined>(undefined);

    // Debounce Search
    useEffect(() => {
        const timer = setTimeout(() => setDebouncedSearch(search), 500);
        return () => clearTimeout(timer);
    }, [search]);

    // Data Fetching
    const {
        data: infiniteData,
        fetchNextPage,
        hasNextPage,
        isFetchingNextPage,
        isLoading: isLoadingList,
    } = useInfiniteQuery({
        queryKey: journalQueryKeys.adminList(status, debouncedSearch, department, date),
        queryFn: ({ pageParam }) => fetchAdminJournals({ pageParam, status, search: debouncedSearch, dept: department, date }),
        initialPageParam: 0,
        getNextPageParam: (lastPage, allPages) => lastPage.length === ITEMS_PER_PAGE ? allPages.length : undefined,
    });

    const allJournals = infiniteData?.pages.flatMap(page => page) || [];

    // Infinite Scroll
    const observer = useRef<IntersectionObserver | null>(null);
    const lastElementRef = useCallback((node: HTMLDivElement) => {
        if (isLoadingList || isFetchingNextPage) return;
        if (observer.current) observer.current.disconnect();
        observer.current = new IntersectionObserver(entries => {
            if (entries[0].isIntersecting && hasNextPage) fetchNextPage();
        });
        if (node) observer.current.observe(node);
    }, [isLoadingList, isFetchingNextPage, hasNextPage, fetchNextPage]);

    // --- Actions ---
    const handleSelect = (id: string, checked: boolean) => {
        if (checked) {
            setSelectedIds(prev => [...prev, id]);
        } else {
            setSelectedIds(prev => prev.filter(item => item !== id));
        }
    };

    const handleSelectAll = (checked: boolean) => {
        if (checked) {
            setSelectedIds(allJournals.map(j => j.id));
        } else {
            setSelectedIds([]);
        }
    };

    const handleBulkApprove = async () => {
        if (selectedIds.length === 0) return;

        try {
            // Use API to approve journals
            for (const id of selectedIds) {
                await journalsApi.update(id, {
                    verification_status: 'approved',
                    status: 'approved'
                });
            }

            toast({ title: "Berhasil", description: `${selectedIds.length} jurnal telah disetujui.` });
            setSelectedIds([]);
            queryClient.invalidateQueries({ queryKey: ['journals', 'admin'] });
        } catch (err: any) {
            toast({ variant: "destructive", title: "Error", description: err.message });
        }
    };

    const handleSingleAction = async (id: string, action: 'approve' | 'reject', reason?: string) => {
        try {
            const updateData: any = {
                verification_status: action === 'approve' ? 'approved' : 'rejected',
                status: action === 'approve' ? 'approved' : 'rejected'
            };

            // Use API to update journal
            await journalsApi.update(id, updateData);

            toast({
                title: "Berhasil",
                description: action === 'approve' ? 'Jurnal telah disetujui.' : 'Jurnal telah ditolak.'
            });
            queryClient.invalidateQueries({ queryKey: ['journals', 'admin'] });

            if (viewJournal?.id === id) {
                setIsDetailOpen(false);
                setViewJournal(null);
            }

        } catch (err: any) {
            toast({ variant: "destructive", title: "Error", description: err.message });
        }
    };

    const menuSections = ADMIN_MENU_SECTIONS;

    // Stats for Insight Bar
    const pendingCount = allJournals.filter(j => j.verification_status === 'pending' || j.verification_status === 'submitted').length;
    const approvedCount = allJournals.filter(j => j.verification_status === 'approved').length;

    // Insights Calculations
    const totalJournals = allJournals.length;
    const approvalRate = totalJournals > 0 ? Math.round((approvedCount / (totalJournals || 1)) * 100) : 0;

    // Calculate unique users
    const uniqueUsersCount = new Set(allJournals.map((j: any) => j.user_id)).size;
    const avgPerUser = uniqueUsersCount > 0 ? Math.round(totalJournals / uniqueUsersCount) : 0;

    return (
        <EnterpriseLayout
            title="Sistem Jurnal Digital"
            subtitle="Pusat aktivitas dan transparansi kerja harian departemen."
            menuSections={menuSections}
            roleLabel="Administrator"
            showRefresh={true}
            showExport={false}
            onRefresh={() => queryClient.invalidateQueries({ queryKey: ['journals', 'admin'] })}
            breadcrumbs={[
                { label: "Admin", href: "/admin/dashboard" },
                { label: "Jurnal Kerja" },
            ]}
        >
            <div className="max-w-[1400px] mx-auto pb-20">

                {/* Summary Insight Bar (SaaS Workspace Style) */}
                <div className="bg-slate-900 text-white rounded-[24px] p-6 mb-8 flex flex-col md:flex-row items-start md:items-center justify-between gap-6 relative overflow-hidden shadow-xl shadow-slate-900/10">
                    <div className="absolute top-0 right-0 w-64 h-64 bg-blue-500/20 rounded-full blur-[80px] pointer-events-none" />
                    <div className="absolute bottom-0 left-10 w-48 h-48 bg-purple-500/20 rounded-full blur-[60px] pointer-events-none" />

                    <div className="relative z-10 flex-1">
                        <h2 className="text-xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-white to-white/70 tracking-tight">
                            Sekilas Area Kerja
                        </h2>
                        <p className="text-slate-400 text-sm mt-1 font-medium max-w-sm">Evaluasi efisiensi tim melalui rasio persetujuan jurnal harian secara real-time.</p>
                    </div>

                    <div className="relative z-10 flex items-center gap-6 md:gap-12 bg-white dark:bg-slate-900/10 backdrop-blur-md rounded-2xl px-8 py-5 border border-white/10">
                        <div className="flex flex-col">
                            <span className="text-slate-400 uppercase tracking-widest text-[10px] font-bold mb-1">Vol. Jurnal</span>
                            <div className="flex items-baseline gap-1.5">
                                <span className="text-2xl font-extrabold text-white">{totalJournals}</span>
                                <span className="text-xs text-slate-300 font-semibold">minggu ini</span>
                            </div>
                        </div>

                        <div className="w-[1px] h-10 bg-white dark:bg-slate-900/20 hidden sm:block" />

                        <div className="flex flex-col">
                            <span className="text-slate-400 uppercase tracking-widest text-[10px] font-bold mb-1">Approval Rate</span>
                            <div className="flex items-baseline gap-1.5">
                                <span className={cn("text-2xl font-extrabold", approvalRate >= 80 ? "text-emerald-400" : "text-amber-400")}>
                                    {approvalRate}%
                                </span>
                                <span className="text-xs text-slate-300 font-semibold">disetujui</span>
                            </div>
                        </div>

                        <div className="w-[1px] h-10 bg-white dark:bg-slate-900/20 hidden sm:block" />

                        <div className="flex flex-col">
                            <span className="text-slate-400 uppercase tracking-widest text-[10px] font-bold mb-1">Produktivitas</span>
                            <div className="flex items-baseline gap-1.5">
                                <span className="text-2xl font-extrabold text-blue-400">~{avgPerUser}</span>
                                <span className="text-xs text-slate-300 font-semibold">/karyawan</span>
                            </div>
                        </div>
                    </div>
                </div>

                {/* FILTERS */}
                <JournalFilters
                    search={search}
                    onSearchChange={setSearch}
                    status={status}
                    onStatusChange={setStatus}
                    department={department}
                    onDepartmentChange={setDepartment}
                    date={date}
                    onDateChange={setDate}
                    onReset={() => {
                        setSearch("");
                        setStatus("all");
                        setDepartment("all");
                        setDate(undefined);
                    }}
                />

                {/* ACTION BAR */}
                {selectedIds.length > 0 && (
                    <div className="flex items-center gap-3 mb-4 p-4 bg-blue-50 rounded-2xl border border-blue-200 animate-in fade-in slide-in-from-top-2 duration-300">
                        <div className="flex items-center gap-2">
                            <Badge className="bg-blue-600 text-white hover:bg-blue-600 h-7 px-3 text-xs font-bold">
                                {selectedIds.length} dipilih
                            </Badge>
                        </div>
                        <Button
                            onClick={handleBulkApprove}
                            size="sm"
                            className="bg-emerald-600 hover:bg-emerald-700 text-white gap-2 rounded-xl h-9 px-4 font-semibold shadow-sm"
                        >
                            <CheckCircle className="w-4 h-4" />
                            Setujui Semua
                        </Button>
                        <Button
                            onClick={() => setSelectedIds([])}
                            variant="ghost"
                            size="sm"
                            className="text-slate-600 dark:text-slate-300 hover:text-slate-800 dark:text-slate-100 rounded-xl h-9"
                        >
                            Batal
                        </Button>
                    </div>
                )}

                {/* TABLE */}
                <JournalTable
                    data={allJournals}
                    selectedIds={selectedIds}
                    onSelect={handleSelect}
                    onSelectAll={handleSelectAll}
                    onView={(journal) => {
                        setViewJournal(journal);
                        setIsDetailOpen(true);
                    }}
                    onApprove={(id) => handleSingleAction(id, 'approve')}
                    onReject={(id) => handleSingleAction(id, 'reject')}
                    isLoading={isLoadingList}
                />

                {/* INFINITE SCROLL SENTINEL */}
                <div ref={lastElementRef} className="h-4" />

                {/* Loading more indicator */}
                {isFetchingNextPage && (
                    <div className="flex justify-center py-6">
                        <div className="flex items-center gap-2 text-sm text-slate-500 dark:text-slate-400">
                            <div className="w-4 h-4 border-2 border-blue-500 border-t-transparent rounded-full animate-spin" />
                            Memuat lebih banyak...
                        </div>
                    </div>
                )}

                {/* DETAIL MODAL */}
                <Dialog open={isDetailOpen} onOpenChange={setIsDetailOpen}>
                    <DialogContent className="max-w-4xl h-[90vh] p-0 overflow-hidden flex flex-col gap-0 rounded-2xl border-slate-200 dark:border-slate-700">
                        <div className="flex-1 overflow-y-auto">
                            <JournalReviewDetail
                                journal={viewJournal}
                                onApprove={async (id) => handleSingleAction(id, 'approve')}
                                onReject={async (id) => handleSingleAction(id, 'reject')}
                                onRequestRevision={async (id) => handleSingleAction(id, 'reject')}
                            />
                        </div>
                    </DialogContent>
                </Dialog>

            </div>
        </EnterpriseLayout>
    );
};

export default JurnalKerja;
