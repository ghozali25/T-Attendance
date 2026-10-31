# Troubleshooting

Masalah yang paling sering muncul saat setup lokal dan cara memeriksanya.

## Aplikasi tidak bisa koneksi ke MySQL

1. Pastikan server MySQL 8.0+ berjalan.
2. Periksa variabel `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, dan `DB_NAME` di file `.env` — file ini harus ada di root project.
3. Gunakan endpoint diagnostik `POST /api/auth/check-db` untuk memeriksa koneksi database dan role.

## File `.env` sepertinya tidak terbaca

Nama file template adalah `.env example` (semua huruf kecil, dengan spasi). Di Linux/macOS nama file peka huruf besar/kecil, jadi salin persis:

```bash
cp ".env example" .env
```

Lalu edit isi `.env` sesuai konfigurasi lokal Anda.

## Migrasi / seeding belum jalan

Jalankan ulang migrasi lengkap:

```bash
npm run migrate:fresh
```

> Perintah ini menghapus database yang ada lalu membuat ulang dari nol termasuk data awal. Jangan jalankan pada database yang berisi data penting.

## Tidak bisa login setelah seeding

- Pastikan langkah `migrate:fresh` selesai tanpa error — akun awal dibuat oleh proses seeding.
- Setelah login pertama, segera ganti password default.
- Bila session langsung keluar, kemungkinan token JWT kedaluwarsa atau `JWT_SECRET` berubah di tengah jalan; login ulang dan pastikan `JWT_SECRET` di `.env` konsisten.

## Port 8080 sudah dipakai

Aplikasi dev berjalan di `http://localhost:8080`. Hentikan proses lain yang memakai port tersebut, atau jalankan Vite di port lain:

```bash
npm run dev -- --port 8081
```
