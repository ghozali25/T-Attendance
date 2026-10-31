# Deployment

Panduan singkat menyiapkan T-Attendance untuk production.

## Build frontend

```bash
npm run build
```

Hasil build berada di folder `dist/` dan bersifat statis. Untuk memeriksa hasil build secara lokal:

```bash
npm run preview
```

## Komponen yang berjalan

- **Frontend**: hasil build di `dist/`, dapat disajikan oleh static hosting / web server apa pun. Repo ini menyertakan `vercel.json` untuk deployment ke Vercel.
- **Backend**: API Express.js yang melayani endpoint `/api/*` (lihat `docs/API.md`).
- **Database**: MySQL 8.0+ (lihat `docs/DATABASE.md`).

## Environment production

- Buat file `.env` production dari template `.env example`.
- Gunakan `JWT_SECRET` yang kuat dan unik untuk production — jangan memakai nilai dari lingkungan dev.
- Jangan pernah commit file `.env` ke repository.

## Checklist sebelum go-live

- [ ] Migrasi database production sudah diterapkan (`scripts/mysql_migration.sql`)
- [ ] Password akun awal hasil seeding sudah diganti
- [ ] `JWT_SECRET` production berbeda dari dev dan tersimpan aman
- [ ] `npm run lint` dan `npm run build` lolos
