import { useState, useEffect, useRef } from "react";
import { useNavigate } from "react-router-dom";
import {
  ArrowLeft, Building2, Clock, MapPin, CalendarDays,
  ShieldAlert, RotateCcw, Download, ChevronRight, Database,
  Info, Play, CheckCircle2, AlertCircle, Save, Calendar, Plus, Trash2
} from "lucide-react";
import { useSystemSettings, SystemSettings } from "@/hooks/useSystemSettings";
import { useIsMobile } from "@/hooks/useIsMobile";
import { useAuth } from "@/hooks/useAuth";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Switch } from "@/components/ui/switch";
import { Label } from "@/components/ui/label";
import { Separator } from "@/components/ui/separator";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
} from "@/components/ui/sheet";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from "@/components/ui/alert-dialog";
import { toast } from "@/hooks/use-toast";
import EnterpriseLayout from "@/components/layout/EnterpriseLayout";
import { ADMIN_MENU_SECTIONS } from "@/config/menu";
import { db } from "@/integrations/mysql/client";

// ==========================================
// TYPES & CONSTANTS
// ==========================================
type SettingsSection =
  | "general"
  | "schedule"
  | "attendance"
  | "leaves"
  | "holidays"
  | "system";

const SECTIONS: { id: SettingsSection; label: string; icon: any; description: string }[] = [
  { id: "general", label: "Profil Perusahaan", icon: Building2, description: "Nama dan identitas perusahaan" },
  { id: "schedule", label: "Jam Kerja & Shift", icon: Clock, description: "Jadwal kerja dan batas keterlambatan" },
  { id: "attendance", label: "Aturan Absensi", icon: MapPin, description: "Lokasi, pelacakan GPS, foto" },
  { id: "leaves", label: "Cuti & Izin", icon: CalendarDays, description: "Kuota cuti tahunan" },
  { id: "holidays", label: "Hari Libur", icon: Calendar, description: "Atur hari libur nasional & khusus" },
  { id: "system", label: "Sistem & Data", icon: Database, description: "Backup, arsip, & periode aktif" },
];

// ==========================================
// SUB-COMPONENTS (Moved outside to prevent focus loss)
// ==========================================

const GlassCard = ({ title, description, badge, children, isDanger = false }: any) => (
  <div className={`relative overflow-hidden rounded-[24px] border border-white/10 dark:border-white/[0.05] bg-white/50 dark:bg-slate-900/50 backdrop-blur-xl shadow-sm mb-6 ${isDanger ? 'border-red-500/30 dark:border-red-500/30 shadow-red-500/5' : ''}`}>
    {/* Subtle Inner Glow */}
    <div className="absolute top-0 inset-x-0 h-[1px] bg-gradient-to-r from-transparent via-white/40 dark:via-white/10 to-transparent" />

    <div className="p-6 sm:p-8">
      <div className="flex items-center justify-between mb-8">
        <div>
          <h3 className={`text-lg sm:text-[20px] font-bold tracking-tight mb-1.5 ${isDanger ? 'text-red-600 dark:text-red-400' : 'text-slate-900 dark:text-white'}`}>
            {title}
          </h3>
          <p className="text-[13px] text-slate-500 dark:text-slate-400 font-medium">
            {description}
          </p>
        </div>
        {badge}
      </div>
      <div className="space-y-6">
        {children}
      </div>
    </div>
  </div>
);

const FormFieldPremium = ({ label, description, children }: any) => (
  <div className="space-y-2">
    <div className="flex items-center justify-between">
      <Label className="text-[13px] font-semibold text-slate-700 dark:text-slate-200">
        {label}
      </Label>
    </div>
    {children}
    {description && <p className="text-[12px] text-slate-500 dark:text-slate-400 font-medium leading-relaxed">{description}</p>}
  </div>
);

const FormRowPremium = ({ label, description, children }: any) => (
  <div className="flex flex-row items-center justify-between gap-6 py-1">
    <div className="flex-1 space-y-1">
      <Label className="text-[14px] font-semibold text-slate-800 dark:text-slate-200">
        {label}
      </Label>
      {description && <p className="text-[13px] text-slate-500 dark:text-slate-400">{description}</p>}
    </div>
    <div>
      {children}
    </div>
  </div>
);

const InputPremium = (props: any) => (
  <Input
    {...props}
    className={`h-12 bg-white dark:bg-black/20 border-slate-200 dark:border-white/10 rounded-xl px-4 text-[14px] font-medium placeholder:text-slate-400 focus-visible:ring-2 focus-visible:ring-indigo-500/20 focus-visible:border-indigo-500/50 shadow-inner transition-all ${props.className || ''}`}
  />
);

const FloatingActionBar = ({ onSave, onCancel, isSaving, hasUnsavedChanges }: { onSave: () => void, onCancel: () => void, isSaving: boolean, hasUnsavedChanges: boolean }) => {
  return (
    <div className={`fixed bottom-0 sm:bottom-6 sm:left-1/2 sm:-translate-x-1/2 left-0 right-0 sm:w-[500px] z-[100] transition-all duration-500 transform ${hasUnsavedChanges ? 'translate-y-0 opacity-100' : 'translate-y-20 opacity-0 pointer-events-none'}`}>
      <div className="bg-slate-900/90 dark:bg-white/10 backdrop-blur-2xl sm:rounded-2xl border border-white/10 shadow-[0_10px_40px_rgba(0,0,0,0.3)] p-3 sm:p-4 flex items-center justify-between gap-4">
        <div className="hidden sm:flex items-center gap-3 pl-2">
          <div className="w-10 h-10 rounded-full bg-indigo-500/20 flex items-center justify-center border border-indigo-500/30">
            <Save className="w-5 h-5 text-indigo-400 shrink-0" />
          </div>
          <div>
            <h4 className="text-[13px] font-bold text-white tracking-wide">Perubahan Belum Disimpan</h4>
            <p className="text-[11px] text-slate-400">Anda memiliki perubahan yang belum disimpan</p>
          </div>
        </div>

        <div className="flex items-center gap-3 w-full sm:w-auto">
          <Button variant="ghost" onClick={onCancel} className="flex-1 sm:flex-none h-11 rounded-xl text-slate-300 hover:text-white hover:bg-white/10 font-medium px-4">
            Batal
          </Button>
          <Button onClick={onSave} disabled={isSaving} className="flex-1 sm:flex-none h-11 rounded-xl bg-gradient-to-r from-indigo-500 to-blue-500 hover:from-indigo-600 hover:to-blue-600 text-white shadow-[0_0_20px_rgba(99,102,241,0.4)] font-bold px-8 border border-white/10 relative overflow-hidden group">
            <div className="absolute inset-0 bg-white/20 translate-y-full group-hover:translate-y-0 transition-transform" />
            <span className="relative z-10 flex items-center gap-2">
              {isSaving ? "Menyimpan..." : "Simpan"}
            </span>
          </Button>
        </div>
      </div>
    </div>
  );
};

const Pengaturan = () => {
  const navigate = useNavigate();
  const { user } = useAuth();
  const { settings, isLoading, updateSettings } = useSystemSettings();
  const isMobile = useIsMobile();

  const [formData, setFormData] = useState<SystemSettings>(settings);
  const inputRefs = useRef<Record<string, HTMLInputElement>>({});
  const [activeSection, setActiveSection] = useState<SettingsSection>("general");
  const [activeMobileSheet, setActiveMobileSheet] = useState<SettingsSection | null>(null);

  const [isSaving, setIsSaving] = useState(false);
  const [hasChanges, setHasChanges] = useState(false);
  const [resetDialogOpen, setResetDialogOpen] = useState(false);
  const [resetType, setResetType] = useState<"attendance" | "leaves" | "all">("attendance");
  const [showSaveConfirm, setShowSaveConfirm] = useState(false);

  // Holiday Management State
  const [holidays, setHolidays] = useState<any[]>([]);
  const [isHolidaysLoading, setIsHolidaysLoading] = useState(false);
  const [newHoliday, setNewHoliday] = useState({ date: "", name: "" });

  useEffect(() => {
    setFormData(settings);
    fetchHolidays();
  }, [settings]);

  const fetchHolidays = async () => {
    setIsHolidaysLoading(true);
    try {
      const data = await db.query('SELECT * FROM holidays ORDER BY date ASC') as any[];
      setHolidays(data || []);
    } catch (e) {
      console.error("Fetch holidays fail", e);
    } finally {
      setIsHolidaysLoading(false);
    }
  };

  const handleAddHoliday = async () => {
    if (!newHoliday.date || !newHoliday.name) {
      toast({ variant: "destructive", title: "Data tidak lengkap", description: "Tanggal dan nama hari libur wajib diisi." });
      return;
    }

    try {
      await db.execute(
        'INSERT INTO holidays (id, date, name, is_national) VALUES (UUID(), ?, ?, ?)',
        [newHoliday.date, newHoliday.name, true]
      );
      toast({ title: "Hari Libur Ditambahkan", description: `${newHoliday.name} telah masuk dalam kalender.` });
      setNewHoliday({ date: "", name: "" });
      fetchHolidays();
    } catch (e: any) {
      toast({ variant: "destructive", title: "Gagal Menambah", description: e.message });
    }
  };

  const handleDeleteHoliday = async (id: string) => {
    try {
      await db.execute('DELETE FROM holidays WHERE id = ?', [id]);
      toast({ title: "Hari Libur Dihapus" });
      fetchHolidays();
    } catch (e: any) {
      toast({ variant: "destructive", title: "Gagal Menghapus", description: e.message });
    }
  };

  const handleChange = (key: keyof SystemSettings, value: any) => {
    // For boolean values (Switch components), update state immediately for visual feedback
    if (typeof value === 'boolean') {
      setFormData(prev => ({ ...prev, [key]: value }));
      setHasChanges(true);
    } else {
      // For text/number/date inputs, store in ref to prevent focus loss
      inputRefs.current[key] = value;
      setHasChanges(true);
    }
  };

  const handleBlur = (key: keyof SystemSettings) => {
    const input = inputRefs.current[key];
    if (input) {
      setFormData(prev => ({ ...prev, [key]: input.value }));
      setHasChanges(true);
    }
  };

  const executeSave = async () => {
    setIsSaving(true);
    try {
      // Merge ref values with formData before saving
      const dataToSave = { ...formData, ...inputRefs.current };
      if (dataToSave.companyName.length < 3) throw new Error("Nama perusahaan minimal 3 karakter");

      await updateSettings(dataToSave);

      if (dataToSave.attendanceStartDate !== settings.attendanceStartDate) {
        // Use db.query for attendance_periods (no API endpoint yet)
        const activePeriod = await db.query(
          'SELECT id FROM attendance_periods WHERE is_active = ? LIMIT 1',
          [true]
        ) as any[];

        if (activePeriod && activePeriod.length > 0) {
          await db.query(
            'UPDATE attendance_periods SET start_date = ? WHERE id = ?',
            [dataToSave.attendanceStartDate, activePeriod[0].id]
          );
        }
      }

      toast({
        title: "Konfigurasi Berhasil Disimpan",
        description: "Semua perubahan kebijakan telah diterapkan ke sistem HRIS.",
      });
      setShowSaveConfirm(false);
      
      // Force cleanup
      document.body.style.pointerEvents = 'auto';
      document.body.style.overflow = 'auto';
      
      setTimeout(() => {
        setHasChanges(false);
        setFormData(dataToSave);
        inputRefs.current = {};
        setActiveMobileSheet(null);
        document.body.style.pointerEvents = 'auto';
      }, 100);
    } catch (error: any) {
      toast({
        variant: "destructive",
        title: "Gagal Menyimpan",
        description: error.message || "Terjadi kesalahan.",
      });
      document.body.style.pointerEvents = 'auto';
    } finally {
      setTimeout(() => {
        setIsSaving(false);
        document.body.style.pointerEvents = 'auto';
      }, 200);
    }
  };

  const handleSave = () => setShowSaveConfirm(true);
  const handleCancel = () => {
    setFormData(settings);
    inputRefs.current = {};
    setHasChanges(false);
    setActiveMobileSheet(null);
  };

  // AUDIT & BACKUP (Backend Logic)
  const logAuditAction = async (action: string, description: string) => {
    if (!user) return;
    try {
      // Use db.execute for audit logs (no API endpoint yet)
      await db.execute(
        'INSERT INTO audit_logs (user_id, action, target_table, description) VALUES (?, ?, ?, ?)',
        [user.id, action, 'system_settings', description]
      );
    } catch (e) {
      console.error("Audit fail", e);
    }
  };

  const handleBackupAttendance = async () => {
    setIsSaving(true);
    try {
      toast({ title: "Mempersiapkan Arsip", description: "Menjalankan kompresi data..." });

      await new Promise(res => setTimeout(res, 800)); // Premium delay

      // Use db.query for backup (no API endpoint yet)
      const attendanceData = await db.query(
        'SELECT * FROM attendance ORDER BY clock_in DESC'
      ) as any[];

      const profiles = await db.query('SELECT user_id, full_name, department FROM profiles') as any[];
      const profileMap: Record<string, any> = {};
      profiles?.forEach((p: any) => profileMap[p.user_id] = p);

      const exportData = attendanceData.map(r => ({
        tanggal: new Date(r.clock_in).toLocaleDateString("id-ID"),
        nama: profileMap[r.user_id]?.full_name || "-",
        departemen: profileMap[r.user_id]?.department || "-",
        clock_in: new Date(r.clock_in).toLocaleTimeString("id-ID", { hour: "2-digit", minute: "2-digit" }),
        clock_out: r.clock_out ? new Date(r.clock_out).toLocaleTimeString("id-ID", { hour: "2-digit", minute: "2-digit" }) : "-",
        status: r.status,
        lokasi: r.clock_in_location || "-"
      }));

      const { exportToExcel } = await import("@/lib/exportUtils");
      exportToExcel({
        title: "Backup Data Absensi",
        subtitle: `Diexport pada ${new Date().toLocaleString("id-ID")}`,
        filename: `backup-absensi-${new Date().toISOString().split('T')[0]}`,
        columns: [
          { header: "Tanggal", key: "tanggal", width: 15 },
          { header: "Nama", key: "nama", width: 25 },
          { header: "Departemen", key: "departemen", width: 15 },
          { header: "Clock In", key: "clock_in", width: 10 },
          { header: "Clock Out", key: "clock_out", width: 10 },
          { header: "Status", key: "status", width: 15 },
          { header: "Lokasi", key: "lokasi", width: 30 },
        ],
        data: exportData
      });

      await logAuditAction("BACKUP_ATTENDANCE", "Backup data absensi excel");
      toast({ title: "Backup Selesai", description: `${exportData.length} baris data berhasil diekstrak.` });
    } catch (e: any) {
      toast({ variant: "destructive", title: "Operasi Gagal", description: e.message });
    } finally {
      setIsSaving(false);
    }
  };

  const handleResetAttendance = async () => {
    setIsSaving(true);
    try {
      // Use db.execute for archive (no API endpoint yet)
      await db.execute(
        'UPDATE attendance SET deleted_at = ?, status = ? WHERE deleted_at IS NULL',
        [new Date().toISOString(), 'archived']
      );

      await logAuditAction("ARCHIVE_ATTENDANCE", "Arsipkan semua data absensi");
      toast({ title: "Zona Data Bersih", description: "Database absensi telah diarsipkan (soft delete)." });
    } catch (e: any) {
      toast({ variant: "destructive", title: "Gagal Mengarsipkan", description: e.message });
    } finally {
      setIsSaving(false);
    }
  };

  const handleResetLeave = async () => {
    setIsSaving(true);
    try {
      // Use db.execute for archive (no API endpoint yet)
      await db.execute(
        'UPDATE leave_requests SET status = ?, updated_at = ? WHERE status != ?',
        ['archived', new Date().toISOString(), 'archived']
      );

      await logAuditAction("ARCHIVE_LEAVE", "Arsipkan semua data cuti");
      toast({ title: "Area Cuti Bersih", description: "Penyusutan data (soft delete) berhasil diterapkan." });
    } catch (e: any) {
      toast({ variant: "destructive", title: "Terjadi Kesalahan", description: e.message });
    } finally {
      setIsSaving(false);
    }
  };

  const handleRunAutoClockOut = async () => {
    setIsSaving(true);
    toast({ title: "Cloud Function", description: "Meluncurkan daemon Auto Clock-Out..." });
    try {
      // Find all attendance records where clock_out is null and clock_in is before the auto-clock-out time
      const today = new Date().toISOString().split('T')[0];
      const autoClockOutTime = formData.autoClockOutTime || "22:00";
      const autoClockOutDateTime = `${today}T${autoClockOutTime}:00`;

      // Use db.query for auto clock-out (no API endpoint yet)
      const attendanceToClose = await db.query(
        'SELECT id FROM attendance WHERE clock_out IS NULL AND clock_in < ?',
        [autoClockOutDateTime]
      ) as any[];

      let processedCount = 0;
      for (const record of attendanceToClose) {
        await db.execute(
          'UPDATE attendance SET clock_out = ?, status = ? WHERE id = ?',
          [autoClockOutDateTime, 'auto_clocked_out', record.id]
        );
        processedCount++;
      }

      toast({
        title: "Proses Eksekusi Tuntas",
        description: `Berhasil menormalkan ${processedCount} entitas pekerja.`,
      });
    } catch (error: any) {
      toast({ variant: "destructive", title: "Network Failure", description: error.message });
    } finally {
      setIsSaving(false);
    }
  };




  const renderGeneralSettings = () => (
    <GlassCard title="Identitas Perusahaan" description="Informasi hierarki perusahaan yang tertera di seluruh dokumen operasional.">
      <FormFieldPremium label="Nama Induk Perusahaan" description="Representasi resmi dalam e-sertifikat, PDF absensi, dan watermark.">
        <InputPremium
          defaultValue={formData.companyName}
          onChange={(e: any) => handleChange("companyName", e.target.value)}
          placeholder="PT. Ali Tech"
        />
      </FormFieldPremium>
    </GlassCard>
  );

  const renderScheduleSettings = () => (
    <>
      <GlassCard title="Batas Waktu Dasar (Timeboxing)" description="Parameter dasar operasional yang menentukan status karyawan.">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          <div className="space-y-5 p-5 rounded-2xl bg-indigo-50 dark:bg-indigo-500/5 border border-indigo-100 dark:border-indigo-500/10">
            <h4 className="text-sm font-bold text-indigo-900 dark:text-indigo-300 flex items-center gap-2">
              <Clock className="w-4 h-4" /> Slot Clock-In
            </h4>
            <div className="grid grid-cols-2 gap-4">
              <FormFieldPremium label="Gate Terbuka">
                <InputPremium type="time" defaultValue={formData.clockInStart} onChange={(e: any) => handleChange("clockInStart", e.target.value)} />
              </FormFieldPremium>
              <FormFieldPremium label="Gate Ditutup">
                <InputPremium type="time" defaultValue={formData.clockInEnd} onChange={(e: any) => handleChange("clockInEnd", e.target.value)} />
              </FormFieldPremium>
            </div>
          </div>

          <div className="space-y-5 p-5 rounded-2xl bg-emerald-50 dark:bg-emerald-500/5 border border-emerald-100 dark:border-emerald-500/10">
            <h4 className="text-sm font-bold text-emerald-900 dark:text-emerald-300 flex items-center gap-2">
              <Clock className="w-4 h-4" /> Slot Clock-Out
            </h4>
            <div className="grid grid-cols-2 gap-4">
              <FormFieldPremium label="Boleh Pulang">
                <InputPremium type="time" defaultValue={formData.clockOutStart} onChange={(e: any) => handleChange("clockOutStart", e.target.value)} />
              </FormFieldPremium>
              <FormFieldPremium label="Batas Terakhir">
                <InputPremium type="time" defaultValue={formData.clockOutEnd} onChange={(e: any) => handleChange("clockOutEnd", e.target.value)} />
              </FormFieldPremium>
            </div>
          </div>
        </div>
      </GlassCard>

      <GlassCard title="Atribut Keterlambatan" description="Parameter denda dan perhitungan indikator merah.">
        <FormFieldPremium label="Batas Toleransi (Late Threshold)" description="Melewati detik dari jam ini sistem akan menandai profil berwarna merah.">
          <InputPremium type="time" defaultValue={formData.lateThreshold} onChange={(e: any) => handleChange("lateThreshold", e.target.value)} className="w-[200px]" />
        </FormFieldPremium>
      </GlassCard>
    </>
  );

  const renderAttendanceSettings = () => (
    <GlassCard title="Polisi Kehadiran" description="Syarat mutlak autentikasi bagi perangkat seluler karyawan.">
      <FormRowPremium label="Face / ID Liveness Verification" description="Karyawan diwajibkan menjepret ulang wajah setiap kali melakukan presensi.">
        <Switch checked={formData.requirePhotoOnClockIn} onCheckedChange={(c) => handleChange("requirePhotoOnClockIn", c)} className="data-[state=checked]:bg-indigo-500" />
      </FormRowPremium>

      <div className="h-[1px] w-full bg-slate-200 dark:bg-white/5 my-4" />

      <FormRowPremium label="Geofencing Endpoint" description="Perketat absensi hanya di koordinat IP / GPS satelit kantor pusar/cabang.">
        <Switch checked={formData.enableLocationTracking} onCheckedChange={(c) => handleChange("enableLocationTracking", c)} className="data-[state=checked]:bg-indigo-500" />
      </FormRowPremium>

      <div className="h-[1px] w-full bg-slate-200 dark:bg-white/5 my-4" />

      <FormRowPremium label="Automated Clock-Out Resolver" description="Sistem secara senyap menghitung pulang karyawan yang lupa memencet tombol.">
        <Switch checked={formData.autoClockOut} onCheckedChange={(c) => handleChange("autoClockOut", c)} className="data-[state=checked]:bg-indigo-500" />
      </FormRowPremium>

      {formData.autoClockOut && (
        <div className="mt-4 ml-6 p-5 rounded-xl border border-dashed border-indigo-200 dark:border-indigo-500/30 bg-indigo-50/50 dark:bg-indigo-900/10">
          <FormFieldPremium label="Timer Eksekusi Background (Cron job)">
            <div className="flex items-center gap-4 mt-2">
              <InputPremium type="time" defaultValue={formData.autoClockOutTime} onChange={(e: any) => handleChange("autoClockOutTime", e.target.value)} className="w-[180px]" />
              <Button type="button" variant="outline" onClick={handleRunAutoClockOut} disabled={isSaving} className="h-12 px-6 rounded-xl border-indigo-200 dark:border-indigo-500/40 text-indigo-700 dark:text-indigo-400 hover:bg-indigo-100 dark:hover:bg-indigo-500/20">
                <Play className="w-4 h-4 mr-2" /> Forced Run
              </Button>
            </div>
          </FormFieldPremium>
        </div>
      )}
    </GlassCard>
  );

  const renderLeavesSettings = () => (
    <GlassCard title="Annual Governance" description="Batas penarikan hari istirahat dasar tanpa memo rumah sakit.">
      <FormFieldPremium label="Alokasi Cuti Maksimum">
        <div className="flex items-center gap-3">
          <InputPremium type="number" defaultValue={formData.maxLeaveDays} onChange={(e: any) => handleChange("maxLeaveDays", parseInt(e.target.value) || 0)} className="w-[140px]" />
          <span className="text-sm font-semibold text-slate-500">Hari / Tahun</span>
        </div>
      </FormFieldPremium>
    </GlassCard>
  );

  const renderHolidaysSettings = () => (
    <div className="space-y-6">
      <GlassCard title="Manajemen Hari Libur" description="Atur kalender libur nasional dan khusus perusahaan untuk perhitungan absensi.">
        <div className="bg-slate-50 dark:bg-slate-800/40 p-6 rounded-[20px] border border-slate-200 dark:border-white/5 mb-8">
          <h4 className="text-[14px] font-bold text-slate-900 dark:text-white mb-4 flex items-center gap-2">
            <Plus className="w-4 h-4 text-indigo-500" /> Tambah Hari Libur Baru
          </h4>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 items-end">
            <FormFieldPremium label="Tanggal Libur">
              <InputPremium 
                type="date" 
                value={newHoliday.date} 
                onChange={(e: any) => setNewHoliday(prev => ({ ...prev, date: e.target.value }))}
              />
            </FormFieldPremium>
            <FormFieldPremium label="Nama Hari Libur">
              <InputPremium 
                placeholder="Contoh: Libur Idul Fitri" 
                value={newHoliday.name} 
                onChange={(e: any) => setNewHoliday(prev => ({ ...prev, name: e.target.value }))}
              />
            </FormFieldPremium>
            <Button 
              onClick={handleAddHoliday} 
              className="h-12 rounded-xl bg-indigo-600 hover:bg-indigo-700 text-white font-bold shadow-lg shadow-indigo-500/20 transition-all"
            >
              <Plus className="w-4 h-4 mr-2" /> Simpan Hari Libur
            </Button>
          </div>
        </div>

        <div className="overflow-hidden rounded-2xl border border-slate-200 dark:border-white/5 bg-white dark:bg-transparent">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-slate-50 dark:bg-white/5 border-b border-slate-200 dark:border-white/10">
                <th className="px-6 py-4 text-[13px] font-bold text-slate-500 uppercase tracking-wider w-[180px]">Tanggal</th>
                <th className="px-6 py-4 text-[13px] font-bold text-slate-500 uppercase tracking-wider">Keterangan</th>
                <th className="px-6 py-4 text-[13px] font-bold text-slate-500 uppercase tracking-wider w-[100px] text-center">Aksi</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100 dark:divide-white/5">
              {isHolidaysLoading ? (
                <tr>
                  <td colSpan={3} className="px-6 py-10 text-center text-slate-500 animate-pulse">Memuat data kalender...</td>
                </tr>
              ) : holidays.length === 0 ? (
                <tr>
                  <td colSpan={3} className="px-6 py-10 text-center text-slate-500">Belum ada hari libur yang terdaftar.</td>
                </tr>
              ) : (
                holidays.map((holiday) => (
                  <tr key={holiday.id} className="hover:bg-slate-50/50 dark:hover:bg-white/[0.02] transition-colors group">
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-3">
                        <div className="w-9 h-9 rounded-lg bg-indigo-100 dark:bg-indigo-500/10 flex items-center justify-center text-indigo-600 dark:text-indigo-400">
                          <Calendar className="w-4.5 h-4.5" />
                        </div>
                        <span className="text-[14px] font-bold text-slate-800 dark:text-slate-200">
                          {new Date(holiday.date).toLocaleDateString("id-ID", { day: "2-digit", month: "long", year: "numeric" })}
                        </span>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-[14px] font-medium text-slate-600 dark:text-slate-400">
                      {holiday.name}
                    </td>
                    <td className="px-6 py-4 text-center">
                      <Button 
                        variant="ghost" 
                        size="icon" 
                        onClick={() => handleDeleteHoliday(holiday.id)}
                        className="w-9 h-9 rounded-lg text-slate-400 hover:text-red-600 hover:bg-red-50 dark:hover:bg-red-900/20 transition-all opacity-0 group-hover:opacity-100"
                      >
                        <Trash2 className="w-4 h-4" />
                      </Button>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </GlassCard>
    </div>
  );

  const renderSystemSettings = () => (
    <div className="space-y-6">
      <GlassCard
        title="Base Ledger Timeline"
        description="Pusat kuantum pelaporan. Jika dimodifikasi, seluruh diagram statistik & gaji akan di-rerender."
        badge={<div className="px-3 py-1 rounded-full bg-amber-500/10 text-amber-600 border border-amber-500/20 text-[11px] font-bold tracking-widest uppercase">System Core</div>}
      >
        <FormFieldPremium label="Start Date Finansial">
          <div className="relative max-w-[280px]">
            <InputPremium type="date" defaultValue={formData.attendanceStartDate} onChange={(e: any) => handleChange("attendanceStartDate", e.target.value)} className="pl-12" />
            <CalendarDays className="w-5 h-5 text-indigo-500 absolute left-4 top-3.5" />
          </div>
          <div className="flex items-center gap-2 mt-3 text-[12px] text-amber-600 dark:text-amber-400 font-medium">
            <AlertCircle className="w-4 h-4" /> Modifikasi state ini wajib dilaporkan ke auditor finansial.
          </div>
        </FormFieldPremium>
      </GlassCard>

      <GlassCard title="Cloud Snapshot" description="Enkripsi tarikan pelaporan dalam format standar XLSX.">
        <Button onClick={handleBackupAttendance} disabled={isSaving} className="h-14 w-full md:w-auto px-8 rounded-xl bg-slate-900 hover:bg-slate-800 dark:bg-white dark:text-slate-900 dark:hover:bg-slate-100 font-bold transition-all shadow-md">
          <Download className="w-5 h-5 mr-3" />
          Ekstrak File Absensi (XLSX)
        </Button>
      </GlassCard>

      <GlassCard title="Garbage Collection" description="Protokol penghancuran halus (Soft Delete) entitas kadaluarsa. Hati-hati." isDanger={true}>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <Button variant="outline" onClick={() => { setResetType("attendance"); setResetDialogOpen(true); }} className="h-14 rounded-xl border-red-200 dark:border-red-900/50 hover:bg-red-50 dark:hover:bg-red-900/20 text-red-600 dark:text-red-400 font-semibold group transition-all">
            <RotateCcw className="w-5 h-5 mr-3 group-hover:-rotate-90 transition-transform duration-500" />
            Format Partisi Absensi
          </Button>
          <Button variant="outline" onClick={() => { setResetType("leaves"); setResetDialogOpen(true); }} className="h-14 rounded-xl border-red-200 dark:border-red-900/50 hover:bg-red-50 dark:hover:bg-red-900/20 text-red-600 dark:text-red-400 font-semibold group transition-all">
            <RotateCcw className="w-5 h-5 mr-3 group-hover:-rotate-90 transition-transform duration-500" />
            Format Entitas Cuti
          </Button>
        </div>
      </GlassCard>
    </div>
  );

  const getContent = (section: SettingsSection) => {
    if (isLoading) return <div className="p-8 text-center text-slate-500 font-medium animate-pulse">Menghubungkan ke Node...</div>;
    switch (section) {
      case 'general': return renderGeneralSettings();
      case 'schedule': return renderScheduleSettings();
      case 'attendance': return renderAttendanceSettings();
      case 'leaves': return renderLeavesSettings();
      case 'holidays': return renderHolidaysSettings();
      case 'system': return renderSystemSettings();
      default: return null;
    }
  };

  // ==========================================
  // VIEW STRATEGY
  // ==========================================


  // === Mobile View ===
  if (isMobile) {
    return (
      <div className="min-h-screen bg-[#09090b] text-slate-200 pb-[100px]">
        {/* Mobile Header Hero */}
        <div className="bg-gradient-to-b from-indigo-900/40 to-[#09090b] px-5 pt-12 pb-8 rounded-b-[2.5rem] relative overflow-hidden">
          <div className="absolute inset-0 mix-blend-overlay opacity-10" style={{ backgroundImage: 'url("data:image/svg+xml,%3Csvg viewBox=%220 0 200 200%22 xmlns=%22http://www.w3.org/2000/svg%22%3E%3Cfilter id=%22noiseFilter%22%3E%3CfeTurbulence type=%22fractalNoise%22 baseFrequency=%220.8%22 numOctaves=%223%22 stitchTiles=%22stitch%22/%3E%3C/filter%3E%3Crect width=%22100%25%22 height=%22100%25%22 filter=%22url(%23noiseFilter)%22/%3E%3C/svg%3E")' }} />

          <button onClick={() => navigate("/admin/dashboard")} className="w-10 h-10 rounded-full bg-white/10 backdrop-blur-md flex items-center justify-center mb-6 relative z-10 border border-white/5 active:scale-95 transition-transform">
            <ArrowLeft className="w-5 h-5 text-white" />
          </button>

          <div className="relative z-10">
            <h1 className="text-3xl font-extrabold text-white tracking-tight mb-2">Architect.</h1>
            <p className="text-[13px] text-indigo-200/70 font-medium">Bentuk regulasi sesuai kultur perusahaan.</p>
          </div>
        </div>

        <div className="px-5 space-y-3 mt-4">
          {SECTIONS.map((section) => (
            <div
              key={section.id}
              onClick={() => setActiveMobileSheet(section.id)}
              className="bg-white/5 border border-white/5 backdrop-blur-md rounded-2xl p-4 flex items-center justify-between active:scale-[0.98] active:bg-white/10 transition-all cursor-pointer"
            >
              <div className="flex items-center gap-4 text-left">
                <div className={`w-11 h-11 rounded-xl flex items-center justify-center ${activeMobileSheet === section.id ? 'bg-indigo-500 shadow-lg shadow-indigo-500/20 transform scale-110' : 'bg-slate-800 text-slate-400'} transition-all duration-300`}>
                  <section.icon className={`w-5 h-5 ${activeMobileSheet === section.id ? 'text-white' : ''}`} />
                </div>
                <div>
                  <h3 className="font-bold text-white text-[15px]">{section.label}</h3>
                  <p className="text-[12px] text-slate-400 font-medium line-clamp-1">{section.description}</p>
                </div>
              </div>
              <ChevronRight className="w-5 h-5 text-slate-600" />
            </div>
          ))}
        </div>

        {/* Mobile Edit Sheet */}
        <Sheet open={!!activeMobileSheet} onOpenChange={(open) => {
          if (!open) {
            setActiveMobileSheet(null);
            document.body.style.pointerEvents = 'auto';
            document.body.style.overflow = 'auto';
          }
        }}>
          <SheetContent side="bottom" className="h-[92vh] rounded-t-[32px] p-0 bg-[#09090b] border-t border-white/10 flex flex-col focus:outline-none focus-visible:outline-none">
            <SheetHeader className="p-0 border-b border-white/5">
              <div className="w-12 h-1.5 bg-white/10 rounded-full mx-auto my-3" />
              <div className="px-6 pb-4 flex justify-between items-center text-left">
                <div>
                  <SheetTitle className="text-white text-xl font-bold">{SECTIONS.find(s => s.id === activeMobileSheet)?.label}</SheetTitle>
                  <p className="text-xs text-slate-500 mt-1">Lakukan modifikasi parameter.</p>
                </div>
              </div>
            </SheetHeader>
            <div className="flex-1 overflow-y-auto px-6 py-6 scrollbar-hide">
              {activeMobileSheet && getContent(activeMobileSheet)}
            </div>
          </SheetContent>
        </Sheet>

        <FloatingActionBar 
          onSave={handleSave} 
          onCancel={handleCancel} 
          isSaving={isSaving} 
          hasUnsavedChanges={hasChanges} 
        />

        {/* Modal Confrim (Same for both) */}
        <AlertDialog open={showSaveConfirm} onOpenChange={(open) => {
          setShowSaveConfirm(open);
          if (!open) {
            document.body.style.pointerEvents = 'auto';
            document.body.style.overflow = 'auto';
          }
        }}>
          <AlertDialogContent className="bg-slate-900 border-white/10 rounded-[28px] max-w-sm">
            <AlertDialogHeader>
              <AlertDialogTitle className="text-white text-xl">Deploy Configuration?</AlertDialogTitle>
              <AlertDialogDescription className="text-slate-400 text-sm">
                Perubahan ini akan langsung berdampak ke seluruh sistem karyawan dan kalkulasi riwayat.
              </AlertDialogDescription>
            </AlertDialogHeader>
            <AlertDialogFooter className="mt-6 flex-col sm:flex-row gap-2">
              <AlertDialogCancel className="rounded-xl text-slate-300 hover:text-white hover:bg-white/10 font-medium">Batal</AlertDialogCancel>
              <AlertDialogAction onClick={executeSave} disabled={isSaving} className="rounded-xl bg-gradient-to-r from-indigo-500 to-blue-500 hover:from-indigo-600 hover:to-blue-600 text-white font-bold">
                {isSaving ? "Pushing..." : "Publish Config"}
              </AlertDialogAction>
            </AlertDialogFooter>
          </AlertDialogContent>
        </AlertDialog>

        {/* Confirmation Dialog System Destructive Actions */}
        <AlertDialog open={resetDialogOpen} onOpenChange={(open) => {
          setResetDialogOpen(open);
          if (!open) {
            document.body.style.pointerEvents = 'auto';
            document.body.style.overflow = 'auto';
          }
        }}>
          <AlertDialogContent className="rounded-[28px] dark:bg-slate-900 border-red-500/20 shadow-2xl">
            <AlertDialogHeader>
              <div className="w-14 h-14 bg-red-500/10 flex items-center justify-center rounded-2xl mb-4 border border-red-500/20">
                <ShieldAlert className="w-7 h-7 text-red-500" />
              </div>
              <AlertDialogTitle className="text-2xl text-red-600">Catastrophic Warning</AlertDialogTitle>
              <AlertDialogDescription className="text-base text-slate-600 dark:text-slate-400 mt-2">
                Menghapus struktur <b>{resetType === 'attendance' ? 'Absensi Jaringan' : 'Histori Cuti'}</b> merupakan protokol destruktif tingkat 1.
              </AlertDialogDescription>
            </AlertDialogHeader>
            <AlertDialogFooter className="mt-6 flex-col sm:flex-row gap-3">
              <AlertDialogCancel className="rounded-xl">Batal</AlertDialogCancel>
              <AlertDialogAction onClick={() => {
                if (resetType === 'attendance') handleResetAttendance();
                if (resetType === 'leaves') handleResetLeave();
                setResetDialogOpen(false);
              }} className="rounded-xl bg-red-600 hover:bg-red-700 text-white font-bold">
                Konfirmasi Reset
              </AlertDialogAction>
            </AlertDialogFooter>
          </AlertDialogContent>
        </AlertDialog>
      </div>
    );
  }

  // === Desktop View ===
  return (
    <EnterpriseLayout
      title="Architecture Panel"
      menuSections={ADMIN_MENU_SECTIONS}
      breadcrumbs={[
        { label: "Admin", href: "/admin/dashboard" },
        { label: "Settings" }
      ]}
    >
      <div className="max-w-[1200px] mx-auto pb-32">
        {/* Page Header */}
        <div className="mb-10 flex items-center justify-between">
          <div>
            <h1 className="text-3xl md:text-4xl font-extrabold text-slate-900 dark:text-white tracking-tight leading-none mb-3">
              Application Architecture.
            </h1>
            <p className="text-base text-slate-500 dark:text-slate-400 font-medium">
              Panel mutlak untuk mendesain kebijakan, otentikasi, dan limitasi sistem Enterprise T-Absensi.
            </p>
          </div>

          <div className="hidden md:flex items-center gap-2 px-4 py-2 bg-indigo-50 dark:bg-indigo-500/10 rounded-full border border-indigo-100 dark:border-indigo-500/20">
            <div className="w-2 h-2 rounded-full bg-indigo-500 animate-pulse" />
            <span className="text-xs font-bold text-indigo-700 dark:text-indigo-400 tracking-wider uppercase">Live Environment</span>
          </div>
        </div>

        <div className="flex flex-col lg:flex-row gap-10">
          {/* Smart Sidebar Navigation */}
          <aside className="w-full lg:w-[280px] flex-shrink-0">
            <div className="bg-white/50 dark:bg-white/5 backdrop-blur-xl rounded-[24px] border border-slate-200 dark:border-white/10 shadow-sm p-3 sticky top-24">
              <div className="px-3 pb-3 mb-2 border-b border-slate-100 dark:border-white/5">
                <span className="text-[11px] font-bold text-slate-400 uppercase tracking-widest pl-1">Configuration Scope</span>
              </div>
              <div className="space-y-1.5">
                {SECTIONS.map((section) => {
                  const isActive = activeSection === section.id;
                  return (
                    <button
                      key={section.id}
                      onClick={() => setActiveSection(section.id)}
                      className={`w-full flex items-center justify-between px-4 py-3.5 rounded-xl transition-all duration-300 text-left group ${isActive
                        ? 'bg-gradient-to-r from-indigo-500 to-blue-500 text-white shadow-md shadow-indigo-500/20'
                        : 'text-slate-600 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-white/10'
                        }`}
                    >
                      <div className="flex items-center gap-3.5">
                        <div className={`p-1.5 rounded-lg ${isActive ? 'bg-white/20' : 'bg-slate-200 dark:bg-black/30 group-hover:bg-white/10'} transition-all`}>
                          <section.icon className={`w-4.5 h-4.5 ${isActive ? 'text-white' : 'text-slate-500 dark:text-slate-400 group-hover:text-slate-200'}`} />
                        </div>
                        <span className={`text-[14px] font-semibold ${isActive ? '' : ''}`}>{section.label}</span>
                      </div>

                      {isActive && <ChevronRight className="w-4 h-4 text-white/50" />}
                    </button>
                  );
                })}
              </div>
            </div>
          </aside>

          {/* Main Rendering Canvas */}
          <main className="flex-1 min-w-0 animate-in fade-in slide-in-from-bottom-4 duration-700">
            {getContent(activeSection)}
          </main>
        </div>

        <FloatingActionBar 
          onSave={handleSave} 
          onCancel={handleCancel} 
          isSaving={isSaving} 
          hasUnsavedChanges={hasChanges} 
        />

        {/* Desktop Save Confirm */}
        <AlertDialog open={showSaveConfirm} onOpenChange={(open) => {
          setShowSaveConfirm(open);
          if (!open) {
            document.body.style.pointerEvents = 'auto';
            document.body.style.overflow = 'auto';
          }
        }}>
          <AlertDialogContent className="rounded-[28px] dark:bg-slate-900 border-white/10 shadow-2xl">
            <AlertDialogHeader>
              <div className="w-14 h-14 bg-indigo-500/10 flex items-center justify-center rounded-2xl mb-4 border border-indigo-500/20">
                <Database className="w-7 h-7 text-indigo-500" />
              </div>
              <AlertDialogTitle className="text-2xl dark:text-white">Push to Production?</AlertDialogTitle>
              <AlertDialogDescription className="text-base text-slate-600 dark:text-slate-400 mt-2">
                {formData.attendanceStartDate !== settings.attendanceStartDate ? (
                  <div className="bg-amber-500/10 p-4 rounded-xl border border-amber-500/20 text-amber-700 dark:text-amber-400 font-medium mb-4">
                    <AlertCircle className="inline w-5 h-5 mr-2 -mt-0.5" />
                    System Core Timebox dimodifikasi. Kalkulasi grafik dan riwayat slip akan berubah seluruhnya.
                  </div>
                ) : null}
                Anda sedang mengubah konfigurasi global perusahaan pada basis data (*Cloud Infrastructure*). Yakinkan paramater terisi dengan regulasi resmi.
              </AlertDialogDescription>
            </AlertDialogHeader>
            <AlertDialogFooter className="mt-8">
              <AlertDialogCancel className="rounded-xl h-12 border-slate-200 dark:border-white/10 font-bold px-6 bg-slate-100 dark:bg-white/5 hover:bg-slate-200 dark:hover:bg-white/10">Beri Waktu Cek Lagi</AlertDialogCancel>
              <AlertDialogAction onClick={executeSave} className="rounded-xl h-12 bg-gradient-to-r from-indigo-600 to-blue-600 hover:from-indigo-500 hover:to-blue-500 text-white font-bold px-8 shadow-lg shadow-indigo-500/30">
                <CheckCircle2 className="w-4 h-4 mr-2" />
                Validasi & Terapkan
              </AlertDialogAction>
            </AlertDialogFooter>
          </AlertDialogContent>
        </AlertDialog>

        {/* Confirmation Dialog System Destructive Actions */}
        <AlertDialog open={resetDialogOpen} onOpenChange={(open) => {
          setResetDialogOpen(open);
          if (!open) {
            document.body.style.pointerEvents = 'auto';
            document.body.style.overflow = 'auto';
          }
        }}>
          <AlertDialogContent className="rounded-[28px] dark:bg-slate-900 border-red-500/20 shadow-2xl">
            <AlertDialogHeader>
              <div className="w-14 h-14 bg-red-500/10 flex items-center justify-center rounded-2xl mb-4 border border-red-500/20">
                <ShieldAlert className="w-7 h-7 text-red-500" />
              </div>
              <AlertDialogTitle className="text-2xl text-red-600">Catastrophic Warning</AlertDialogTitle>
              <AlertDialogDescription className="text-base text-slate-600 dark:text-slate-400 mt-2">
                Menghapus struktur <b>{resetType === 'attendance' ? 'Absensi Jaringan' : 'Histori Cuti'}</b> merupakan protokol destruktif tingkat 1.
                Sistem akan memindahkan seluruh data arsip ke *void zone*.
                <br /><br />
                Pihak auditor dapat merekam penekanan tombol ini atas nama Anda. Lanjutkan?
              </AlertDialogDescription>
            </AlertDialogHeader>
            <AlertDialogFooter className="mt-8 relative z-10">
              <AlertDialogCancel className="rounded-xl h-12 border-slate-200 dark:border-white/10 font-bold px-6">Batal Akses</AlertDialogCancel>
              <AlertDialogAction
                className="rounded-xl h-12 bg-red-600 hover:bg-red-700 text-white font-bold px-8 border border-red-800 shadow-[0_0_20px_rgba(220,38,38,0.3)]"
                onClick={() => {
                  if (resetType === 'attendance') handleResetAttendance();
                  if (resetType === 'leaves') handleResetLeave();
                  setResetDialogOpen(false);
                }}
              >
                Konfirmasi Format
              </AlertDialogAction>
            </AlertDialogFooter>
          </AlertDialogContent>
        </AlertDialog>

      </div>
    </EnterpriseLayout>
  );
};

export default Pengaturan;
