import { useState } from "react";
import { Link } from "react-router-dom";
import EnterpriseLayout from "@/components/layout/EnterpriseLayout";
import { ADMIN_MENU_SECTIONS } from "@/config/menu";
import { ArrowLeft, Download, FileText, Database, Shield, Server, Layout, Code, Layers } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Badge } from "@/components/ui/badge";
import { toast } from "@/hooks/use-toast";
import jsPDF from "jspdf";
import { useSystemSettings } from "@/hooks/useSystemSettings";

const Dokumentasi = () => {
  const [isGenerating, setIsGenerating] = useState(false);
  const { settings } = useSystemSettings();

  const generatePDF = async () => {
    setIsGenerating(true);

    try {
      const pdf = new jsPDF({
        orientation: "portrait",
        unit: "mm",
        format: "a4",
      });

      const pageWidth = pdf.internal.pageSize.getWidth();
      const pageHeight = pdf.internal.pageSize.getHeight();
      const margin = 20;
      const contentWidth = pageWidth - (margin * 2);
      let yPosition = margin;

      const addNewPage = () => {
        pdf.addPage();
        yPosition = margin;
      };

      const checkPageBreak = (neededSpace: number) => {
        if (yPosition + neededSpace > pageHeight - margin) {
          addNewPage();
        }
      };

      const addTitle = (text: string, size: number = 16) => {
        checkPageBreak(15);
        pdf.setFontSize(size);
        pdf.setFont("helvetica", "bold");
        pdf.text(text, margin, yPosition);
        yPosition += size * 0.5 + 3;
      };

      const addSubtitle = (text: string) => {
        checkPageBreak(12);
        pdf.setFontSize(12);
        pdf.setFont("helvetica", "bold");
        pdf.text(text, margin, yPosition);
        yPosition += 8;
      };

      const addParagraph = (text: string) => {
        checkPageBreak(10);
        pdf.setFontSize(10);
        pdf.setFont("helvetica", "normal");
        const lines = pdf.splitTextToSize(text, contentWidth);
        pdf.text(lines, margin, yPosition);
        yPosition += lines.length * 5 + 3;
      };

      const addCode = (code: string) => {
        checkPageBreak(15);
        pdf.setFontSize(8);
        pdf.setFont("courier", "normal");
        const lines = pdf.splitTextToSize(code, contentWidth - 10);

        // Background
        pdf.setFillColor(245, 245, 245);
        pdf.rect(margin, yPosition - 3, contentWidth, lines.length * 4 + 6, "F");

        pdf.text(lines, margin + 5, yPosition + 2);
        yPosition += lines.length * 4 + 10;
      };

      const addBullet = (text: string) => {
        checkPageBreak(8);
        pdf.setFontSize(10);
        pdf.setFont("helvetica", "normal");
        const lines = pdf.splitTextToSize(text, contentWidth - 10);
        pdf.text("•", margin, yPosition);
        pdf.text(lines, margin + 5, yPosition);
        yPosition += lines.length * 5 + 2;
      };

      const addSpacer = (height: number = 5) => {
        yPosition += height;
      };

      // ========== COVER PAGE ==========
      pdf.setFillColor(59, 130, 246);
      pdf.rect(0, 0, pageWidth, 80, "F");

      pdf.setTextColor(255, 255, 255);
      pdf.setFontSize(28);
      pdf.setFont("helvetica", "bold");
      pdf.text("DOKUMENTASI FULLSTACK", margin, 40);
      pdf.setFontSize(16);
      pdf.text("Sistem Absensi & Manajemen Karyawan", margin, 52);
      pdf.setFontSize(10);
      pdf.text(settings.companyName, margin, 65);

      pdf.setTextColor(0, 0, 0);
      yPosition = 100;

      addParagraph("Dokumen ini berisi penjelasan lengkap tentang arsitektur, teknologi, dan implementasi sistem absensi berbasis web yang dibangun menggunakan React, TypeScript, dan MySQL.");
      addSpacer(10);

      addSubtitle("Informasi Dokumen");
      addBullet("Versi: 1.0");
      addBullet("Tanggal: " + new Date().toLocaleDateString("id-ID", { day: "numeric", month: "long", year: "numeric" }));
      addBullet("Platform: Web Application (React + MySQL)");
      addBullet("Target: Developer & Administrator");

      // ========== DAFTAR ISI ==========
      addNewPage();
      addTitle("DAFTAR ISI", 20);
      addSpacer(10);

      const tocItems = [
        "1. Gambaran Umum Sistem",
        "2. Teknologi yang Digunakan",
        "3. Struktur Folder Project",
        "4. Sistem Routing (App.tsx)",
        "5. Sistem Autentikasi",
        "6. Integrasi Database",
        "7. Struktur Tabel Database",
        "8. Row Level Security (RLS)",
        "9. Edge Functions (Backend)",
        "10. Komponen UI",
        "11. State Management",
        "12. Panduan Pengembangan",
      ];

      tocItems.forEach(item => {
        addBullet(item);
      });

      // ========== SECTION 1: GAMBARAN UMUM ==========
      addNewPage();
      addTitle("1. GAMBARAN UMUM SISTEM", 18);
      addSpacer(5);

      addParagraph("Sistem Absensi & Manajemen Karyawan adalah aplikasi web fullstack yang dirancang untuk mengelola kehadiran, cuti, dan data karyawan dalam suatu organisasi.");
      addSpacer(3);

      addSubtitle("1.1 Fitur Utama");
      addBullet("Absensi harian dengan pencatatan waktu clock-in dan clock-out");
      addBullet("Pengajuan dan persetujuan cuti");
      addBullet("Dashboard analitik untuk admin dan manager");
      addBullet("Manajemen data karyawan");
      addBullet("Laporan kehadiran (harian, mingguan, bulanan)");
      addBullet("Sistem role-based access control (RBAC)");
      addSpacer(5);

      addSubtitle("1.2 Jenis Pengguna (Role)");
      addBullet("Admin: Akses penuh ke semua fitur sistem, kelola karyawan, laporan, pengaturan");
      addBullet("Manager: Lihat laporan tim, kelola persetujuan cuti, monitoring kehadiran");
      addBullet("Karyawan: Absensi harian, pengajuan cuti, lihat riwayat pribadi");

      // ========== SECTION 2: TEKNOLOGI ==========
      addNewPage();
      addTitle("2. TEKNOLOGI YANG DIGUNAKAN", 18);
      addSpacer(5);

      addSubtitle("2.1 Frontend");
      addBullet("React 18 - Library JavaScript untuk membangun user interface");
      addBullet("TypeScript - Superset JavaScript dengan static typing");
      addBullet("Vite - Build tool modern yang cepat untuk development");
      addBullet("Tailwind CSS - Utility-first CSS framework");
      addBullet("shadcn/ui - Komponen UI yang dapat dikustomisasi");
      addBullet("React Router - Client-side routing");
      addBullet("React Query (TanStack) - Server state management");
      addBullet("Recharts - Library untuk visualisasi data (grafik)");
      addSpacer(5);

      addSubtitle("2.2 Backend (MySQL)");
      addBullet("MySQL - Database relasional");
      addBullet("Custom Auth - Sistem autentikasi JWT-based");
      addBullet("API Endpoints - RESTful API untuk logika backend");
      addSpacer(5);

      addSubtitle("2.3 Library Pendukung");
      addBullet("date-fns - Manipulasi tanggal dan waktu");
      addBullet("jsPDF - Generate dokumen PDF");
      addBullet("Zod - Validasi schema data");
      addBullet("React Hook Form - Pengelolaan form");
      addBullet("Lucide React - Library icon");

      // ========== SECTION 3: STRUKTUR FOLDER ==========
      addNewPage();
      addTitle("3. STRUKTUR FOLDER PROJECT", 18);
      addSpacer(5);

      addCode(`project-root/
├── src/                      # Source code utama
│   ├── assets/              # File statis (gambar, logo)
│   ├── components/          # Komponen React
│   │   └── ui/             # Komponen shadcn/ui
│   ├── hooks/              # Custom React hooks
│   │   ├── useAuth.tsx     # Hook autentikasi
│   │   └── useSystemSettings.tsx
│   ├── integrations/       # Integrasi eksternal
│   │   └── integrations/  # Database integrations (MySQL)
│   ├── lib/                # Utility functions
│   ├── pages/              # Halaman aplikasi
│   │   ├── admin/          # Halaman admin
│   │   ├── karyawan/       # Halaman karyawan
│   │   └── manager/        # Halaman manager
│   ├── App.tsx             # Konfigurasi routing
│   ├── main.tsx            # Entry point
│   └── index.css           # Global styles
├── api/                    # API endpoints (Express.js)
│   └── auth/               # Authentication endpoints
└── public/                 # File publik`);

      addSpacer(5);
      addSubtitle("3.1 Penjelasan Folder");
      addBullet("src/components/ui/ - Berisi komponen UI dari shadcn seperti Button, Card, Dialog, dll");
      addBullet("src/hooks/ - Custom hooks untuk logic yang bisa dipakai ulang");
      addBullet("src/pages/ - Setiap file adalah satu halaman dalam aplikasi");
      addBullet("api/ - Berisi API endpoints untuk backend logic");

      // ========== SECTION 4: ROUTING ==========
      addNewPage();
      addTitle("4. SISTEM ROUTING (App.tsx)", 18);
      addSpacer(5);

      addParagraph("File App.tsx adalah pusat konfigurasi routing yang menentukan halaman mana yang ditampilkan berdasarkan URL dan hak akses pengguna.");
      addSpacer(3);

      addSubtitle("4.1 Struktur Provider");
      addCode(`<QueryClientProvider>     // Layer 1: Data caching
  <TooltipProvider>       // Layer 2: Tooltips
    <AuthProvider>        // Layer 3: Autentikasi
      <BrowserRouter>     // Layer 4: Routing
        <Routes>          // Definisi routes
        </Routes>
      </BrowserRouter>
    </AuthProvider>
  </TooltipProvider>
</QueryClientProvider>`);

      addSpacer(5);
      addSubtitle("4.2 Jenis Route");
      addBullet("Route Publik: / (Landing), /auth (Login) - Bisa diakses tanpa login");
      addBullet("ProtectedRoute: /dashboard, /karyawan/* - Butuh login (semua role)");
      addBullet("ManagerRoute: /manager/* - Khusus role manager");
      addBullet("AdminRoute: /admin/* - Khusus role admin");
      addSpacer(3);

      addSubtitle("4.3 Contoh Kode Route");
      addCode(`// Route publik
<Route path="/" element={<LandingPage />} />

// Route yang butuh login
<Route path="/dashboard" element={
  <ProtectedRoute>
    <Index />
  </ProtectedRoute>
} />

// Route khusus admin
<Route path="/admin/karyawan" element={
  <AdminRoute>
    <KelolaKaryawan />
  </AdminRoute>
} />`);

      // ========== SECTION 5: AUTENTIKASI ==========
      addNewPage();
      addTitle("5. SISTEM AUTENTIKASI", 18);
      addSpacer(5);

      addParagraph("Sistem autentikasi menggunakan custom JWT-based authentication dengan implementasi di file src/hooks/useAuth.tsx dan src/integrations/mysql/client.ts. Hook ini menyediakan context untuk seluruh aplikasi.");
      addSpacer(3);

      addSubtitle("5.1 AuthContext Interface");
      addCode(`interface AuthContextType {
  user: User | null;        // Data user dari MySQL
  session: Session | null;  // Token sesi (JWT)
  loading: boolean;         // Status loading
  role: AppRole | null;     // "admin" | "manager" | "karyawan"
  isAdmin: boolean;         // Helper cek admin
  isManager: boolean;       // Helper cek manager
  signOut: () => Promise<void>;  // Fungsi logout
}`);

      addSpacer(5);
      addSubtitle("5.2 Alur Autentikasi");
      addBullet("1. User memasukkan email dan password di halaman /auth");
      addBullet("2. Frontend memanggil /api/auth/login endpoint");
      addBullet("3. Backend memvalidasi kredensial dengan MySQL dan mengembalikan JWT token");
      addBullet("4. onAuthStateChange listener mendeteksi perubahan status");
      addBullet("5. Aplikasi mengambil role user dari tabel user_roles");
      addBullet("6. User diarahkan ke dashboard sesuai role");
      addSpacer(3);

      addSubtitle("5.3 Cara Menggunakan useAuth");
      addCode(`import { useAuth } from "@/hooks/useAuth";

function MyComponent() {
  const { user, isAdmin, signOut } = useAuth();
  
  if (isAdmin) {
    return <AdminPanel />;
  }
  
  return <UserPanel user={user} />;
}`);

      // ========== SECTION 6: INTEGRASI DATABASE ==========
      addNewPage();
      addTitle("6. INTEGRASI DATABASE", 18);
      addSpacer(5);

      addParagraph("Koneksi ke database dilakukan melalui MySQL client yang dikonfigurasi di src/integrations/mysql/client.ts.");
      addSpacer(3);

      addSubtitle("6.1 Konfigurasi Client");
      addCode(`import { db } from '@/integrations/mysql/client';

// db is pre-configured with connection from .env
// DB_HOST, DB_USER, DB_PASSWORD, DB_NAME`);

      addSpacer(5);
      addSubtitle("6.2 Operasi Database (CRUD)");
      addCode(`// SELECT - Ambil data
const data = await db.query(
  'SELECT full_name, department FROM profiles WHERE user_id = ?',
  [userId]
);

// INSERT - Tambah data
await db.query(
  'INSERT INTO attendance (user_id, clock_in, status) VALUES (?, ?, ?)',
  [userId, new Date().toISOString(), 'present']
);

// UPDATE - Ubah data
await db.query(
  'UPDATE profiles SET phone = ? WHERE user_id = ?',
  ['08123456789', userId]
);

// DELETE - Hapus data
await db.query(
  'DELETE FROM leave_requests WHERE id = ?',
  [requestId]
);`);

      addSpacer(5);
      addSubtitle("6.3 Realtime Subscription");
      addCode(`// MySQL tidak mendukung realtime subscriptions secara native
// Gunakan polling atau manual refresh untuk update data
// Contoh polling dengan useEffect:

useEffect(() => {
  const interval = setInterval(() => {
    fetchData(); // Refresh data setiap 30 detik
  }, 30000);
  return () => clearInterval(interval);
}, []);`);

      // ========== SECTION 7: TABEL DATABASE ==========
      addNewPage();
      addTitle("7. STRUKTUR TABEL DATABASE", 18);
      addSpacer(5);

      addSubtitle("7.1 Tabel: profiles");
      addParagraph("Menyimpan data profil karyawan.");
      addCode(`Kolom:
- id (int, AUTO_INCREMENT PRIMARY KEY)
- user_id (varchar(255), UNIQUE)
- full_name (text) - Nama lengkap
- department (text) - Departemen
- position (text) - Jabatan
- phone (text) - Nomor telepon
- address (text) - Alamat
- join_date (date) - Tanggal bergabung
- avatar_url (text) - URL foto profil
- created_at, updated_at (timestamp)`);

      addSpacer(5);
      addSubtitle("7.2 Tabel: attendance");
      addParagraph("Mencatat data kehadiran/absensi.");
      addCode(`Kolom:
- id (int, AUTO_INCREMENT PRIMARY KEY)
- user_id (varchar(255))
- date (date) - Tanggal absensi
- clock_in (timestamp) - Waktu masuk
- clock_out (timestamp) - Waktu keluar
- clock_in_location (text) - Lokasi clock in
- clock_out_location (text) - Lokasi clock out
- status (text) - "present" | "late" | "early_leave"
- notes (text) - Catatan
- created_at, updated_at (timestamp)`);

      addSpacer(5);
      addSubtitle("7.3 Tabel: leave_requests");
      addParagraph("Menyimpan pengajuan cuti.");
      addCode(`Kolom:
- id (int, AUTO_INCREMENT PRIMARY KEY)
- user_id (varchar(255))
- start_date (date) - Tanggal mulai
- end_date (date) - Tanggal selesai
- leave_type (text) - Jenis cuti
- reason (text) - Alasan
- status (text) - "pending" | "approved" | "rejected"
- approved_by (varchar(255)) - Yang menyetujui
- approved_at (timestamp)
- rejection_reason (text)
- created_at, updated_at (timestamp)`);

      addSpacer(5);
      addSubtitle("7.4 Tabel: user_roles");
      addParagraph("Menyimpan role pengguna (TERPISAH dari profiles untuk keamanan).");
      addCode(`Kolom:
- id (int, AUTO_INCREMENT PRIMARY KEY)
- user_id (varchar(255))
- role (enum: "admin" | "manager" | "karyawan")
- created_at (timestamp)`);

      // ========== SECTION 8: KEAMANAN DATABASE ==========
      addNewPage();
      addTitle("8. KEAMANAN DATABASE", 18);
      addSpacer(5);

      addParagraph("Keamanan database diimplementasikan melalui JWT token validation di level API dan proper filtering di level query.");
      addSpacer(3);

      addSubtitle("8.1 Prinsip Keamanan");
      addBullet("Semua query difilter berdasarkan user_id dari JWT token");
      addBullet("Role TIDAK BOLEH disimpan di tabel profiles (risiko privilege escalation)");
      addBullet("Gunakan parameterized queries untuk mencegah SQL injection");
      addBullet("Password disimpan dalam bentuk hash menggunakan bcryptjs");

      // ========== SECTION 9: API ENDPOINTS ==========
      addNewPage();
      addTitle("9. API ENDPOINTS (BACKEND)", 18);
      addSpacer(5);

      addParagraph("API endpoints diimplementasikan menggunakan Express.js untuk logika backend yang membutuhkan akses database atau integrasi eksternal.");
      addSpacer(3);

      addSubtitle("9.1 Lokasi File");
      addCode(`api/
├── auth/
│   ├── login.ts       # Login endpoint
│   ├── register.ts    # Registration endpoint
│   └── logout.ts      # Logout endpoint
└── employees/
    ├── list.ts        # List employees endpoint
    └── create.ts      # Create employee endpoint`);

      addSpacer(5);
      addSubtitle("9.2 Struktur Dasar API Endpoint");
      addCode(`import express from 'express';
import { db } from '@/integrations/mysql/client';
import jwt from 'jsonwebtoken';

const router = express.Router();

router.post('/api/auth/login', async (req, res) => {
  const { email, password } = req.body;
  
  try {
    // Query user from database
    const users = await db.query(
      'SELECT * FROM users WHERE email = ?',
      [email]
    ) as any[];
    
    if (!users || users.length === 0) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }
    
    const user = users[0];
    // Validate password (using bcryptjs)
    const isValid = await bcrypt.compare(password, user.password);
    
    if (!isValid) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }
    
    // Generate JWT token
    const token = jwt.sign(
      { userId: user.id, email: user.email },
      process.env.JWT_SECRET,
      { expiresIn: '24h' }
    );
    
    res.json({ token, user: { id: user.id, email: user.email } });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});`);

      addSpacer(5);
      addSubtitle("9.3 Cara Memanggil API Endpoint");
      addCode(`// Dari frontend
const response = await fetch('/api/auth/login', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    email: "user@example.com",
    password: "password123"
  })
});

const { token, user } = await response.json();
localStorage.setItem('token', token);`);

      // ========== SECTION 10: KOMPONEN UI ==========
      addNewPage();
      addTitle("10. KOMPONEN UI (shadcn/ui)", 18);
      addSpacer(5);

      addParagraph("Aplikasi menggunakan shadcn/ui sebagai library komponen dasar. Komponen-komponen ini tersedia di folder src/components/ui/.");
      addSpacer(3);

      addSubtitle("10.1 Komponen yang Sering Digunakan");
      addBullet("Button - Tombol dengan berbagai variant (default, destructive, outline, ghost)");
      addBullet("Card - Container untuk menampilkan konten dalam kotak");
      addBullet("Dialog - Modal popup untuk konfirmasi atau form");
      addBullet("Table - Tabel data dengan header dan body");
      addBullet("Form - Wrapper untuk form dengan validasi");
      addBullet("Input - Field input text");
      addBullet("Select - Dropdown pilihan");
      addBullet("Badge - Label kecil untuk status");
      addBullet("Tabs - Tab navigation");
      addBullet("Toast - Notifikasi popup");
      addSpacer(5);

      addSubtitle("10.2 Contoh Penggunaan");
      addCode(`import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";

function MyComponent() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Judul Card</CardTitle>
      </CardHeader>
      <CardContent>
        <Badge variant="success">Aktif</Badge>
        <Button onClick={handleClick}>Klik Saya</Button>
      </CardContent>
    </Card>
  );
}`);

      // ========== SECTION 11: STATE MANAGEMENT ==========
      addNewPage();
      addTitle("11. STATE MANAGEMENT", 18);
      addSpacer(5);

      addSubtitle("11.1 React Query (TanStack Query)");
      addParagraph("Digunakan untuk mengelola server state (data dari database). Menyediakan caching, refetching, dan loading states secara otomatis.");
      addCode(`import { useQuery, useMutation } from "@tanstack/react-query";
import { db } from '@/integrations/mysql/client';

// Fetch data
const { data, isLoading, error } = useQuery({
  queryKey: ['employees'],
  queryFn: async () => {
    const data = await db.query('SELECT * FROM profiles') as any[];
    return data;
  }
});

// Mutasi data
const mutation = useMutation({
  mutationFn: async (newEmployee) => {
    await db.query(
      'INSERT INTO profiles (user_id, full_name, department, position) VALUES (?, ?, ?, ?)',
      [newEmployee.user_id, newEmployee.full_name, newEmployee.department, newEmployee.position]
    );
  },
  onSuccess: () => {
    queryClient.invalidateQueries(['employees']);
  }
});`);

      addSpacer(5);
      addSubtitle("11.2 React useState & useEffect");
      addParagraph("Untuk local state dan side effects dalam komponen.");
      addCode(`const [count, setCount] = useState(0);
const [data, setData] = useState([]);

useEffect(() => {
  // Dipanggil saat komponen dimount atau dependency berubah
  fetchData();
}, [userId]); // Dependency array`);

      addSpacer(5);
      addSubtitle("11.3 Context API");
      addParagraph("Untuk global state yang perlu diakses banyak komponen (contoh: AuthContext).");
      addCode(`// Membuat context
const MyContext = createContext(defaultValue);

// Provider
<MyContext.Provider value={value}>
  {children}
</MyContext.Provider>

// Menggunakan context
const value = useContext(MyContext);`);

      // ========== SECTION 12: PANDUAN PENGEMBANGAN ==========
      addNewPage();
      addTitle("12. PANDUAN PENGEMBANGAN", 18);
      addSpacer(5);

      addSubtitle("12.1 Menambah Halaman Baru");
      addBullet("1. Buat file di src/pages/ (contoh: src/pages/admin/NewPage.tsx)");
      addBullet("2. Tambahkan route di App.tsx dengan guard yang sesuai");
      addBullet("3. Tambahkan link navigasi di halaman terkait");
      addSpacer(5);

      addSubtitle("12.2 Menambah Tabel Database");
      addBullet("1. Buat migrasi SQL dengan CREATE TABLE");
      addBullet("2. Aktifkan RLS: ALTER TABLE x ENABLE ROW LEVEL SECURITY");
      addBullet("3. Buat policy untuk setiap operasi (SELECT, INSERT, UPDATE, DELETE)");
      addBullet("4. Update types.ts akan otomatis ter-generate");
      addSpacer(5);

      addSubtitle("12.3 Best Practices");
      addBullet("Selalu gunakan TypeScript untuk type safety");
      addBullet("Pisahkan logika ke dalam custom hooks yang reusable");
      addBullet("Gunakan komponen kecil dan fokus (single responsibility)");
      addBullet("Selalu handle error dan loading states");
      addBullet("Gunakan semantic color tokens dari design system (bg-primary, text-foreground)");
      addBullet("Jangan hardcode warna langsung (text-white, bg-black)");
      addBullet("Test RLS policies sebelum deploy ke production");
      addSpacer(5);

      addSubtitle("12.4 Debugging Tips");
      addBullet("Cek Console browser untuk error JavaScript");
      addBullet("Cek Network tab untuk error API");
      addBullet("Gunakan console.log untuk tracing alur program");
      addBullet("Cek API server logs di terminal");

      // ========== FOOTER ==========
      addNewPage();
      pdf.setFillColor(59, 130, 246);
      pdf.rect(0, pageHeight - 60, pageWidth, 60, "F");

      pdf.setTextColor(255, 255, 255);
      pdf.setFontSize(14);
      pdf.text("Terima Kasih", margin, pageHeight - 40);
      pdf.setFontSize(10);
      pdf.text("Dokumen ini dibuat untuk membantu pemahaman arsitektur sistem.", margin, pageHeight - 30);
      pdf.text("Untuk pertanyaan lebih lanjut, silakan hubungi tim development.", margin, pageHeight - 22);

      // Save PDF
      pdf.save("Dokumentasi_Fullstack_Sistem_Absensi.pdf");

      toast({
        title: "PDF Berhasil Dibuat",
        description: "Dokumentasi telah diunduh ke perangkat Anda",
      });
    } catch (error) {
      console.error("Error generating PDF:", error);
      toast({
        title: "Gagal Membuat PDF",
        description: "Terjadi kesalahan saat membuat dokumentasi",
        variant: "destructive",
      });
    } finally {
      setIsGenerating(false);
    }
  };

  return (
    <EnterpriseLayout
      title="Dokumentasi Sistem"
      subtitle="Penjelasan arsitektur fullstack"
      roleLabel="Administrator"
      showExport={false}
      menuSections={ADMIN_MENU_SECTIONS}
      breadcrumbs={[
        { label: "Admin", href: "/admin/dashboard" },
        { label: "Dokumentasi" },
      ]}
    >
      <main className="max-w-6xl mx-auto py-6">
        <div className="flex justify-end mb-6">
          <Button onClick={generatePDF} disabled={isGenerating} className="shadow-sm">
            <Download className="h-4 w-4 mr-2" />
            {isGenerating ? "Membuat PDF..." : "Download PDF"}
          </Button>
        </div>
        {/* Quick Overview Cards */}
        <div className="grid gap-4 md:grid-cols-3 lg:grid-cols-6 mb-6">
          <Card>
            <CardContent className="pt-4 text-center">
              <Layout className="h-8 w-8 mx-auto text-primary mb-2" />
              <p className="font-semibold">React</p>
              <p className="text-xs text-muted-foreground">Frontend</p>
            </CardContent>
          </Card>
          <Card>
            <CardContent className="pt-4 text-center">
              <Code className="h-8 w-8 mx-auto text-blue-500 mb-2" />
              <p className="font-semibold">TypeScript</p>
              <p className="text-xs text-muted-foreground">Language</p>
            </CardContent>
          </Card>
          <Card>
            <CardContent className="pt-4 text-center">
              <Database className="h-8 w-8 mx-auto text-green-500 mb-2" />
              <p className="font-semibold">PostgreSQL</p>
              <p className="text-xs text-muted-foreground">Database</p>
            </CardContent>
          </Card>
          <Card>
            <CardContent className="pt-4 text-center">
              <Shield className="h-8 w-8 mx-auto text-orange-500 mb-2" />
              <p className="font-semibold">RLS</p>
              <p className="text-xs text-muted-foreground">Security</p>
            </CardContent>
          </Card>
          <Card>
            <CardContent className="pt-4 text-center">
              <Server className="h-8 w-8 mx-auto text-purple-500 mb-2" />
              <p className="font-semibold">Edge Fn</p>
              <p className="text-xs text-muted-foreground">Backend</p>
            </CardContent>
          </Card>
          <Card>
            <CardContent className="pt-4 text-center">
              <Layers className="h-8 w-8 mx-auto text-pink-500 mb-2" />
              <p className="font-semibold">shadcn</p>
              <p className="text-xs text-muted-foreground">UI Library</p>
            </CardContent>
          </Card>
        </div>

        {/* Documentation Content */}
        <Tabs defaultValue="overview" className="space-y-4">
          <TabsList className="grid w-full grid-cols-4 lg:w-auto lg:inline-grid">
            <TabsTrigger value="overview">Overview</TabsTrigger>
            <TabsTrigger value="frontend">Frontend</TabsTrigger>
            <TabsTrigger value="backend">Backend</TabsTrigger>
            <TabsTrigger value="database">Database</TabsTrigger>
          </TabsList>

          <TabsContent value="overview">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <FileText className="h-5 w-5" />
                  Gambaran Umum Sistem
                </CardTitle>
                <CardDescription>Arsitektur dan teknologi yang digunakan</CardDescription>
              </CardHeader>
              <CardContent>
                <ScrollArea className="h-[400px] pr-4">
                  <div className="space-y-4">
                    <div>
                      <h3 className="font-semibold mb-2">Apa itu Sistem Absensi ini?</h3>
                      <p className="text-sm text-muted-foreground">
                        Sistem berbasis web untuk mengelola kehadiran, cuti, dan data karyawan dengan
                        3 jenis role: Admin, Manager, dan Karyawan.
                      </p>
                    </div>
                    <div>
                      <h3 className="font-semibold mb-2">Fitur Utama</h3>
                      <ul className="text-sm text-muted-foreground space-y-1">
                        <li>• Absensi harian dengan clock-in/out</li>
                        <li>• Pengajuan dan persetujuan cuti</li>
                        <li>• Dashboard analitik</li>
                        <li>• Manajemen data karyawan</li>
                        <li>• Laporan kehadiran</li>
                        <li>• Role-based access control</li>
                      </ul>
                    </div>
                    <div>
                      <h3 className="font-semibold mb-2">Struktur Folder</h3>
                      <pre className="bg-muted p-3 rounded-lg text-xs overflow-x-auto">
                        {`src/
├── components/  # Komponen UI
├── hooks/       # Custom hooks
├── pages/       # Halaman
├── lib/         # Utilities
└── integrations/# MySQL client`}
                      </pre>
                    </div>
                  </div>
                </ScrollArea>
              </CardContent>
            </Card>
          </TabsContent>

          <TabsContent value="frontend">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Layout className="h-5 w-5" />
                  Frontend Architecture
                </CardTitle>
                <CardDescription>React, TypeScript, dan Tailwind CSS</CardDescription>
              </CardHeader>
              <CardContent>
                <ScrollArea className="h-[400px] pr-4">
                  <div className="space-y-4">
                    <div>
                      <h3 className="font-semibold mb-2">Routing (App.tsx)</h3>
                      <p className="text-sm text-muted-foreground mb-2">
                        File App.tsx mendefinisikan semua route dan guard untuk proteksi akses.
                      </p>
                      <pre className="bg-muted p-3 rounded-lg text-xs overflow-x-auto">
                        {`// Route publik
<Route path="/" element={<LandingPage />} />

// Route terproteksi
<Route path="/dashboard" element={
  <ProtectedRoute>
    <Index />
  </ProtectedRoute>
} />`}
                      </pre>
                    </div>
                    <div>
                      <h3 className="font-semibold mb-2">Autentikasi (useAuth)</h3>
                      <pre className="bg-muted p-3 rounded-lg text-xs overflow-x-auto">
                        {`const { user, isAdmin, signOut } = useAuth();

if (isAdmin) {
  // Tampilkan menu admin
}`}
                      </pre>
                    </div>
                    <div>
                      <h3 className="font-semibold mb-2">Komponen UI</h3>
                      <div className="flex flex-wrap gap-2">
                        <Badge>Button</Badge>
                        <Badge>Card</Badge>
                        <Badge>Dialog</Badge>
                        <Badge>Table</Badge>
                        <Badge>Form</Badge>
                        <Badge>Input</Badge>
                        <Badge>Select</Badge>
                        <Badge>Toast</Badge>
                      </div>
                    </div>
                  </div>
                </ScrollArea>
              </CardContent>
            </Card>
          </TabsContent>

          <TabsContent value="backend">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Server className="h-5 w-5" />
                  Backend (API Endpoints)
                </CardTitle>
                <CardDescription>Express.js API endpoints for MySQL</CardDescription>
              </CardHeader>
              <CardContent>
                <ScrollArea className="h-[400px] pr-4">
                  <div className="space-y-4">
                    <div>
                      <h3 className="font-semibold mb-2">API Endpoints Tersedia</h3>
                      <ul className="text-sm text-muted-foreground space-y-1">
                        <li>• <code className="bg-muted px-1 rounded">POST /api/auth/login</code> - Login user</li>
                        <li>• <code className="bg-muted px-1 rounded">POST /api/auth/register</code> - Register user</li>
                        <li>• <code className="bg-muted px-1 rounded">GET /api/employees</code> - List employees</li>
                      </ul>
                    </div>
                    <div>
                      <h3 className="font-semibold mb-2">Cara Memanggil</h3>
                      <pre className="bg-muted p-3 rounded-lg text-xs overflow-x-auto">
                        {`const response = await fetch('/api/auth/login', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ email, password })
});
const { token } = await response.json();`}
                      </pre>
                    </div>
                  </div>
                </ScrollArea>
              </CardContent>
            </Card>
          </TabsContent>

          <TabsContent value="database">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Database className="h-5 w-5" />
                  Database Schema
                </CardTitle>
                <CardDescription>Struktur tabel dan RLS policies</CardDescription>
              </CardHeader>
              <CardContent>
                <ScrollArea className="h-[400px] pr-4">
                  <div className="space-y-4">
                    <div>
                      <h3 className="font-semibold mb-2">Tabel Utama</h3>
                      <div className="space-y-2">
                        <div className="p-2 border rounded">
                          <p className="font-medium">profiles</p>
                          <p className="text-xs text-muted-foreground">Data profil karyawan</p>
                        </div>
                        <div className="p-2 border rounded">
                          <p className="font-medium">attendance</p>
                          <p className="text-xs text-muted-foreground">Catatan kehadiran</p>
                        </div>
                        <div className="p-2 border rounded">
                          <p className="font-medium">leave_requests</p>
                          <p className="text-xs text-muted-foreground">Pengajuan cuti</p>
                        </div>
                        <div className="p-2 border rounded">
                          <p className="font-medium">user_roles</p>
                          <p className="text-xs text-muted-foreground">Role pengguna (admin/manager/karyawan)</p>
                        </div>
                      </div>
                    </div>
                    <div>
                      <h3 className="font-semibold mb-2">Contoh Query</h3>
                      <pre className="bg-muted p-3 rounded-lg text-xs overflow-x-auto">
                        {`// Ambil data
const data = await db.query(
  'SELECT * FROM profiles WHERE user_id = ?',
  [userId]
);

// Insert data
await db.query(
  'INSERT INTO attendance (user_id, clock_in) VALUES (?, ?)',
  [userId, new Date().toISOString()]
);`}
                      </pre>
                    </div>
                  </div>
                </ScrollArea>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>
      </main>
    </EnterpriseLayout>
  );
};

export default Dokumentasi;
