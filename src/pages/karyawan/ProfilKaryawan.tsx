import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { ArrowLeft, User, Phone, MapPin, Building2, Briefcase, Save, Mail, ChevronRight, LogOut, Key, Camera, Lock, QrCode } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form";
import { Textarea } from "@/components/ui/textarea";
import { toast } from "@/hooks/use-toast";
import { useAuth } from "@/hooks/useAuth";
import { db } from "@/integrations/mysql/client";
import { profilesApi } from "@/lib/api";
import { useIsMobile } from "@/hooks/use-mobile";
import MobileNavigation from "@/components/MobileNavigation";
import KaryawanWorkspaceLayout from "@/components/layout/KaryawanWorkspaceLayout";
import EnterpriseLayout from "@/components/layout/EnterpriseLayout";
import { ADMIN_MENU_SECTIONS, MANAGER_MENU_SECTIONS } from "@/config/menu";
import { cn } from "@/lib/utils";

const profileSchema = z.object({
  full_name: z.string().min(2, "Nama minimal 2 karakter"),
  phone: z.string().optional(),
  address: z.string().optional(),
  department: z.string().optional(),
  position: z.string().optional(),
  avatar_url: z.string().optional(),
});

type ProfileFormData = z.infer<typeof profileSchema>;

interface Profile {
  id: string;
  user_id: string;
  full_name: string | null;
  phone: string | null;
  address: string | null;
  department: string | null;
  position: string | null;
  join_date: string | null;
  avatar_url: string | null;
}

const ProfilKaryawan = () => {
  const navigate = useNavigate();
  const { user, signOut, updateUser } = useAuth();
  const isMobile = useIsMobile();
  const [isLoading, setIsLoading] = useState(false);
  const [isFetching, setIsFetching] = useState(true);
  const [profile, setProfile] = useState<Profile | null>(null);

  const form = useForm<ProfileFormData>({
    resolver: zodResolver(profileSchema),
    defaultValues: { full_name: "", phone: "", address: "", department: "", position: "", avatar_url: "" },
  });

  useEffect(() => { if (user) fetchProfile(); }, [user]);

  const fetchProfile = async () => {
    if (!user) return;
    try {
      // Use API to get profile by user ID
      const userProfile = await profilesApi.getById(user.id);

      if (userProfile) {
        setProfile(userProfile);
        if (userProfile.avatar_url) {
          updateUser({ avatar_url: userProfile.avatar_url });
        }
        form.reset({
          full_name: userProfile.full_name || "",
          phone: userProfile.phone || "",
          address: userProfile.address || "",
          department: userProfile.department || "",
          position: userProfile.position || "",
          avatar_url: userProfile.avatar_url || "",
        });
      } else {
        // Handle no profile case (e.g., redirect or show message)
      }
    } catch (error) {
      console.error('Error fetching profile:', error);
    } finally {
      setIsFetching(false);
    }
  };

  const handleImageUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) {
      if (file.size > 5 * 1024 * 1024) {
        toast({ variant: "destructive", title: "File terlalu besar", description: "Maksimal ukuran foto adalah 5MB" });
        return;
      }
      const reader = new FileReader();
      reader.onload = (event) => {
        const img = new Image();
        img.onload = () => {
          const size = Math.min(img.width, img.height);
          const startX = (img.width - size) / 2;
          const startY = (img.height - size) / 2;
          
          const canvas = document.createElement('canvas');
          const targetSize = Math.min(size, 400); 
          canvas.width = targetSize;
          canvas.height = targetSize;
          
          const ctx = canvas.getContext('2d');
          if (ctx) {
            ctx.drawImage(img, startX, startY, size, size, 0, 0, targetSize, targetSize);
            const base64String = canvas.toDataURL('image/jpeg', 0.85);
            setProfile(prev => prev ? { ...prev, avatar_url: base64String } : null);
            form.setValue("avatar_url", base64String);
          }
        };
        img.src = event.target?.result as string;
      };
      reader.readAsDataURL(file);
    }
  };

  const onSubmit = async (data: ProfileFormData) => {
    if (!user) return;
    setIsLoading(true);
    try {
      // Use API to update profile
      await profilesApi.update(user.id, {
        full_name: data.full_name,
        phone: data.phone || null,
        address: data.address || null,
        avatar_url: data.avatar_url || null
      });
      if (data.avatar_url || data.full_name) {
        updateUser({ 
          avatar_url: data.avatar_url || profile?.avatar_url, 
          full_name: data.full_name 
        });
      }
      toast({ title: "Profil berhasil disimpan", description: "Data profil Anda telah diperbarui." });
    } catch (error) {
      console.error('Error updating profile:', error);
      toast({ variant: "destructive", title: "Gagal menyimpan profil", description: "Terjadi kesalahan saat menyimpan profil." });
    } finally {
      setIsLoading(false);
    }
  };

  const handleLogout = async () => {
    await signOut();
    toast({ title: "Logout berhasil", description: "Sampai jumpa kembali!" });
    navigate("/auth");
  };

  if (isFetching) {
    return <div className="flex min-h-screen items-center justify-center bg-slate-50 dark:bg-slate-800"><div className="h-8 w-8 animate-spin rounded-full border-4 border-slate-200 dark:border-slate-700 border-t-blue-600" /></div>;
  }

  // ==========================================
  // MOBILE VIEW
  // ==========================================
  if (isMobile) {
    return (
      <div className="min-h-screen bg-[#F1F5F9] dark:bg-[#0F172A] pb-[120px] font-sans selection:bg-blue-200 relative overflow-hidden">
        {/* Dynamic Background */}
        <div className="absolute top-0 inset-x-0 h-64 bg-gradient-to-b from-slate-200/50 dark:from-slate-800/50 to-transparent pointer-events-none" />

        {/* Header - Transparent/Minimalist */}
        <div className="pt-[max(env(safe-area-inset-top),32px)] px-6 pb-4 bg-transparent flex justify-between items-center z-10 relative">
          <h1 className="text-[26px] font-black tracking-tighter text-slate-800 dark:text-white">Identitas</h1>
          <button onClick={handleLogout} className="w-10 h-10 rounded-full bg-white dark:bg-slate-800 shadow-sm flex items-center justify-center text-red-500 active:scale-90 transition-transform border border-slate-200/50 dark:border-slate-700/50">
            <LogOut className="w-4 h-4 ml-0.5" />
          </button>
        </div>

        {/* Stacked Cards Wallet Style */}
        <div className="px-6 relative mt-2 [perspective:1000px]">
          {/* Card 1: ID Card (Front) */}
          <div className="relative z-30 transform transition-all duration-300 rounded-[28px] overflow-hidden shadow-[0_20px_40px_-15px_rgba(0,0,0,0.3)] border-[0.5px] border-white/20 active:scale-[0.98]">
            {/* Glass Background / Gradient */}
            <div className="absolute inset-0 bg-gradient-to-br from-[#0f172a] via-[#1e293b] to-[#0f172a] dark:from-[#020617] dark:via-[#0f172a] dark:to-[#020617]" />
            <div className="absolute top-0 right-0 w-64 h-64 bg-indigo-500/10 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2 pointer-events-none" />
            <div className="absolute bottom-0 left-0 w-48 h-48 bg-blue-500/10 rounded-full blur-3xl translate-y-1/2 -translate-x-1/2 pointer-events-none" />

            <div className="relative p-7 pt-8 pb-8 flex flex-col items-center text-center">
              <div className="absolute top-4 left-5 flex items-center gap-1.5 opacity-60">
                <div className="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse shadow-[0_0_8px_rgba(52,211,153,0.8)]" />
                <span className="text-[9px] font-extrabold text-white uppercase tracking-widest">ID Aktif</span>
              </div>
              <div className="absolute top-4 right-5 text-white/30">
                <Building2 className="w-5 h-5" />
              </div>

              <div className="relative mb-5 mt-4">
                <div className="w-[88px] h-[88px] rounded-full border-[3px] border-white/10 bg-slate-800/50 backdrop-blur-md flex items-center justify-center overflow-hidden shadow-2xl">
                  {profile?.avatar_url ? (
                    <img src={profile.avatar_url} alt="Profile" className="w-full h-full object-cover" />
                  ) : profile?.full_name ? (
                    <span className="text-4xl font-black text-white">{profile.full_name.charAt(0)}</span>
                  ) : (
                    <User className="w-8 h-8 text-white/50" />
                  )}
                </div>
                <div 
                  className="absolute -bottom-1 -right-1 w-8 h-8 bg-indigo-500 rounded-full border-[3px] border-[#1e293b] flex items-center justify-center shadow-lg active:scale-90 transition-transform cursor-pointer"
                  onClick={() => document.getElementById('avatar-upload-mobile')?.click()}
                >
                  <Camera className="w-3.5 h-3.5 text-white" />
                  <input 
                    id="avatar-upload-mobile" 
                    type="file" 
                    accept="image/*" 
                    className="hidden" 
                    onChange={handleImageUpload} 
                  />
                </div>
              </div>

              <h2 className="text-[24px] font-black text-white tracking-tight mb-1">{profile?.full_name || "Nama Karyawan"}</h2>
              <p className="text-[11px] font-bold text-indigo-300/80 tracking-widest uppercase mb-1">{profile?.position || "Karyawan"}</p>
              <div className="flex items-center gap-2 mt-1">
                <span className="px-2.5 py-[3px] rounded-full border border-white/20 bg-white/5 text-[9px] font-semibold text-white/70 backdrop-blur-sm">
                  {profile?.department || "Dept. Kosong"}
                </span>
              </div>

              <div className="mt-8 pt-5 w-full flex justify-between items-end border-t border-white/10">
                <div className="text-left">
                  <p className="text-[9px] text-white/40 uppercase tracking-widest font-black mb-1">Terdaftar Sejak</p>
                  <p className="text-[11px] text-white/90 font-bold">{profile?.join_date ? new Date(profile.join_date).toLocaleDateString("id-ID", { year: 'numeric', month: 'short' }) : "-"}</p>
                </div>
                <div className="text-right">
                  <p className="text-[9px] text-white/40 uppercase tracking-widest font-black mb-1">Employee ID</p>
                  <p className="text-[13px] text-white font-mono font-bold tracking-wider opacity-90 drop-shadow-sm">TLN-{profile?.user_id?.substring(0, 6).toUpperCase()}</p>
                </div>
              </div>
            </div>
          </div>

          {/* Card 2: QR Code / Back */}
          <div className="relative z-20 -mt-[48px] transform origin-top translate-y-6 scale-[0.92] rounded-[28px] overflow-hidden shadow-[0_10px_30px_-15px_rgba(0,0,0,0.15)] border border-slate-200/60 dark:border-slate-700/60 bg-white/90 dark:bg-slate-800/90 backdrop-blur-xl px-6 pt-[72px] pb-7">
            <div className="flex flex-col items-center">
              <p className="text-[9px] font-black text-slate-400 dark:text-slate-500 uppercase tracking-widest mb-3">Kode Akses Digital</p>
              <div className="bg-white p-3.5 rounded-2xl shadow-sm border border-slate-200/80 hover:scale-105 transition-transform active:scale-95 duration-300">
                <QrCode className="w-20 h-20 text-slate-900" strokeWidth={1.5} />
              </div>
              <p className="text-[9px] font-bold text-slate-400 text-center mt-3 tracking-wide">Tunjukkan kode untuk absen offline</p>
            </div>
          </div>
        </div>

        {/* Data Formulir Bawah */}
        <div className="px-6 mt-14 space-y-5">
          <Form {...form}>
            <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4">
              <div className="bg-white/80 dark:bg-slate-900/80 backdrop-blur-md rounded-[24px] p-5 shadow-[0_2px_10px_rgba(0,0,0,0.02)] border border-slate-200/50 dark:border-slate-800/80 space-y-4">
                <div className="flex items-center justify-between mb-3 border-b border-slate-100 dark:border-slate-800 pb-3">
                  <div className="flex items-center gap-2">
                    <User className="w-4 h-4 text-indigo-600 dark:text-indigo-400" />
                    <h3 className="text-[11px] font-black text-slate-700 dark:text-slate-200 uppercase tracking-widest">Detail Kontak</h3>
                  </div>
                </div>

                <FormField control={form.control} name="phone" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="text-[10px] font-black text-slate-400 dark:text-slate-500 uppercase tracking-wider">No. Handphone</FormLabel>
                    <FormControl>
                      <div className="relative group">
                        <Phone className="absolute top-1/2 -translate-y-1/2 left-3.5 w-4 h-4 text-slate-400 group-focus-within:text-indigo-500 transition-colors" />
                        <Input {...field} placeholder="08..." className="h-12 pl-10 border-slate-200/80 dark:border-slate-700/80 rounded-xl bg-slate-50/50 dark:bg-slate-800/30 font-semibold focus:bg-white dark:focus:bg-slate-900 shadow-sm transition-colors text-sm" />
                      </div>
                    </FormControl>
                  </FormItem>
                )} />

                <FormField control={form.control} name="address" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="text-[10px] font-black text-slate-400 dark:text-slate-500 uppercase tracking-wider">Alamat Lengkap</FormLabel>
                    <FormControl>
                      <div className="relative group">
                        <MapPin className="absolute top-4 left-3.5 w-4 h-4 text-slate-400 group-focus-within:text-indigo-500 transition-colors" />
                        <Textarea {...field} placeholder="Jalan..." className="min-h-[90px] pt-4 pl-10 border-slate-200/80 dark:border-slate-700/80 rounded-xl bg-slate-50/50 dark:bg-slate-800/30 font-semibold focus:bg-white dark:focus:bg-slate-900 shadow-sm transition-colors text-sm resize-none" />
                      </div>
                    </FormControl>
                  </FormItem>
                )} />
              </div>

              <div className="flex gap-3">
                <button type="button" onClick={() => navigate("/edit-password")} className="flex-1 h-[52px] rounded-[16px] bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 flex items-center justify-center gap-2 text-sm font-bold shadow-sm active:scale-95 transition-all text-slate-700 dark:text-slate-300">
                  <Key className="w-[18px] h-[18px] text-slate-400" />
                </button>
                <Button type="submit" disabled={isLoading} className="flex-[3] h-[52px] rounded-[16px] bg-indigo-600 hover:bg-indigo-700 text-white flex items-center justify-center gap-2 text-[15px] font-bold shadow-[0_8px_20px_rgba(79,70,229,0.25)] active:scale-95 transition-all">
                  {isLoading ? <div className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" /> : <><Save className="w-[18px] h-[18px]" /> Simpan Data</>}
                </Button>
              </div>
            </form>
          </Form>
        </div>

        <MobileNavigation />
      </div>
    );
  }

  // DESKTOP VIEW
  if (user?.role === 'admin' || user?.role === 'manager') {
    return (
      <EnterpriseLayout
        title="Profil Saya"
        subtitle="Kelola detail informasi pribadi dan pengaturan akun Anda."
        roleLabel={user.role === 'admin' ? "Administrator" : "Manager"}
        menuSections={user.role === 'admin' ? ADMIN_MENU_SECTIONS : MANAGER_MENU_SECTIONS}
      >
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 pb-10">
          {/* Left: Identity Card */}
          <div className="lg:col-span-1 h-fit bg-white/50 dark:bg-slate-900/50 backdrop-blur-xl rounded-[28px] border border-slate-200 dark:border-white/10 shadow-sm overflow-hidden">
            <div className="bg-gradient-to-br from-indigo-600 to-blue-700 h-28 relative flex justify-center">
              <div className="absolute inset-0 bg-[url('https://grainy-gradients.vercel.app/noise.svg')] opacity-20 brightness-100 mix-blend-overlay"></div>
              <div className="absolute -bottom-12">
                <div className="h-24 w-24 rounded-full bg-white dark:bg-slate-900 flex items-center justify-center text-slate-400 border-4 border-white dark:border-slate-800 shadow-lg relative">
                  <span className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">{profile?.full_name?.charAt(0) || "U"}</span>
                  <div className="absolute bottom-0 right-0 h-8 w-8 bg-blue-600 rounded-full border-2 border-white flex items-center justify-center shadow-md active:scale-95 transition-transform cursor-pointer">
                    <Camera className="h-4 w-4 text-white" />
                  </div>
                </div>
              </div>
            </div>

            <div className="pt-16 pb-6 px-6 flex flex-col items-center text-center">
              <h2 className="text-xl font-extrabold text-slate-800 dark:text-slate-100 tracking-tight">{profile?.full_name}</h2>
              <span className="inline-block mt-1.5 px-3 py-1 rounded-full bg-blue-50 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 text-xs font-bold border border-blue-100 dark:border-blue-800/50 uppercase tracking-wider">
                {user.role === 'admin' ? "Administrator" : "Manager"}
              </span>

              <div className="w-full border-t border-slate-100 dark:border-white/5 my-6" />

              <div className="w-full space-y-4 text-left">
                <div className="bg-slate-50/50 dark:bg-white/5 p-3 rounded-xl border border-slate-100 dark:border-white/5">
                  <p className="text-[10px] text-slate-400 uppercase font-bold tracking-widest mb-1">Email Aktif</p>
                  <p className="text-sm text-slate-800 dark:text-slate-100 font-semibold flex items-center gap-2"><Mail className="w-4 h-4 text-slate-400" />{user?.email}</p>
                </div>
              </div>

              <div className="w-full mt-8 space-y-3">
                <Button variant="outline" className="w-full justify-between h-12 rounded-xl border-slate-200 dark:border-slate-800 shadow-sm font-bold text-slate-700 dark:text-slate-200 hover:bg-slate-50 dark:bg-slate-800" onClick={() => navigate("/edit-password")}>
                  Ubah Password <Key className="h-[18px] w-[18px] text-slate-400" />
                </Button>
                <Button variant="ghost" className="w-full justify-between h-12 rounded-xl text-red-600 hover:text-red-700 hover:bg-red-50 border border-transparent hover:border-red-100 font-bold" onClick={handleLogout}>
                  Keluar Akun <LogOut className="h-[18px] w-[18px]" />
                </Button>
              </div>
            </div>
          </div>

          {/* Right: Detailed Form */}
          <div className="lg:col-span-2 bg-white/50 dark:bg-slate-900/50 backdrop-blur-xl rounded-[28px] border border-slate-200 dark:border-white/10 shadow-sm p-8">
            <div className="mb-8">
              <h2 className="text-xl font-extrabold text-slate-800 dark:text-slate-100 tracking-tight">Informasi Pribadi</h2>
              <p className="text-sm text-slate-500 dark:text-slate-400 font-medium mt-1">Perbarui data diri Anda untuk keperluan administrasi.</p>
            </div>

            <Form {...form}>
              <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <FormField control={form.control} name="full_name" render={({ field }) => (
                    <FormItem>
                      <FormLabel className="text-xs font-bold text-slate-700 dark:text-slate-200 uppercase tracking-widest">Nama Lengkap</FormLabel>
                      <FormControl><Input {...field} className="h-12 bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 rounded-xl focus:ring-indigo-500/20 font-medium text-slate-800 dark:text-slate-100" /></FormControl>
                      <FormMessage />
                    </FormItem>
                  )} />
                  <FormField control={form.control} name="phone" render={({ field }) => (
                    <FormItem>
                      <FormLabel className="text-xs font-bold text-slate-700 dark:text-slate-200 uppercase tracking-widest">No. Handphone</FormLabel>
                      <FormControl>
                        <div className="relative">
                          <Phone className="absolute left-3.5 top-3.5 h-[18px] w-[18px] text-slate-400" />
                          <Input {...field} placeholder="08..." className="pl-10 h-12 bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 rounded-xl focus:ring-indigo-500/20 font-medium text-slate-800 dark:text-slate-100" />
                        </div>
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )} />
                </div>

                <FormField control={form.control} name="address" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="text-xs font-bold text-slate-700 dark:text-slate-200 uppercase tracking-widest">Alamat</FormLabel>
                    <FormControl>
                      <div className="relative">
                        <MapPin className="absolute left-3.5 top-3.5 h-[18px] w-[18px] text-slate-400" />
                        <Textarea {...field} rows={3} placeholder="Alamat lengkap..." className="pl-10 pt-3.5 bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 rounded-xl focus:ring-indigo-500/20 font-medium text-slate-800 dark:text-slate-100 resize-none" />
                      </div>
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )} />

                <div className="flex justify-end pt-4">
                  <Button type="submit" disabled={isLoading} className="h-12 rounded-xl bg-indigo-600 hover:bg-indigo-700 text-white font-bold px-8 shadow-lg shadow-indigo-500/20 active:scale-95 transition-all gap-2">
                    {isLoading ? "Menyimpan..." : <><Save className="w-4 h-4" /> Simpan Perubahan</>}
                  </Button>
                </div>
              </form>
            </Form>
          </div>
        </div>
      </EnterpriseLayout>
    );
  }

  return (
    <KaryawanWorkspaceLayout>
      <div className="mb-8">
        <h1 className="text-2xl md:text-3xl font-extrabold text-slate-800 dark:text-slate-100 tracking-tight">Profil Saya</h1>
        <p className="text-slate-500 dark:text-slate-400 font-medium text-sm mt-1">Kelola detail informasi pribadi dan pengaturan akun Anda.</p>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 lg:gap-8 w-full mx-auto pb-10">

        {/* Left: Identity Card */}
        <div className="md:col-span-1 h-fit bg-white dark:bg-slate-900/70 backdrop-blur-md rounded-[24px] border border-white/60 shadow-xl shadow-slate-200/40 overflow-hidden vibe-glass-card">
          <div className="bg-gradient-to-br from-blue-600 to-indigo-700 h-28 relative flex justify-center">
            <div className="absolute inset-0 bg-[url('https://grainy-gradients.vercel.app/noise.svg')] opacity-20 brightness-100 mix-blend-overlay"></div>
            <div className="absolute -bottom-12">
              <div className="h-24 w-24 rounded-full bg-white dark:bg-slate-900 flex items-center justify-center text-slate-400 border-4 border-white shadow-lg relative">
                {profile?.avatar_url ? (
                  <img src={profile.avatar_url} alt="Profile" className="w-full h-full object-cover rounded-full" />
                ) : (
                  <span className="text-3xl font-extrabold text-slate-800 dark:text-slate-100">{profile?.full_name?.charAt(0) || "U"}</span>
                )}
                <div 
                  className="absolute bottom-0 right-0 h-8 w-8 bg-blue-600 rounded-full border-2 border-white flex items-center justify-center shadow-md active:scale-95 transition-transform cursor-pointer"
                  onClick={() => document.getElementById('avatar-upload-desktop')?.click()}
                >
                  <Camera className="h-4 w-4 text-white" />
                  <input 
                    id="avatar-upload-desktop" 
                    type="file" 
                    accept="image/*" 
                    className="hidden" 
                    onChange={handleImageUpload} 
                  />
                </div>
              </div>
            </div>
          </div>

          <div className="pt-16 pb-6 px-6 flex flex-col items-center text-center">
            <h2 className="text-xl font-extrabold text-slate-800 dark:text-slate-100 tracking-tight">{profile?.full_name}</h2>
            <span className="inline-block mt-1.5 px-3 py-1 rounded-full bg-blue-50 text-blue-600 text-xs font-bold border border-blue-100 uppercase tracking-wider">
              {profile?.position || "Karyawan"}
            </span>

            <div className="w-full border-t border-slate-200/50 dark:border-slate-700/50 my-6" />

            <div className="w-full space-y-4 text-left">
              <div className="bg-slate-50/50 dark:bg-slate-800/50 p-3 rounded-xl border border-slate-100 dark:border-slate-800">
                <p className="text-[10px] text-slate-400 uppercase font-bold tracking-widest mb-1">Email Saat Ini</p>
                <p className="text-sm text-slate-800 dark:text-slate-100 font-semibold flex items-center gap-2"><Mail className="w-4 h-4 text-slate-400" />{user?.email}</p>
              </div>
              <div className="bg-slate-50/50 dark:bg-slate-800/50 p-3 rounded-xl border border-slate-100 dark:border-slate-800">
                <p className="text-[10px] text-slate-400 uppercase font-bold tracking-widest mb-1">Bergabung Sejak</p>
                <p className="text-sm text-slate-800 dark:text-slate-100 font-semibold flex items-center gap-2"><Briefcase className="w-4 h-4 text-slate-400" />
                  {profile?.join_date ? new Date(profile.join_date).toLocaleDateString("id-ID", { year: 'numeric', month: 'long', day: 'numeric' }) : "-"}
                </p>
              </div>
            </div>

            <div className="w-full mt-8 space-y-3">
              <Button variant="outline" className="w-full justify-between h-12 rounded-xl border-slate-200 dark:border-slate-800 shadow-sm font-bold text-slate-700 dark:text-slate-200 hover:bg-slate-50 dark:bg-slate-800" onClick={() => navigate("/edit-password")}>
                Ubah Password <Key className="h-[18px] w-[18px] text-slate-400" />
              </Button>
              <Button variant="ghost" className="w-full justify-between h-12 rounded-xl text-red-600 hover:text-red-700 hover:bg-red-50 border border-transparent hover:border-red-100 font-bold" onClick={handleLogout}>
                Keluar Akun <LogOut className="h-[18px] w-[18px]" />
              </Button>
            </div>
          </div>
        </div>

        {/* Right: Detailed Form */}
        <div className="md:col-span-2 bg-white dark:bg-slate-900/70 backdrop-blur-md rounded-[24px] border border-white/60 shadow-xl shadow-slate-200/40 p-1 vibe-glass-card">
          <div className="p-6 pb-4 border-b border-slate-200/50 dark:border-slate-700/50">
            <h2 className="text-xl font-extrabold text-slate-800 dark:text-slate-100 tracking-tight">Edit Informasi Profil</h2>
            <p className="text-sm text-slate-500 dark:text-slate-400 font-medium mt-1">Perbarui informasi kontak dan alamat lengkap Anda.</p>
          </div>
          <div className="p-6">
            <Form {...form}>
              <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">

                <div className="p-5 bg-blue-50/50 border border-blue-100 rounded-xl space-y-6">
                  <div className="flex items-center gap-2 mb-2 pb-2 border-b border-blue-100/50">
                    <User className="h-4 w-4 text-blue-600" />
                    <h3 className="text-xs font-bold text-slate-600 dark:text-slate-300 uppercase tracking-wider">Data Utama</h3>
                  </div>

                  <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <FormField control={form.control} name="full_name" render={({ field }) => (
                      <FormItem>
                        <FormLabel className="text-xs font-bold text-slate-700 dark:text-slate-200 uppercase tracking-widest">Nama Lengkap</FormLabel>
                        <FormControl><Input {...field} className="h-12 bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 rounded-xl focus:ring-blue-500/20 font-medium text-slate-800 dark:text-slate-100 shadow-sm" /></FormControl>
                        <FormMessage />
                      </FormItem>
                    )} />
                    <FormField control={form.control} name="phone" render={({ field }) => (
                      <FormItem>
                        <FormLabel className="text-xs font-bold text-slate-700 dark:text-slate-200 uppercase tracking-widest">No. Handphone</FormLabel>
                        <FormControl>
                          <div className="relative">
                            <Phone className="absolute left-3.5 top-3.5 h-[18px] w-[18px] text-slate-400" />
                            <Input {...field} placeholder="08..." className="pl-10 h-12 bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-700 rounded-xl focus:ring-blue-500/20 font-medium text-slate-800 dark:text-slate-100 shadow-sm" />
                          </div>
                        </FormControl>
                        <FormMessage />
                      </FormItem>
                    )} />
                  </div>

                  <FormField control={form.control} name="address" render={({ field }) => (
                    <FormItem>
                      <FormLabel className="text-xs font-bold text-slate-700 dark:text-slate-200 uppercase tracking-widest">Alamat Domisili</FormLabel>
                      <FormControl>
                        <div className="relative">
                          <MapPin className="absolute left-3.5 top-3.5 h-[18px] w-[18px] text-slate-400" />
                          <Textarea {...field} rows={3} placeholder="Masukkan alamat lengkap..." className="pl-10 pt-3.5 bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-700 rounded-xl focus:ring-blue-500/20 font-medium text-slate-800 dark:text-slate-100 shadow-sm resize-none" />
                        </div>
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )} />
                </div>

                <div className="p-5 bg-slate-50/80 border border-slate-100 dark:border-slate-800 rounded-xl space-y-6">
                  <div className="flex items-center justify-between mb-2 pb-2 border-b border-slate-200/50 dark:border-slate-700/50">
                    <div className="flex items-center gap-2">
                      <Briefcase className="h-4 w-4 text-slate-500 dark:text-slate-400" />
                      <h3 className="text-xs font-bold text-slate-500 dark:text-slate-400 uppercase tracking-wider">Jabatan Kerja</h3>
                    </div>
                    <Lock className="w-3.5 h-3.5 text-slate-300" />
                  </div>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <FormItem>
                      <FormLabel className="text-xs font-bold text-slate-500 dark:text-slate-400 uppercase tracking-widest">Departemen</FormLabel>
                      <FormControl><Input value={profile?.department || "Tidak Ada"} disabled className="h-12 bg-slate-100/50 dark:bg-slate-800/50 text-slate-500 dark:text-slate-400 border-slate-200 dark:border-slate-700 rounded-xl font-semibold shadow-inner" /></FormControl>
                    </FormItem>
                    <FormItem>
                      <FormLabel className="text-xs font-bold text-slate-500 dark:text-slate-400 uppercase tracking-widest">Posisi</FormLabel>
                      <FormControl><Input value={profile?.position || "Tidak Ada"} disabled className="h-12 bg-slate-100/50 dark:bg-slate-800/50 text-slate-500 dark:text-slate-400 border-slate-200 dark:border-slate-700 rounded-xl font-semibold shadow-inner" /></FormControl>
                    </FormItem>
                  </div>
                </div>

                <div className="flex justify-end pt-4 mt-6 border-t border-slate-200/50 dark:border-slate-700/50">
                  <Button type="submit" disabled={isLoading} className="h-12 rounded-xl bg-slate-900 hover:bg-slate-800 text-white font-bold px-8 shadow-lg shadow-slate-900/20 active:scale-[0.98] transition-all gap-2">
                    {isLoading ? (
                      <div className="flex items-center gap-2">
                        <div className="w-4 h-4 rounded-full border-2 border-white/30 border-t-white animate-spin"></div>
                        Menyimpan...
                      </div>
                    ) : (
                      <>
                        <Save className="w-4 h-4" /> Simpan Perubahan
                      </>
                    )}
                  </Button>
                </div>
              </form>
            </Form>
          </div>
        </div>
      </div>
    </KaryawanWorkspaceLayout>
  );
};

export default ProfilKaryawan;
