import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import {
  ArrowLeft, FileText, Calendar, Plus, Clock, CheckCircle2,
  XCircle, AlertCircle, Trash2, ChevronRight, History as HistoryIcon
} from "lucide-react";
import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent } from "@/components/ui/card";
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog";
import { toast } from "@/hooks/use-toast";
import { useAuth } from "@/hooks/useAuth";
import { attendanceRequestsApi } from "@/lib/api";
import { useSystemSettings } from "@/hooks/useSystemSettings";
import { useIsMobile } from "@/hooks/useIsMobile";
import KaryawanWorkspaceLayout from "@/components/layout/KaryawanWorkspaceLayout";
import { formatJakartaDate, toMySQLDateTime } from "@/lib/dateUtils";

const requestSchema = z.object({
  date: z.string().min(1, "Tanggal harus diisi"),
  clock_in: z.string().min(1, "Jam masuk harus diisi"),
  clock_out: z.string().min(1, "Jam pulang harus diisi"),
  reason: z.string().min(5, "Alasan minimal 5 karakter"),
});

type RequestFormData = z.infer<typeof requestSchema>;

interface AttendanceRequest {
  id: string;
  date: string;
  clock_in: string | null;
  clock_out: string | null;
  reason: string | null;
  status: string;
  rejection_reason: string | null;
  created_at: string;
}

const PermohonanAbsen = () => {
  const navigate = useNavigate();
  const { user } = useAuth();
  const isMobile = useIsMobile();
  const [isLoading, setIsLoading] = useState(false);
  const [requests, setRequests] = useState<AttendanceRequest[]>([]);
  const [isFetching, setIsFetching] = useState(true);
  const [dialogOpen, setDialogOpen] = useState(false);

  const form = useForm<RequestFormData>({
    resolver: zodResolver(requestSchema),
    defaultValues: {
      date: formatJakartaDate(new Date(), "yyyy-MM-dd"),
      clock_in: "08:00",
      clock_out: "17:00",
      reason: "",
    },
  });

  useEffect(() => {
    if (user) {
      fetchRequests();
    }
  }, [user]);

  const fetchRequests = async () => {
    if (!user) return;
    try {
      const data = await attendanceRequestsApi.getAll({ user_id: user.id });
      setRequests(data);
    } catch (error) {
      console.error('Error fetching requests:', error);
    } finally {
      setIsFetching(false);
    }
  };

  const onSubmit = async (data: RequestFormData) => {
    if (!user) return;
    setIsLoading(true);

    try {
      // Combine date and time for the API
      const clockInFull = `${data.date} ${data.clock_in}:00`;
      const clockOutFull = `${data.date} ${data.clock_out}:00`;

      await attendanceRequestsApi.create({
        user_id: user.id,
        date: data.date,
        clock_in: clockInFull,
        clock_out: clockOutFull,
        reason: data.reason
      });

      toast({
        title: "Berhasil",
        description: "Permohonan absen Anda telah dikirim.",
      });
      form.reset();
      setDialogOpen(false);
      fetchRequests();
    } catch (error) {
      console.error('Error creating request:', error);
      toast({
        variant: "destructive",
        title: "Gagal",
        description: "Terjadi kesalahan saat mengirim permohonan.",
      });
    } finally {
      setIsLoading(false);
    }
  };

  const getStatusBadge = (status: string) => {
    switch (status) {
      case "approved":
        return <Badge className="bg-emerald-500 text-white gap-1"><CheckCircle2 className="h-3 w-3" />Disetujui</Badge>;
      case "rejected":
        return <Badge className="bg-red-500 text-white gap-1"><XCircle className="h-3 w-3" />Ditolak</Badge>;
      default:
        return <Badge className="bg-amber-500 text-white gap-1"><Clock className="h-3 w-3" />Menunggu</Badge>;
    }
  };

  const formatTime = (timeStr: string | null) => {
    if (!timeStr) return "-";
    try {
      const date = new Date(timeStr);
      return formatJakartaDate(date, "HH:mm");
    } catch (e) {
      // If it's already HH:mm or something else
      return timeStr.substring(11, 16) || timeStr;
    }
  };

  const pageContent = (
    <div className="w-full max-w-5xl mx-auto space-y-8">
      <div className="flex flex-col md:flex-row md:items-end justify-between gap-6">
        <div>
          <h1 className="text-2xl font-extrabold text-slate-800 dark:text-slate-100 tracking-tight">Permohonan Absen</h1>
          <p className="text-slate-500 dark:text-slate-400 font-medium text-sm mt-1">Gunakan form ini jika Anda lupa melakukan absen harian.</p>
        </div>

        <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
          <DialogTrigger asChild>
            <Button className="bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl px-6 h-12 shadow-lg shadow-blue-600/20 gap-2 active:scale-95 transition-all w-full sm:w-auto">
              <Plus className="h-5 w-5" /> Buat Permohonan
            </Button>
          </DialogTrigger>
          <DialogContent className="max-w-md rounded-[24px]">
            <DialogHeader>
              <DialogTitle className="text-xl font-bold">Form Permohonan Absen</DialogTitle>
              <DialogDescription>
                Isi detail absen yang terlewat untuk diajukan ke admin.
              </DialogDescription>
            </DialogHeader>
            <Form {...form}>
              <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4 pt-4">
                <FormField
                  control={form.control}
                  name="date"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="text-xs font-bold uppercase tracking-wider">Tanggal Absen</FormLabel>
                      <FormControl>
                        <Input {...field} type="date" className="rounded-xl h-11" />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />

                <div className="grid grid-cols-2 gap-4">
                  <FormField
                    control={form.control}
                    name="clock_in"
                    render={({ field }) => (
                      <FormItem>
                        <FormLabel className="text-xs font-bold uppercase tracking-wider">Jam Masuk</FormLabel>
                        <FormControl>
                          <Input {...field} type="time" className="rounded-xl h-11" />
                        </FormControl>
                        <FormMessage />
                      </FormItem>
                    )}
                  />
                  <FormField
                    control={form.control}
                    name="clock_out"
                    render={({ field }) => (
                      <FormItem>
                        <FormLabel className="text-xs font-bold uppercase tracking-wider">Jam Pulang</FormLabel>
                        <FormControl>
                          <Input {...field} type="time" className="rounded-xl h-11" />
                        </FormControl>
                        <FormMessage />
                      </FormItem>
                    )}
                  />
                </div>

                <FormField
                  control={form.control}
                  name="reason"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="text-xs font-bold uppercase tracking-wider">Alasan / Keterangan</FormLabel>
                      <FormControl>
                        <Textarea {...field} placeholder="Misal: Lupa klik absen saat datang karena terburu-buru rapat..." rows={3} className="rounded-xl resize-none" />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />

                <div className="flex gap-3 pt-4">
                  <Button type="button" variant="outline" className="flex-1 rounded-xl h-11 font-bold" onClick={() => setDialogOpen(false)}>
                    Batal
                  </Button>
                  <Button type="submit" className="flex-1 rounded-xl h-11 font-bold bg-blue-600 hover:bg-blue-700 text-white" disabled={isLoading}>
                    {isLoading ? "Mengirim..." : "Kirim Sekarang"}
                  </Button>
                </div>
              </form>
            </Form>
          </DialogContent>
        </Dialog>
      </div>

      <div className="grid grid-cols-1 gap-4">
        <h3 className="text-lg font-bold text-slate-800 dark:text-slate-100 flex items-center gap-2">
          <HistoryIcon className="h-5 w-5 text-blue-600" /> Riwayat Permohonan
        </h3>

        {isFetching ? (
          <div className="h-32 flex items-center justify-center">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600" />
          </div>
        ) : requests.length === 0 ? (
          <Card className="border-dashed border-2 py-12 text-center bg-slate-50/50 dark:bg-slate-900/50">
            <CardContent>
              <FileText className="h-12 w-12 text-slate-300 mx-auto mb-4" />
              <p className="text-slate-500 font-medium">Belum ada permohonan absen.</p>
            </CardContent>
          </Card>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {requests.map((req) => (
              <Card key={req.id} className="overflow-hidden border-slate-200 dark:border-slate-800 shadow-sm hover:shadow-md transition-all">
                <CardContent className="p-5">
                  <div className="flex justify-between items-start mb-4">
                    <div>
                      <p className="text-sm font-bold text-slate-800 dark:text-slate-100">
                        {new Date(req.date).toLocaleDateString("id-ID", { weekday: 'long', day: 'numeric', month: 'long', year: 'numeric' })}
                      </p>
                      <p className="text-[10px] uppercase font-black text-slate-400 tracking-tighter mt-0.5">ID: {req.id.substring(0, 8)}</p>
                    </div>
                    {getStatusBadge(req.status)}
                  </div>

                  <div className="grid grid-cols-2 gap-3 mb-4 bg-slate-50 dark:bg-slate-800/50 p-3 rounded-xl border border-slate-100 dark:border-slate-800">
                    <div>
                      <p className="text-[10px] font-bold text-slate-400 uppercase mb-1">Masuk</p>
                      <p className="text-sm font-mono font-bold text-slate-700 dark:text-slate-200">{formatTime(req.clock_in)}</p>
                    </div>
                    <div>
                      <p className="text-[10px] font-bold text-slate-400 uppercase mb-1">Pulang</p>
                      <p className="text-sm font-mono font-bold text-slate-700 dark:text-slate-200">{formatTime(req.clock_out)}</p>
                    </div>
                  </div>

                  <div className="space-y-2">
                    <div className="flex gap-2">
                      <AlertCircle className="h-4 w-4 text-slate-400 shrink-0 mt-0.5" />
                      <p className="text-xs text-slate-600 dark:text-slate-400 italic line-clamp-2">{req.reason}</p>
                    </div>
                    {req.status === "rejected" && req.rejection_reason && (
                      <div className="p-2.5 bg-red-50 dark:bg-red-900/20 rounded-lg text-red-600 dark:text-red-400 text-xs font-medium border border-red-100 dark:border-red-900/30">
                        <strong>Catatan Admin:</strong> {req.rejection_reason}
                      </div>
                    )}
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        )}
      </div>
    </div>
  );

  return (
    <KaryawanWorkspaceLayout>
      {pageContent}
    </KaryawanWorkspaceLayout>
  );
};

export default PermohonanAbsen;
