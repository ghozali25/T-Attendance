
import {
    LayoutDashboard,
    Users,
    Clock,
    Briefcase,
    BarChart3,
    Building2,
    Shield,
    Key,
    Settings,
    Database,
    FileCheck,
    Fingerprint,
    History,
    FileText,
    CalendarDays,
    User
} from "lucide-react";

export const ADMIN_MENU_SECTIONS = [
    {
        title: "Menu Utama",
        items: [
            { icon: LayoutDashboard, title: "Dashboard", href: "/dashboard" },
            { icon: Users, title: "Kelola Karyawan", href: "/admin/karyawan" },
            { icon: Clock, title: "Rekap Absensi", href: "/admin/absensi" },
            { icon: Briefcase, title: "Jurnal Kerja", href: "/admin/jurnal" },
            { icon: BarChart3, title: "Laporan", href: "/admin/laporan" },
            { icon: FileCheck, title: "Permohonan Absen", href: "/admin/permohonan-absen" },
            { icon: CalendarDays, title: "Permohonan Cuti", href: "/admin/cuti" },
        ],
    },
    {
        title: "Pengaturan",
        items: [
            { icon: Building2, title: "Departemen", href: "/admin/departemen" },
            { icon: Shield, title: "Kelola Role", href: "/admin/role" },
            { icon: Key, title: "Reset Password", href: "/admin/reset-password" },
            { icon: Settings, title: "Pengaturan", href: "/admin/pengaturan" },
            { icon: Database, title: "Export Database", href: "/admin/export-database" },
        ],
    },
];

export const MANAGER_MENU_SECTIONS = [
    {
        title: "Menu Utama",
        items: [
            { icon: LayoutDashboard, title: "Dashboard", href: "/manager" },
            { icon: Clock, title: "Rekap Absensi", href: "/manager/absensi" },
            { icon: Briefcase, title: "Jurnal Tim", href: "/manager/jurnal" },
            { icon: BarChart3, title: "Laporan", href: "/manager/laporan" },
        ],
    },
];

export const KARYAWAN_MENU_SECTIONS = [
    {
        title: "Menu Utama",
        items: [
            { icon: LayoutDashboard, title: "Dashboard", href: "/dashboard" },
            { icon: Fingerprint, title: "Absensi", href: "/karyawan/absensi" },
            { icon: History, title: "Riwayat Absensi", href: "/karyawan/riwayat" },
            { icon: Briefcase, title: "Jurnal Saya", href: "/karyawan/jurnal" },
        ],
    },
    {
        title: "Lainnya",
        items: [
            { icon: CalendarDays, title: "Pengajuan Cuti", href: "/karyawan/cuti" },
            { icon: Clock, title: "Permohonan Absen", href: "/karyawan/permohonan-absen" },
            { icon: BarChart3, title: "Laporan", href: "/karyawan/laporan" },
            { icon: User, title: "Profil", href: "/karyawan/profil" },
        ],
    },
];
