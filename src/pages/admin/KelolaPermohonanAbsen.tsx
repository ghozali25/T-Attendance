import { useState, useEffect, useCallback } from "react";
import { 
  Clock, CheckCircle2, XCircle, AlertCircle, Search, 
  Filter, Calendar, User, Building2, ChevronRight, Check, X,
  FileText, History as HistoryIcon, Info
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { 
  Dialog, 
  DialogContent, 
  DialogDescription, 
  DialogHeader, 
  DialogTitle, 
  DialogFooter 
} from "@/components/ui/dialog";
import { Textarea } from "@/components/ui/textarea";
import { toast } from "@/hooks/use-toast";
import { attendanceRequestsApi } from "@/lib/api";
import { useAuth } from "@/hooks/useAuth";
import EnterpriseLayout from "@/components/layout/EnterpriseLayout";
import { ADMIN_MENU_SECTIONS, MANAGER_MENU_SECTIONS } from "@/config/menu";
import { cn } from "@/lib/utils";
import { formatJakartaDate } from "@/lib/dateUtils";

interface AttendanceRequest {
  id: string;
  user_id: string;
  full_name: string;
  department: string;
  date: string;
  clock_in: string | null;
  clock_out: string | null;
  reason: string | null;
  status: string;
  attachment_url: string | null;
  rejection_reason: string | null;
  created_at: string;
}

const KelolaPermohonanAbsen = () => {
  const { user } = useAuth();
  const isAdmin = user?.role === 'admin';
  const menuSections = isAdmin ? ADMIN_MENU_SECTIONS : MANAGER_MENU_SECTIONS;

  const [requests, setRequests] = useState<AttendanceRequest[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState("");
  const [filterStatus, setFilterStatus] = useState("pending");

  const [selectedRequest, setSelectedRequest] = useState<AttendanceRequest | null>(null);
  const [isProcessOpen, setIsProcessOpen] = useState(false);
  const [isRejectOpen, setIsRejectOpen] = useState(false);
  const [rejectionReason, setRejectionReason] = useState("");
  const [isActionLoading, setIsActionLoading] = useState(false);

  const fetchRequests = useCallback(async () => {
    setIsLoading(true);
    try {
      const data = await attendanceRequestsApi.getAll();
      setRequests(data);
    } catch (error) {
      console.error('Error fetching requests:', error);
      toast({ variant: "destructive", title: "Gagal", description: "Gagal memuat data permohonan." });
    } finally {
      setIsLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchRequests();
  }, [fetchRequests]);

  const handleAction = async (id: string, status: 'approved' | 'rejected', reason?: string) => {
    if (!user) return;
    setIsActionLoading(true);
    try {
      await attendanceRequestsApi.update(id, {
        status,
        approved_by: user.id,
        rejection_reason: reason
      });

      toast({
        title: status === 'approved' ? "Berhasil Disetujui" : "Berhasil Ditolak",
        description: status === 'approved' ? "Data absensi telah diperbarui." : "Permohonan telah ditolak.",
      });
      
      setIsProcessOpen(false);
      setIsRejectOpen(false);
      setRejectionReason("");
      fetchRequests();
    } catch (error) {
      console.error('Action error:', error);
      toast({ variant: "destructive", title: "Gagal", description: "Terjadi kesalahan saat memproses permohonan." });
    } finally {
      setIsActionLoading(false);
    }
  };

  const getStatusBadge = (status: string) => {
    switch (status) {
      case "approved":
        return <Badge className="bg-emerald-100 text-emerald-700 border-emerald-200 gap-1"><CheckCircle2 className="h-3 w-3" />Disetujui</Badge>;
      case "rejected":
        return <Badge className="bg-red-100 text-red-700 border-red-200 gap-1"><XCircle className="h-3 w-3" />Ditolak</Badge>;
      default:
        return <Badge className="bg-amber-100 text-amber-700 border-amber-200 gap-1"><Clock className="h-3 w-3" />Menunggu</Badge>;
    }
  };

  const formatTime = (timeStr: string | null) => {
    if (!timeStr) return "-";
    try {
      const date = new Date(timeStr);
      return formatJakartaDate(date, "HH:mm");
    } catch (e) {
      return timeStr.substring(11, 16) || timeStr;
    }
  };

  const filteredRequests = requests.filter(req => {
    const matchesSearch = req.full_name?.toLowerCase().includes(searchQuery.toLowerCase()) || 
                          req.department?.toLowerCase().includes(searchQuery.toLowerCase());
    const matchesStatus = filterStatus === "all" || req.status === filterStatus;
    return matchesSearch && matchesStatus;
  });

  const stats = {
    total: requests.length,
    pending: requests.filter((r) => r.status === "pending").length,
    approved: requests.filter((r) => r.status === "approved").length,
    rejected: requests.filter((r) => r.status === "rejected").length,
  };

  return (
    <EnterpriseLayout
      title="Kelola Permohonan Absen"
      subtitle="Verifikasi permohonan absen manual dari karyawan"
      menuSections={menuSections}
      roleLabel={isAdmin ? "Admin" : "Manager"}
    >
      <div className="space-y-8 pb-20 animate-in fade-in slide-in-from-bottom-8 duration-700">
        {/* Stats */}
        <div className="grid grid-cols-2 sm:grid-cols-4 gap-5">
          {[
            { icon: FileText, label: "Total", value: stats.total, gradient: "from-indigo-500 to-blue-600", shadow: "shadow-indigo-500/20", bg: "border-indigo-200/40 dark:border-indigo-800/30 bg-gradient-to-br from-white to-indigo-50/30 dark:from-slate-900 dark:to-indigo-950/20", color: "text-indigo-600 dark:text-indigo-400" },
            { icon: Clock, label: "Menunggu", value: stats.pending, gradient: "from-amber-500 to-orange-600", shadow: "shadow-amber-500/20", bg: "border-amber-200/40 dark:border-amber-800/30 bg-gradient-to-br from-white to-amber-50/30 dark:from-slate-900 dark:to-amber-950/20", color: "text-amber-600 dark:text-amber-400" },
            { icon: Check, label: "Disetujui", value: stats.approved, gradient: "from-emerald-500 to-green-600", shadow: "shadow-emerald-500/20", bg: "border-emerald-200/40 dark:border-emerald-800/30 bg-gradient-to-br from-white to-emerald-50/30 dark:from-slate-900 dark:to-emerald-950/20", color: "text-emerald-600 dark:text-emerald-400" },
            { icon: X, label: "Ditolak", value: stats.rejected, gradient: "from-rose-500 to-red-600", shadow: "shadow-rose-500/20", bg: "border-rose-200/40 dark:border-rose-800/30 bg-gradient-to-br from-white to-rose-50/30 dark:from-slate-900 dark:to-rose-950/20", color: "text-rose-600 dark:text-rose-400" },
          ].map((s, i) => (
            <div key={i} className={`group relative p-5 rounded-[24px] border overflow-hidden hover:shadow-lg transition-all duration-300 ${s.bg}`}>
              <div className="absolute top-0 right-0 w-24 h-24 bg-black/[.02] rounded-full blur-2xl -translate-y-1/2 translate-x-1/2 group-hover:scale-125 transition-transform duration-500" />
              <div className="relative flex items-center gap-3.5">
                <div className={`w-11 h-11 rounded-xl bg-gradient-to-br ${s.gradient} flex items-center justify-center shadow-lg ${s.shadow} shrink-0`}>
                  <s.icon className="h-5 w-5 text-white" />
                </div>
                <div>
                  <p className={`text-2xl font-black tracking-tighter ${s.color}`}>{s.value}</p>
                  <p className="text-[10px] text-slate-400 dark:text-slate-500 font-bold uppercase tracking-widest">{s.label}</p>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* Filters */}
        <div className="flex flex-col sm:flex-row gap-4">
          <div className="relative flex-1">
            <Search className="absolute left-4 top-1/2 h-4 w-4 -translate-y-1/2 text-slate-400" />
            <Input
              placeholder="Cari nama, departemen..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="pl-11 h-12 bg-white/90 dark:bg-slate-900/70 backdrop-blur-md border-slate-200/50 dark:border-slate-700/50 rounded-2xl shadow-sm font-semibold text-slate-800 dark:text-slate-100 focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-300"
            />
          </div>
          <Select value={filterStatus} onValueChange={setFilterStatus}>
            <SelectTrigger className="w-full sm:w-[200px] h-12 border-slate-200/50 dark:border-slate-700/50 rounded-2xl bg-white/90 dark:bg-slate-900/70 backdrop-blur-md font-bold">
              <SelectValue placeholder="Filter status" />
            </SelectTrigger>
            <SelectContent className="rounded-xl">
              <SelectItem value="all">Semua Status</SelectItem>
              <SelectItem value="pending">Pending</SelectItem>
              <SelectItem value="approved">Disetujui</SelectItem>
              <SelectItem value="rejected">Ditolak</SelectItem>
            </SelectContent>
          </Select>
        </div>

        {/* Table */}
        <div className="rounded-[28px] border border-slate-200/50 dark:border-slate-800/50 shadow-sm bg-white/90 dark:bg-slate-900/70 backdrop-blur-md overflow-hidden">
          <div className="hidden md:block overflow-x-auto">
            <Table>
              <TableHeader>
                <TableRow className="bg-slate-50/80 dark:bg-slate-800/50 border-b border-slate-100 dark:border-slate-800">
                  <TableHead className="font-black text-slate-400 text-[10px] uppercase tracking-widest py-4">Karyawan</TableHead>
                  <TableHead className="font-black text-slate-400 text-[10px] uppercase tracking-widest text-center">Tanggal</TableHead>
                  <TableHead className="font-black text-slate-400 text-[10px] uppercase tracking-widest text-center">Masuk</TableHead>
                  <TableHead className="font-black text-slate-400 text-[10px] uppercase tracking-widest text-center">Pulang</TableHead>
                  <TableHead className="font-black text-slate-400 text-[10px] uppercase tracking-widest">Alasan</TableHead>
                  <TableHead className="font-black text-slate-400 text-[10px] uppercase tracking-widest text-center">Status</TableHead>
                  <TableHead className="font-black text-slate-400 text-[10px] uppercase tracking-widest text-center">Aksi</TableHead>
                </TableRow>
              </TableHeader>
            <TableBody>
              {isLoading ? (
                [...Array(5)].map((_, i) => (
                  <TableRow key={i}>
                    <TableCell colSpan={7} className="h-16 animate-pulse bg-slate-50/50" />
                  </TableRow>
                ))
              ) : filteredRequests.length === 0 ? (
                <TableRow>
                  <TableCell colSpan={7} className="h-40 text-center text-slate-500">
                    Tidak ada permohonan yang ditemukan.
                  </TableCell>
                </TableRow>
              ) : (
                filteredRequests.map((req) => (
                  <TableRow key={req.id} className="hover:bg-slate-50/50 dark:hover:bg-slate-800/30 transition-colors">
                    <TableCell>
                      <div className="flex items-center gap-3">
                        <div className="h-10 w-10 rounded-xl bg-gradient-to-br from-indigo-100 to-indigo-50 dark:from-indigo-900/50 dark:to-indigo-800/30 flex items-center justify-center shadow-sm shrink-0">
                          <User className="h-4 w-4 text-indigo-600 dark:text-indigo-400" />
                        </div>
                        <div>
                          <p className="font-bold text-slate-800 dark:text-slate-100 text-sm">{req.full_name}</p>
                          <p className="text-[11px] text-slate-400 flex items-center gap-1 font-semibold">
                            <Building2 className="h-3 w-3" />
                            {req.department}
                          </p>
                        </div>
                      </div>
                    </TableCell>
                    <TableCell className="text-center font-semibold text-slate-700 dark:text-slate-200 text-sm">
                      {new Date(req.date).toLocaleDateString("id-ID", { day: 'numeric', month: 'short', year: 'numeric' })}
                    </TableCell>
                    <TableCell className="text-center font-mono text-sm font-bold text-slate-800 dark:text-slate-100">{formatTime(req.clock_in)}</TableCell>
                    <TableCell className="text-center font-mono text-sm font-bold text-slate-800 dark:text-slate-100">{formatTime(req.clock_out)}</TableCell>
                    <TableCell className="max-w-[200px]">
                        <div className="flex flex-col gap-1">
                          <div className="flex items-center gap-2 group relative">
                              <span className="truncate text-xs text-slate-600 italic">{req.reason || "-"}</span>
                          </div>
                          {req.attachment_url && (
                            <button 
                              onClick={(e) => {
                                e.stopPropagation();
                                window.open(req.attachment_url!, '_blank');
                              }}
                              className="flex items-center gap-1 text-[10px] text-blue-600 hover:text-blue-800 hover:underline font-bold mt-1 ml-6 bg-blue-50 px-2 py-0.5 rounded-full w-fit"
                            >
                              <FileText className="w-3 h-3" /> Lihat Lampiran
                            </button>
                          )}
                        </div>
                    </TableCell>
                    <TableCell className="text-center">
                      <div className="flex justify-center">
                        {getStatusBadge(req.status)}
                      </div>
                    </TableCell>
                    <TableCell className="text-center">
                      <div className="flex justify-center gap-2">
                        {req.status === 'pending' ? (
                          <>
                            <Button size="sm" className="gap-1.5 bg-emerald-500 hover:bg-emerald-600 text-white rounded-xl shadow-sm shadow-emerald-500/20 h-9 font-bold text-xs" onClick={() => { setSelectedRequest(req); setIsProcessOpen(true); }}>
                              <Check className="h-3.5 w-3.5" /> Setujui
                            </Button>
                            <Button size="sm" variant="outline" className="gap-1.5 text-rose-600 hover:text-rose-700 hover:bg-rose-50 dark:hover:bg-rose-500/10 border-rose-200 dark:border-rose-800/50 rounded-xl h-9 font-bold text-xs" onClick={() => { setSelectedRequest(req); setIsRejectOpen(true); }}>
                              <X className="h-3.5 w-3.5" /> Tolak
                            </Button>
                          </>
                        ) : (
                          <span className="text-sm text-slate-400 font-medium">—</span>
                        )}
                      </div>
                    </TableCell>
                  </TableRow>
                ))
              )}
            </TableBody>
          </Table>
        </Card>

        {/* Approval Dialog */}
        <Dialog open={isProcessOpen} onOpenChange={setIsProcessOpen}>
          <DialogContent>
            <DialogHeader>
              <DialogTitle>Setujui Permohonan Absen</DialogTitle>
              <DialogDescription>
                Data absensi {selectedRequest?.full_name} untuk tanggal {selectedRequest?.date && new Date(selectedRequest.date).toLocaleDateString("id-ID")} akan diperbarui secara otomatis.
              </DialogDescription>
            </DialogHeader>
            <div className="bg-slate-50 dark:bg-slate-800 p-4 rounded-xl space-y-3">
              <div className="flex justify-between text-sm">
                <span className="text-slate-500">Jam Masuk</span>
                <span className="font-bold text-blue-600">{formatTime(selectedRequest?.clock_in || null)}</span>
              </div>
              <div className="flex justify-between text-sm">
                <span className="text-slate-500">Jam Pulang</span>
                <span className="font-bold text-blue-600">{formatTime(selectedRequest?.clock_out || null)}</span>
              </div>
              <div className="pt-2 border-t border-slate-200">
                <p className="text-[10px] font-bold text-slate-400 uppercase mb-1">Alasan Karyawan</p>
                <p className="text-xs italic text-slate-600">{selectedRequest?.reason}</p>
                {selectedRequest?.attachment_url && (
                  <div className="p-3 bg-slate-50 rounded-xl border border-slate-100 mt-2">
                    <p className="text-[10px] font-bold text-slate-400 uppercase mb-2">Lampiran File</p>
                    {selectedRequest.attachment_url.startsWith('data:image') ? (
                      <img 
                        src={selectedRequest.attachment_url} 
                        alt="Lampiran" 
                        className="max-h-[200px] rounded-lg border border-slate-200 cursor-zoom-in hover:opacity-90 transition-opacity"
                        onClick={() => window.open(selectedRequest.attachment_url!, '_blank')}
                      />
                    ) : (
                      <Button 
                        variant="outline" 
                        size="sm" 
                        className="w-full gap-2 text-xs h-10 rounded-lg"
                        onClick={() => window.open(selectedRequest.attachment_url!, '_blank')}
                      >
                        <FileText className="w-4 h-4" /> Buka Dokumen Pendukung
                      </Button>
                    )}
                  </div>
                )}
              </div>
            </div>
            <DialogFooter className="gap-2 sm:gap-0">
              <Button variant="outline" onClick={() => setIsProcessOpen(false)} disabled={isActionLoading}>Batal</Button>
              <Button className="bg-emerald-600 hover:bg-emerald-700 text-white" onClick={() => handleAction(selectedRequest!.id, 'approved')} disabled={isActionLoading}>
                {isActionLoading ? "Memproses..." : "Konfirmasi & Setujui"}
              </Button>
            </DialogFooter>
          </DialogContent>
        </Dialog>

        {/* Rejection Dialog */}
        <Dialog open={isRejectOpen} onOpenChange={setIsRejectOpen}>
          <DialogContent>
            <DialogHeader>
              <DialogTitle>Tolak Permohonan Absen</DialogTitle>
              <DialogDescription>
                Berikan alasan penolakan untuk permohonan {selectedRequest?.full_name}.
              </DialogDescription>
            </DialogHeader>
            <div className="space-y-4">
              <Textarea 
                placeholder="Misal: Data tidak valid atau sudah ada absensi di tanggal tersebut..." 
                value={rejectionReason}
                onChange={(e) => setRejectionReason(e.target.value)}
                rows={4}
                className="rounded-xl"
              />
            </div>
            <DialogFooter className="gap-2 sm:gap-0">
              <Button variant="outline" onClick={() => setIsRejectOpen(false)} disabled={isActionLoading}>Batal</Button>
              <Button 
                variant="destructive" 
                onClick={() => handleAction(selectedRequest!.id, 'rejected', rejectionReason)}
                disabled={isActionLoading || !rejectionReason.trim()}
              >
                {isActionLoading ? "Memproses..." : "Tolak Permohonan"}
              </Button>
            </DialogFooter>
          </DialogContent>
        </Dialog>
      </div>
    </EnterpriseLayout>
  );
};

export default KelolaPermohonanAbsen;
