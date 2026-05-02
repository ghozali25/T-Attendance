import { useLocation, Link } from "react-router-dom";
import { Home, History, CalendarDays, User, LayoutDashboard, Briefcase, FileCheck, Clock, BarChart3, Menu, LogOut, Key } from "lucide-react";
import { Sheet, SheetContent, SheetHeader, SheetTitle, SheetTrigger } from "@/components/ui/sheet";
import { useAuth } from "@/hooks/useAuth";
import { toast } from "@/hooks/use-toast";
import { useNavigate } from "react-router-dom";
import { cn } from "@/lib/utils";

interface NavItem {
    icon: React.ElementType;
    label: string;
    href: string;
}

const navItems: NavItem[] = [
    { icon: LayoutDashboard, label: "Beranda", href: "/dashboard" },
    { icon: Briefcase, label: "Jurnal", href: "/karyawan/jurnal" },
    { icon: CalendarDays, label: "Cuti", href: "/karyawan/cuti" },
    { icon: Clock, label: "Request", href: "/karyawan/permohonan-absen" },
];

const MobileNavigation = () => {
    const location = useLocation();
    const { signOut, user } = useAuth();
    const navigate = useNavigate();

    const isActive = (href: string) => {
        if (href === "/dashboard") {
            return location.pathname === "/dashboard" || location.pathname === "/";
        }
        return location.pathname === href || location.pathname.startsWith(href);
    };

    const handleLogout = async () => {
        await signOut();
        toast({ title: "Logout berhasil", description: "Sampai jumpa kembali!" });
        navigate("/auth");
    };

    const otherLinks = [
        { icon: History, label: "Riwayat Absensi", href: "/karyawan/riwayat", description: "Lihat daftar kehadiran Anda" },
        { icon: BarChart3, label: "Laporan Kerja", href: "/karyawan/laporan", description: "Download laporan bulanan" },
        { icon: User, label: "Profil Saya", href: "/karyawan/profil", description: "Kelola data diri & foto" },
        { icon: Key, label: "Ubah Password", href: "/edit-password", description: "Ganti kata sandi akun" },
    ];

    return (
        <nav
            className="fixed bottom-0 left-0 right-0 z-[40] pb-[env(safe-area-inset-bottom)] pointer-events-none"
            role="navigation"
            aria-label="Mobile navigation"
        >
            <div className="absolute inset-0 bg-white/95 dark:bg-slate-900/95 backdrop-blur-2xl border-t border-slate-200/50 dark:border-slate-800/50 shadow-[0_-8px_30px_rgba(0,0,0,0.08)] pointer-events-auto" />

            <div className="relative flex justify-around items-center h-[72px] px-2 max-w-lg mx-auto pointer-events-auto">
                {navItems.map((item) => {
                    const active = isActive(item.href);

                    return (
                        <Link
                            key={item.href}
                            to={item.href}
                            onClick={() => { if (navigator.vibrate) navigator.vibrate(10); }}
                            className="relative flex flex-col items-center justify-center w-[18%] h-full group outline-none active:scale-[0.9] transition-transform duration-200"
                        >
                            <div className={cn(
                                "p-2 rounded-2xl transition-all duration-300",
                                active ? "bg-indigo-50 dark:bg-indigo-900/30 text-indigo-600 dark:text-indigo-400 shadow-sm" : "text-slate-400 dark:text-slate-500"
                            )}>
                                <item.icon className={cn("w-[22px] h-[22px]", active ? "stroke-[2.5px]" : "stroke-[2px]")} />
                            </div>
                            <span className={cn(
                                "text-[9px] mt-1 font-bold tracking-tight",
                                active ? "text-indigo-600 dark:text-indigo-400" : "text-slate-400 dark:text-slate-500"
                            )}>{item.label}</span>
                        </Link>
                    );
                })}

                {/* More Menu Item */}
                <Sheet>
                    <SheetTrigger asChild>
                        <button 
                            className="relative flex flex-col items-center justify-center w-[18%] h-full group outline-none active:scale-[0.9] transition-transform duration-200"
                        >
                            <div className="p-2 rounded-2xl text-slate-400 dark:text-slate-500">
                                <Menu className="w-[22px] h-[22px] stroke-[2px]" />
                            </div>
                            <span className="text-[9px] mt-1 font-bold tracking-tight text-slate-400 dark:text-slate-500">Lainnya</span>
                        </button>
                    </SheetTrigger>
                    <SheetContent side="bottom" className="rounded-t-[32px] p-0 border-0 h-[70vh] bg-slate-50 dark:bg-slate-950 overflow-hidden flex flex-col shadow-2xl">
                        <div className="w-12 h-1.5 bg-slate-200 dark:bg-slate-800 rounded-full mx-auto mt-3 mb-1 shrink-0" />
                        <SheetHeader className="px-6 py-4 text-left border-b border-slate-100 dark:border-slate-900 bg-white dark:bg-slate-900 shrink-0">
                            <div className="flex items-center gap-4">
                                <div className="w-12 h-12 rounded-full bg-indigo-600 flex items-center justify-center text-white font-black text-lg shadow-lg shadow-indigo-500/20">
                                    {user?.full_name?.charAt(0) || "U"}
                                </div>
                                <div>
                                    <SheetTitle className="text-xl font-black tracking-tight dark:text-white">{user?.full_name || "Pengguna"}</SheetTitle>
                                    <p className="text-xs font-bold text-slate-400 uppercase tracking-widest">Karyawan Aktif</p>
                                </div>
                            </div>
                        </SheetHeader>
                        
                        <div className="flex-1 overflow-y-auto px-6 py-6 space-y-4 pb-12">
                            <p className="text-[10px] font-black text-slate-400 dark:text-slate-500 uppercase tracking-[0.2em] ml-1">Menu Tambahan</p>
                            <div className="grid grid-cols-1 gap-3">
                                {otherLinks.map((link) => (
                                    <Link 
                                        key={link.href} 
                                        to={link.href}
                                        className="flex items-center gap-4 p-4 bg-white dark:bg-slate-900 rounded-2xl border border-slate-100 dark:border-slate-800 shadow-sm active:scale-[0.98] transition-all group"
                                    >
                                        <div className="w-10 h-10 rounded-xl bg-slate-50 dark:bg-slate-800 flex items-center justify-center text-slate-400 group-hover:text-indigo-600 transition-colors">
                                            <link.icon className="w-5 h-5" />
                                        </div>
                                        <div className="flex-1">
                                            <p className="text-sm font-bold text-slate-800 dark:text-slate-200">{link.label}</p>
                                            <p className="text-[11px] font-medium text-slate-400 leading-tight">{link.description}</p>
                                        </div>
                                    </Link>
                                ))}
                            </div>

                            <button 
                                onClick={handleLogout}
                                className="w-full flex items-center gap-4 p-4 mt-4 bg-red-50 dark:bg-red-950/30 rounded-2xl border border-red-100 dark:border-red-900/30 active:scale-[0.98] transition-all"
                            >
                                <div className="w-10 h-10 rounded-xl bg-red-100 dark:bg-red-900/50 flex items-center justify-center text-red-600 dark:text-red-400">
                                    <LogOut className="w-5 h-5" />
                                </div>
                                <div className="text-left">
                                    <p className="text-sm font-bold text-red-600 dark:text-red-400">Keluar Sesi</p>
                                    <p className="text-[11px] font-medium text-red-400 leading-tight">Akhiri login saat ini</p>
                                </div>
                            </button>
                        </div>
                    </SheetContent>
                </Sheet>
            </div>
            <style>{`
                .ease-spring {
                    transition-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
                }
            `}</style>
        </nav>
    );
};

export default MobileNavigation;
