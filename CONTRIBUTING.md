# Contributing to T-Attendance

Terima kasih sudah berkontribusi. Panduan ini merangkum cara menyiapkan lingkungan dan mengirim perubahan.

## Prasyarat

- Node.js v18+
- npm
- MySQL 8.0+

Ikuti [docs/QUICK_START.md](docs/QUICK_START.md) untuk menjalankan aplikasi secara lokal.

## Alur kerja

1. Buat branch dari `master` dengan pola:
   - `feat/<nama-fitur>` untuk fitur baru
   - `fix/<nama-perbaikan>` untuk perbaikan bug
   - `docs/<topik>` untuk dokumentasi
   - `chore/<topik>` untuk perawatan repo
2. Kerjakan perubahan dalam commit kecil dan fokus.
3. Gunakan pesan commit [Conventional Commits](https://www.conventionalcommits.org/), contoh:
   - `feat(attendance): add bulk check-in import`
   - `fix(auth): handle expired JWT on refresh`
   - `docs: update setup instructions`
4. Pastikan lolos pemeriksaan lokal:

   ```bash
   npm run lint
   npm run build
   ```

5. Buka pull request ke `master` dan isi template PR yang tersedia.

## Aturan penting

- Jangan pernah commit file `.env` atau kredensial apa pun. Gunakan `.env example` sebagai template.
- Jangan commit hasil build (`dist/`) atau file scratch/debug pribadi.
- Perubahan skema database harus disertai pembaruan script migrasi di `scripts/` dan catatan di deskripsi PR.
