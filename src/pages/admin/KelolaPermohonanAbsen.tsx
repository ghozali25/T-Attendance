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

  return (
    <EnterpriseLayout
      title="Kelola Permohonan Absen"
      subtitle="Verifikasi permohonan absen manual dari karyawan"
      menuSections={menuSections}
      roleLabel={isAdmin ? "Admin" : "Manager"}
    >
      <div className="space-y-6">
        {/* Filter Bar */}
        <div className="flex flex-col md:flex-row gap-4 items-center justify-between bg-white dark:bg-slate-900/70 p-4 rounded-2xl border border-slate-200/60 shadow-sm">
          <div className="relative w-full md:w-96">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-slate-400" />
            <Input 
              placeholder="Cari nama atau departemen..." 
              className="pl-10 h-10 rounded-xl"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
            />
          </div>
          <div className="flex items-center gap-3 w-full md:w-auto">
            <Select value={filterStatus} onValueChange={setFilterStatus}>
              <SelectTrigger className="w-full md:w-[180px] h-10 rounded-xl">
                <SelectValue placeholder="Filter Status" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">Semua Status</SelectItem>
                <SelectItem value="pending">Menunggu</SelectItem>
                <SelectItem value="approved">Disetujui</SelectItem>
                <SelectItem value="rejected">Ditolak</SelectItem>
              </SelectContent>
            </Select>
            <Button variant="outline" size="icon" className="h-10 w-10 rounded-xl shrink-0" onClick={fetchRequests}>
              <HistoryIcon className={cn("h-4 w-4", isLoading && "animate-spin")} />
            </Button>
          </div>
        </div>

        {/* Desktop Table */}
        <Card className="border-slate-200/60 shadow-sm overflow-hidden rounded-[24px]">
          <Table>
            <TableHeader className="bg-slate-50 dark:bg-slate-800/50">
              <TableRow>
                <TableHead className="font-bold">Karyawan</TableHead>
                <TableHead className="font-bold">Tanggal</TableHead>
                <TableHead className="font-bold text-center">Masuk</TableHead>
                <TableHead className="font-bold text-center">Pulang</TableHead>
                <TableHead className="font-bold">Alasan</TableHead>
                <TableHead className="font-bold text-center">Status</TableHead>
                <TableHead className="font-bold text-right">Aksi</TableHead>
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
                      <div className="font-bold text-slate-800 dark:text-slate-100">{req.full_name}</div>
                      <div className="text-[10px] uppercase font-bold text-slate-400">{req.department}</div>
                    </TableCell>
                    <TableCell className="text-sm font-medium">
                      {new Date(req.date).toLocaleDateString("id-ID", { day: 'numeric', month: 'short', year: 'numeric' })}
                    </TableCell>
                    <TableCell className="text-center font-mono text-xs font-bold text-blue-600">{formatTime(req.clock_in)}</TableCell>
                    <TableCell className="text-center font-mono text-xs font-bold text-blue-600">{formatTime(req.clock_out)}</TableCell>
                    <TableCell>
                      <div className="flex items-center gap-2 group relative">
                        <Info className="h-4 w-4 text-slate-400 shrink-0" />
                    <TableCell className="max-w-[200px]">
                        <div className="flex flex-col gap-1">
                          <span className="truncate text-xs text-slate-600 italic">"{req.reason}"</span>
                          {req.attachment_url && (
                            <a 
                              href={req.attachment_url} 
                              target="_blank" 
                              rel="noopener noreferrer"
                              className="flex items-center gap-1 text-[10px] text-blue-600 hover:underline font-medium"
                            >
                              <FileText className="w-3 h-3" /> Lihat Lampiran
                            </a>
                          )}
                        </div>
                    </TableCell>
                    <TableCell className="text-center">
                      {getStatusBadge(req.status)}
                    </TableCell>
                    <TableCell className="text-right">
                      {req.status === 'pending' ? (
                        <div className="flex justify-end gap-2">
                          <Button 
                            variant="ghost" 
                            size="icon" 
                            className="h-8 w-8 text-emerald-600 hover:bg-emerald-50 rounded-lg"
                            onClick={() => { setSelectedRequest(req); setIsProcessOpen(true); }}
                          >
                            <Check className="h-4 w-4" />
                          </Button>
                          <Button 
                            variant="ghost" 
                            size="icon" 
                            className="h-8 w-8 text-red-600 hover:bg-red-50 rounded-lg"
                            onClick={() => { setSelectedRequest(req); setIsRejectOpen(true); }}
                          >
                            <X className="h-4 w-4" />
                          </Button>
                        </div>
                      ) : (
                        <span className="text-[10px] font-bold text-slate-300">DIPROSES</span>
                      )}
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
