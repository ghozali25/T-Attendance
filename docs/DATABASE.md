# Database Schema

T-Attendance memakai MySQL 8.0+. Skema lengkap dibuat oleh `scripts/mysql_migration.sql`.

## Cara menerapkan

Cara tercepat (membuat ulang database dari nol, termasuk seeding):

```bash
npm run migrate:fresh
```

> Perintah ini menghapus database yang ada. Untuk penerapan manual langkah demi langkah, lihat bagian Setup pada `README.md`.

## Tabel

| Tabel | Fungsi |
| --- | --- |
| `users` | Pengguna dan autentikasi |
| `user_roles` | Role pengguna (admin, manager, employee) |
| `profiles` | Profil karyawan |
| `departments` | Departemen |
| `attendance` | Data absensi (check-in / check-out) |
| `attendance_periods` | Periode absensi |
| `work_journals` | Jurnal kerja / log aktivitas |
| `audit_logs` | Log audit perubahan |

## View

| View | Fungsi |
| --- | --- |
| `v_attendance_summary` | Ringkasan absensi |

## Catatan perubahan skema

- Kolom `status` ditambahkan pada `attendance` untuk tracking status kehadiran.
- Kolom `deleted_at` ditambahkan pada `attendance` untuk soft delete.
- Tabel `departments` ditambahkan untuk manajemen departemen.

Perubahan skema baru wajib diterapkan lewat script migrasi dan dicatat pada tabel di atas.
