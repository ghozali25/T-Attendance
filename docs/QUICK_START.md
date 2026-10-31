# Quick Start

Panduan singkat menjalankan T-Attendance secara lokal. Untuk penjelasan lengkap, lihat `README.md`.

## Prasyarat

- Node.js v18 atau lebih tinggi
- npm
- MySQL 8.0+

## Langkah

### 1. Clone repository

```bash
git clone https://github.com/ghozali25/T-Attendance.git
cd T-Attendance
```

### 2. Install dependencies

```bash
npm install
```

### 3. Konfigurasi environment

Salin contoh environment lalu sesuaikan dengan konfigurasi MySQL lokal Anda:

```bash
cp ".env Example" .env
```

Isi minimal `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, `DB_NAME`, dan `JWT_SECRET` di file `.env`.

### 4. Siapkan database

```bash
npm run migrate:fresh
```

Perintah ini membuat database, menjalankan migrasi, dan mengisi data awal.

### 5. Jalankan aplikasi

```bash
npm run dev
```

Aplikasi berjalan di `http://localhost:8080`. Untuk menjalankan backend dan frontend sekaligus:

```bash
npm run dev:full
```

## Perintah lain

```bash
npm run build    # build untuk production
npm run preview  # preview hasil build
npm run lint     # linting
```

> Setelah login pertama dengan akun awal dari hasil seeding, segera ganti password default demi keamanan.
