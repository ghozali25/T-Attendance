import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { useToast } from "@/hooks/use-toast";
import { useAuth } from "@/hooks/useAuth";
import { Download, Database, FileCode, Terminal, Shield, Loader2, CheckCircle, Copy, AlertTriangle } from "lucide-react";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import EnterpriseLayout from "@/components/layout/EnterpriseLayout";
import { ADMIN_MENU_SECTIONS } from "@/config/menu";

const ExportDatabase = () => {
  const [isExporting, setIsExporting] = useState(false);
  const [exportSuccess, setExportSuccess] = useState(false);
  const { toast } = useToast();
  const { user } = useAuth();

  const handleExport = async () => {
    setIsExporting(true);
    setExportSuccess(false);

    try {
      // Note: MySQL export requires different implementation than Supabase Edge Functions
      // This feature needs to be re-implemented using mysqldump or a MySQL-specific export API
      toast({
        title: "Fitur Tidak Tersedia",
        description: "Export database untuk MySQL belum diimplementasikan. Gunakan mysqldump atau backup tool database MySQL.",
        variant: "destructive",
      });
    } catch (error) {
      console.error('Export error:', error);
      toast({
        title: "Export Gagal",
        description: error instanceof Error ? error.message : "Terjadi kesalahan",
        variant: "destructive",
      });
    } finally {
      setIsExporting(false);
    }
  };

  const copyToClipboard = (text: string) => {
    navigator.clipboard.writeText(text);
    toast({
      title: "Disalin",
      description: "Teks telah disalin ke clipboard",
    });
  };

  const envConfig = `DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=hris_db
DB_USERNAME=root
DB_PASSWORD=your_database_password_here`;

  const mysqlImport = `# Import ke MySQL lokal
mysql -u root -p hris_db < database_export.sql

# Atau dengan host tertentu
mysql -h localhost -u root -p hris_db < database_export.sql`;

  const laravelMigration = `<?php

use Illuminate\\Database\\Migrations\\Migration;
use Illuminate\\Database\\Schema\\Blueprint;
use Illuminate\\Support\\Facades\\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Profiles table
        Schema::create('profiles', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('user_id');
            $table->string('full_name')->nullable();
            $table->string('department')->nullable();
            $table->string('position')->nullable();
            $table->string('phone')->nullable();
            $table->text('address')->nullable();
            $table->string('avatar_url')->nullable();
            $table->date('join_date')->nullable();
            $table->timestampsTz();
        });

        // Attendance table
        Schema::create('attendance', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('user_id');
            $table->timestampTz('clock_in');
            $table->timestampTz('clock_out')->nullable();
            $table->string('clock_in_location')->nullable();
            $table->string('clock_out_location')->nullable();
            $table->string('status')->default('present');
            $table->text('notes')->nullable();
            $table->timestampsTz();
        });

        // Leave requests table
        Schema::create('leave_requests', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('user_id');
            $table->string('leave_type');
            $table->date('start_date');
            $table->date('end_date');
            $table->text('reason')->nullable();
            $table->string('status')->default('pending');
            $table->uuid('approved_by')->nullable();
            $table->timestampTz('approved_at')->nullable();
            $table->text('rejection_reason')->nullable();
            $table->timestampsTz();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('leave_requests');
        Schema::dropIfExists('attendance');
        Schema::dropIfExists('profiles');
    }
};`;

  const profileModel = `<?php

namespace App\\Models;

use Illuminate\\Database\\Eloquent\\Model;
use Illuminate\\Database\\Eloquent\\Concerns\\HasUuids;

class Profile extends Model
{
    use HasUuids;

    protected $fillable = [
        'user_id',
        'full_name',
        'department',
        'position',
        'phone',
        'address',
        'avatar_url',
        'join_date',
    ];

    protected $casts = [
        'join_date' => 'date',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function attendance()
    {
        return $this->hasMany(Attendance::class, 'user_id', 'user_id');
    }

    public function leaveRequests()
    {
        return $this->hasMany(LeaveRequest::class, 'user_id', 'user_id');
    }
}`;

  const profileController = `<?php

namespace App\\Http\\Controllers;

use App\\Models\\Profile;
use Illuminate\\Http\\Request;

class ProfileController extends Controller
{
    public function index()
    {
        $profiles = Profile::with(['attendance', 'leaveRequests'])
            ->paginate(10);
            
        return view('profiles.index', compact('profiles'));
    }

    public function show(Profile $profile)
    {
        $profile->load(['attendance', 'leaveRequests']);
        
        return view('profiles.show', compact('profile'));
    }

    public function update(Request $request, Profile $profile)
    {
        $validated = $request->validate([
            'full_name' => 'required|string|max:255',
            'department' => 'nullable|string|max:255',
            'position' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:20',
            'address' => 'nullable|string',
        ]);

        $profile->update($validated);

        return redirect()->route('profiles.show', $profile)
            ->with('success', 'Profile updated successfully');
    }
}`;

  const curlExample = `# Export database menggunakan mysqldump
mysqldump -u root -p hris_db > database_export.sql

# Atau dengan host tertentu
mysqldump -h localhost -u root -p hris_db > database_export.sql`;

  return (
    <EnterpriseLayout
      title="Export Database"
      subtitle="Export seluruh schema dan data database untuk backup atau migrasi ke Laravel"
      roleLabel="Administrator"
      showExport={false}
      menuSections={ADMIN_MENU_SECTIONS}
      breadcrumbs={[
        { label: "Admin", href: "/admin/dashboard" },
        { label: "Export Database" },
      ]}
    >
      <div className="max-w-6xl mx-auto py-8">

        {/* Export Card */}
        <Card className="mb-8">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Database className="h-5 w-5" />
              Download SQL Dump
            </CardTitle>
            <CardDescription>
              Export semua tabel: profiles, attendance, leave_requests, user_roles, system_settings
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="flex items-center gap-4">
              <Button
                onClick={handleExport}
                disabled={isExporting}
                size="lg"
                className="gap-2"
              >
                {isExporting ? (
                  <>
                    <Loader2 className="h-4 w-4 animate-spin" />
                    Mengexport...
                  </>
                ) : exportSuccess ? (
                  <>
                    <CheckCircle className="h-4 w-4" />
                    Export Lagi
                  </>
                ) : (
                  <>
                    <Download className="h-4 w-4" />
                    Export Database
                  </>
                )}
              </Button>
              {exportSuccess && (
                <span className="text-sm text-green-600 flex items-center gap-1">
                  <CheckCircle className="h-4 w-4" />
                  File SQL berhasil diunduh!
                </span>
              )}
            </div>
          </CardContent>
        </Card>

        {/* Documentation Tabs */}
        <Tabs defaultValue="laravel" className="w-full">
          <TabsList className="grid w-full grid-cols-4">
            <TabsTrigger value="laravel">Laravel Setup</TabsTrigger>
            <TabsTrigger value="import">Import SQL</TabsTrigger>
            <TabsTrigger value="models">Models</TabsTrigger>
            <TabsTrigger value="api">API Usage</TabsTrigger>
          </TabsList>

          <TabsContent value="laravel" className="space-y-4">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <FileCode className="h-5 w-5" />
                  Konfigurasi Laravel .env
                </CardTitle>
                <CardDescription>
                  Tambahkan kredensial database ke file .env Laravel Anda
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="relative">
                  <pre className="bg-muted p-4 rounded-lg overflow-x-auto text-sm">
                    <code>{envConfig}</code>
                  </pre>
                  <Button
                    variant="ghost"
                    size="sm"
                    className="absolute top-2 right-2"
                    onClick={() => copyToClipboard(envConfig)}
                  >
                    <Copy className="h-4 w-4" />
                  </Button>
                </div>
                <div className="mt-4 p-4 bg-yellow-50 dark:bg-yellow-950 rounded-lg">
                  <p className="text-sm text-yellow-800 dark:text-yellow-200">
                    <Shield className="h-4 w-4 inline mr-1" />
                    <strong>Catatan Keamanan:</strong> Password database dapat ditemukan di
                    pengaturan Lovable Cloud. Jangan pernah commit file .env ke Git!
                  </p>
                </div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle>Laravel Migration</CardTitle>
                <CardDescription>
                  Contoh migration file untuk membuat tabel di Laravel
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="relative">
                  <pre className="bg-muted p-4 rounded-lg overflow-x-auto text-sm max-h-96">
                    <code>{laravelMigration}</code>
                  </pre>
                  <Button
                    variant="ghost"
                    size="sm"
                    className="absolute top-2 right-2"
                    onClick={() => copyToClipboard(laravelMigration)}
                  >
                    <Copy className="h-4 w-4" />
                  </Button>
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          <TabsContent value="import" className="space-y-4">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Terminal className="h-5 w-5" />
                  Import SQL ke MySQL
                </CardTitle>
                <CardDescription>
                  Gunakan perintah mysql untuk import file SQL yang diexport
                </CardDescription>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="relative">
                  <pre className="bg-muted p-4 rounded-lg overflow-x-auto text-sm">
                    <code>{mysqlImport}</code>
                  </pre>
                  <Button
                    variant="ghost"
                    size="sm"
                    className="absolute top-2 right-2"
                    onClick={() => copyToClipboard(mysqlImport)}
                  >
                    <Copy className="h-4 w-4" />
                  </Button>
                </div>

                <div className="space-y-2">
                  <h4 className="font-semibold">Langkah-langkah:</h4>
                  <ol className="list-decimal list-inside space-y-1 text-sm text-muted-foreground">
                    <li>Install MySQL di komputer lokal Anda</li>
                    <li>Buat database baru: <code className="bg-muted px-1">mysql -u root -p -e "CREATE DATABASE hris_db"</code></li>
                    <li>Jalankan perintah import di atas</li>
                    <li>Verifikasi data dengan: <code className="bg-muted px-1">mysql -u root -p hris_db -e "SHOW TABLES;"</code></li>
                  </ol>
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          <TabsContent value="models" className="space-y-4">
            <Card>
              <CardHeader>
                <CardTitle>Profile Model</CardTitle>
                <CardDescription>
                  Contoh Eloquent Model untuk tabel profiles
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="relative">
                  <pre className="bg-muted p-4 rounded-lg overflow-x-auto text-sm max-h-80">
                    <code>{profileModel}</code>
                  </pre>
                  <Button
                    variant="ghost"
                    size="sm"
                    className="absolute top-2 right-2"
                    onClick={() => copyToClipboard(profileModel)}
                  >
                    <Copy className="h-4 w-4" />
                  </Button>
                </div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle>Profile Controller</CardTitle>
                <CardDescription>
                  Contoh Controller untuk CRUD profiles
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="relative">
                  <pre className="bg-muted p-4 rounded-lg overflow-x-auto text-sm max-h-80">
                    <code>{profileController}</code>
                  </pre>
                  <Button
                    variant="ghost"
                    size="sm"
                    className="absolute top-2 right-2"
                    onClick={() => copyToClipboard(profileController)}
                  >
                    <Copy className="h-4 w-4" />
                  </Button>
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          <TabsContent value="api" className="space-y-4">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Terminal className="h-5 w-5" />
                  Export menggunakan mysqldump
                </CardTitle>
                <CardDescription>
                  Cara export database MySQL langsung dari command line
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="relative">
                  <pre className="bg-muted p-4 rounded-lg overflow-x-auto text-sm">
                    <code>{curlExample}</code>
                  </pre>
                  <Button
                    variant="ghost"
                    size="sm"
                    className="absolute top-2 right-2"
                    onClick={() => copyToClipboard(curlExample)}
                  >
                    <Copy className="h-4 w-4" />
                  </Button>
                </div>
                <div className="mt-4 p-4 bg-blue-50 dark:bg-blue-950 rounded-lg">
                  <p className="text-sm text-blue-800 dark:text-blue-200">
                    <strong>Catatan:</strong> Pastikan Anda memiliki akses ke database MySQL dan password yang benar.
                    Hanya admin yang dapat melakukan export database.
                  </p>
                </div>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>

        {/* VS Code Setup Guide */}
        <Card className="mt-8">
          <CardHeader>
            <CardTitle>Setup Laravel di VS Code</CardTitle>
            <CardDescription>
              Panduan lengkap untuk memulai project Laravel
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="grid gap-4 md:grid-cols-2">
              <div className="space-y-2">
                <h4 className="font-semibold">1. Install Laravel</h4>
                <pre className="bg-muted p-3 rounded text-sm">
                  <code>composer create-project laravel/laravel my-app</code>
                </pre>
              </div>
              <div className="space-y-2">
                <h4 className="font-semibold">2. Masuk ke direktori</h4>
                <pre className="bg-muted p-3 rounded text-sm">
                  <code>cd my-app && code .</code>
                </pre>
              </div>
              <div className="space-y-2">
                <h4 className="font-semibold">3. Install dependencies</h4>
                <pre className="bg-muted p-3 rounded text-sm">
                  <code>composer install && npm install</code>
                </pre>
              </div>
              <div className="space-y-2">
                <h4 className="font-semibold">4. Setup database</h4>
                <pre className="bg-muted p-3 rounded text-sm">
                  <code>php artisan migrate</code>
                </pre>
              </div>
              <div className="space-y-2">
                <h4 className="font-semibold">5. Import SQL dump</h4>
                <pre className="bg-muted p-3 rounded text-sm">
                  <code>mysql -u root -p hris_db &lt; export.sql</code>
                </pre>
              </div>
              <div className="space-y-2">
                <h4 className="font-semibold">6. Jalankan server</h4>
                <pre className="bg-muted p-3 rounded text-sm">
                  <code>php artisan serve</code>
                </pre>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </EnterpriseLayout>
  );
};

export default ExportDatabase;
