# WaristMate

Aplikasi pembelajaran & kalkulator ilmu Faraidh (hukum waris Islam), disusun berdasarkan kitab **Faraidh KMI Gontor**. WaristMate membantu pengguna mempelajari ilmu waris secara terstruktur, sekaligus menghitung pembagian warisan secara interaktif dan akurat sesuai kaidah fiqih.

## ✨ Fitur

- **🧮 Kalkulator Waris**
  Kalkulator bertahap (multi-step) yang memandu pengguna mengisi data harta peninggalan, ahli waris yang masih hidup, hingga menghasilkan rincian bagian tiap ahli waris (dzawil furud, ashabah) lengkap dengan nominal, termasuk penyesuaian otomatis untuk kasus _Al-'Aul_ dan _Ar-Radd_.

- **📖 Modul Pembelajaran**
  Materi ilmu Faraidh disusun per bab (Pendahuluan Ilmu Waris, Harta Waris, Sebab-sebab Warisan, Ahli Waris, Metode Dasar, hingga Koreksi Masalah), diadaptasi dari kitab Faraidh KMI Gontor, dilengkapi dalil naqli (ayat & hadits) di tiap pembahasan relevan.

- **📝 Catatan Personal**
  Ruang privat bagi pengguna untuk mencatat estimasi harta, hutang, aset non-tunai, dan simulasi wasiat mereka sendiri. Bersifat sensitif (data finansial pribadi), sehingga direncanakan dilindungi dengan PIN/biometrik terpisah dari lock aplikasi.

- **🕌 Dalil & Fakta Harian**
  Kartu ayat/hadits dan "Tahukah Kamu?" di halaman Home, menampilkan potongan dalil dan fakta seputar Faraidh secara bergantian, agar pengguna mendapat sentuhan edukatif ringan setiap membuka aplikasi.

- **👤 Autentikasi Google**
  Login menggunakan akun Google (via Supabase Auth), memungkinkan sinkronisasi progres belajar dan catatan personal antar perangkat.

- **🧩 Quiz** _(dalam pengembangan)_
  Uji pemahaman per bab. Fitur ini belum tersedia di versi saat ini — ditandai _"Segera Hadir"_ pada navigasi, prioritas dialihkan ke penyempurnaan kalkulator & modul terlebih dahulu.

## 🛠️ Tech Stack

- **Flutter** — cross-platform app framework
- **Supabase** — autentikasi & backend (`signInWithIdToken`)
- **Google Sign-In** — provider autentikasi
- **Provider** — state management (`ChangeNotifier`)

## 🚀 Memulai (Getting Started)

### Prasyarat

- Flutter SDK (channel stable)
- Android SDK & satu device/emulator Android
- Akun Supabase project yang sudah dikonfigurasi
- Git

### Instalasi

```bash
git clone <repo-url>
cd waristmate_app
flutter pub get
```

### Konfigurasi Autentikasi Google

Aplikasi ini menggunakan Google Sign-In yang divalidasi lewat Supabase. Untuk menjalankan/build aplikasi ini di device sendiri, kamu perlu:

1. Punya **Web application OAuth Client ID** dari Google Cloud Console, diisikan ke `AuthConfig.clientIdForPlatform` (dipakai sebagai `serverClientId`).
2. Daftarkan **SHA-1 fingerprint** dari keystore yang kamu pakai sebagai **Android OAuth Client ID** terpisah di Google Cloud Console:
   - **Debug**: SHA-1 dari `~/.android/debug.keystore` (password default: `android`)
   - **Release**: SHA-1 dari keystore rilis sendiri (lihat bagian _Signing_ di bawah)

   > Satu Android Client ID hanya menyimpan satu SHA-1 — debug dan release harus terdaftar sebagai dua entry terpisah dengan `package name` yang sama.

### Signing (Release Keystore)

Untuk build release, siapkan `android/key.properties` (jangan pernah di-commit ke Git):

```properties
storePassword=xxxxxxxx
keyPassword=xxxxxxxx
keyAlias=waristmate
storeFile=../waristmate-release-key.jks
```

Pastikan `android/.gitignore` sudah mengabaikan file sensitif ini:

```
key.properties
*.jks
```

## 📦 Build & Rilis

Project ini punya dua script build dengan tujuan berbeda:

### `build-dev.sh` — build harian/testing

```bash
./build-dev.sh
```

- Tidak mengubah versi di `pubspec.yaml`.
- Aman dijalankan berkali-kali kapan saja, tanpa efek samping ke nomor versi.
- Menghasilkan APK per-ABI (`--split-per-abi`) di `build/app/outputs/flutter-apk/`.
- Gunakan ini untuk testing fitur baru di device sendiri sebelum siap dirilis ke tester lain.

### `build-prod.sh` — build rilis resmi

```bash
./build-prod.sh          # bump patch (default)   1.0.0 -> 1.0.1
./build-prod.sh minor    # bump minor              1.0.5 -> 1.1.0
./build-prod.sh major    # bump major              1.4.2 -> 2.0.0
```

- Otomatis menaikkan versi di `pubspec.yaml` sesuai level yang dipilih.
- Build number diambil dari jumlah commit Git (`git rev-list --count HEAD`).
- Menolak berjalan jika ada perubahan kode yang belum di-commit (`git status` harus bersih), untuk memastikan versi yang tercatat selalu sinkron dengan kode yang benar-benar dirilis.
- Otomatis melakukan commit perubahan versi setelah build berhasil.
- Gunakan ini **hanya** saat benar-benar siap membagikan APK ke tester atau merilis ke publik.

> Kedua script menghasilkan APK ter-split per arsitektur CPU. Untuk sideload manual ke device modern (2018 ke atas), gunakan file `app-arm64-v8a-*.apk`.

## 📁 Struktur Proyek (ringkas)

```
lib/
├── core/
│   └── config/         # theme, auth config, app info
├── controllers/         # ChangeNotifier controllers (state management)
├── services/
│   └── auth/            # AuthService (Supabase + Google Sign-In)
├── features/
│   └── home/
│       ├── data/         # data statis (fun facts, dalil)
│       └── widgets/       # HeroCard, FunFactCard, DalilCard, dll.
android/
├── app/
│   └── build.gradle.kts  # signing config, minify, shrink resources
├── key.properties        # (gitignored) kredensial signing release
└── waristmate-release-key.jks  # (gitignored) keystore release
```

## 🤝 Kontribusi

Project ini dikembangkan untuk keperluan pembelajaran ilmu Faraidh berbasis kitab KMI Gontor. Saran, laporan bug, atau kontribusi materi pembelajaran sangat terbuka — silakan buka issue atau pull request.
