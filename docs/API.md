# API Reference

Dokumentasi endpoint backend T-Attendance. Semua endpoint berada di bawah base path `/api` dan — kecuali endpoint diagnostik — memerlukan autentikasi JWT.

## Autentikasi

Kirim token pada header setiap request:

```http
Authorization: Bearer <JWT>
```

Token diperoleh dari proses login aplikasi. Bila token kedaluwarsa, lakukan login ulang.

## Auth

| Method | Endpoint | Keterangan |
| --- | --- | --- |
| POST | `/api/auth/me` | Verifikasi token dan ambil data user saat ini |
| POST | `/api/auth/check-db` | Diagnostik koneksi database dan role user |

## Database proxy

Backend menyediakan shim klien MySQL yang meneruskan query ke API ini, untuk kompatibilitas kode legacy yang memakai `db.query`.

| Method | Endpoint | Keterangan |
| --- | --- | --- |
| POST | `/api/db/query` | Eksekusi query SQL SELECT (untuk query kompleks) |
| POST | `/api/db/execute` | Eksekusi operasi DML (INSERT, UPDATE, DELETE) |

> Endpoint `/api/db/*` bersifat internal untuk frontend aplikasi ini. Jangan ekspos ke publik tanpa pembatasan tambahan.

## Attendance

| Method | Endpoint | Keterangan |
| --- | --- | --- |
| GET | `/api/attendance` | Query absensi dengan filter tanggal dan user |
| GET | `/api/attendance?start_date=&end_date=` | Query absensi pada rentang tanggal |

Parameter yang didukung pada endpoint absensi antara lain `start_date` dan `end_date` (format tanggal ISO, misalnya `2026-10-01`).
