# Changelog

Semua perubahan penting pada proyek ini dicatat di file ini.

Format mengikuti [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), dan proyek ini berusaha mengikuti [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added

- Panduan ringkas `docs/QUICK_START.md` dengan URL clone yang benar.
- `CONTRIBUTING.md` berisi alur branch, gaya commit, dan checklist PR.
- Template issue (bug report, feature request) dan template pull request di `.github/`.
- Dokumentasi `docs/API.md`, `docs/DATABASE.md`, `docs/TROUBLESHOOTING.md`, dan `docs/DEPLOYMENT.md`.

### Changed

- `.gitignore` diselaraskan dengan stack Vite/React (sebelumnya memakai pola Laravel/PHP).
- Instruksi clone dan copy `.env example` di README diperbaiki.

### Removed

- File artefak output `clean.txt` dan `out.txt` di root repository.
- File sisa generate `vite.config.ts.timestamp-*.mjs`.

### Security

- File `.env` yang ter-track dihapus dari repository; pemilik repo perlu merotasi secret yang pernah terekspos di riwayat git.
