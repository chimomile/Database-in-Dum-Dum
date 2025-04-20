# DATABASE IN DUM-DUM

## 📖 Deskripsi Singkat
`DATABASE IN DUM-DUM` adalah sebuah proyek basis data yang dikembangkan untuk mengelola data penjualan produk minuman dan barang di sebuah usaha fiktif bernama Dum-Dum. Proyek ini mencakup perancangan skema database, validasi data yang ketat, implementasi prosedur tersimpan (stored procedure), penggunaan trigger, dan pembuatan view untuk membantu visualisasi data. Proyek ini ditujukan untuk memenuhi tugas akhir dari mata kuliah Basis Data dan mencerminkan praktik terbaik dalam pengembangan sistem database relasional.

## 🧩 Tujuan Proyek
- Menyusun sistem database yang terstruktur dan efisien.
- Menerapkan validasi pada data untuk menjamin integritas.
- Menggunakan stored procedure untuk mempermudah pengelolaan data.
- Menyimpan log perubahan data dengan trigger.
- Menampilkan data dengan view untuk kemudahan analisis.

## 🧰 Teknologi & Tools
- **Database Management System**: Microsoft SQL Server
- **Diagram Tools**: Draw.io (untuk membuat ERD dan Schematic Diagram)
- **IDE**: SQL Server Management Studio (SSMS)
- **Dokumentasi**: Microsoft Word

## 🧠 Alur Sistem
1. **Perancangan ERD**: Menggambarkan relasi antar entitas seperti pegawai, pelanggan, produk, dan transaksi.
2. **Desain Skema Database**: Dibagi menjadi dua skema: `HUMAN` (untuk data personal) dan `PRODUCT` (untuk data produk dan stok).
3. **Pembuatan Tabel**: Menentukan field, tipe data, panjang karakter, serta constraint seperti `PRIMARY KEY`, `FOREIGN KEY`, dan `CHECK`.
4. **Validasi**: Diterapkan di berbagai field (seperti email dan nomor telepon) untuk memastikan data masuk sesuai format.
5. **Input Data**: Data dimasukkan secara manual maupun otomatis menggunakan `stored procedure`.
6. **Trigger**: Digunakan untuk mencetak notifikasi ketika data dimasukkan atau diperbarui di tabel tertentu.
7. **View**: Disediakan view bernama `Menu` untuk menyatukan data dari beberapa tabel yang berhubungan.

## 🗃️ Struktur Skema & Tabel
### Skema `HUMAN`
- **EMPLOYEE**: Data pegawai (nama, jabatan, email, alamat).
- **CUSTOMER**: Data pelanggan (nama dan email).
- **SUPPLIER**: Pemasok barang (termasuk nomor telepon dan alamat).

### Skema `PRODUCT`
- **STOCKPRODUCT**: Produk yang tersedia dan jumlah stok.
- **BARANG**: Daftar barang tambahan seperti VGA, SSD, RAM.
- **ORDERS**: Informasi pesanan pelanggan.
- **SUPPLIER**: Duplikasi supplier untuk kebutuhan produk.

### Tabel Umum
- **PAYMENT**: Data pembayaran (metode, total).
- **TRANSAKSI**: Catatan transaksi pembelian oleh pelanggan.
- **VIEW Menu**: Tampilan ringkas pemesanan berdasarkan ID order.

## 🛡️ Contoh Validasi
- ID Pegawai: `id_employee` → harus diawali `E` (contoh: `E001`)
- Email: `email_customer` → harus mengandung `@gmail.com`
- Nomor telepon: `phone_number` → harus dimulai dari `08`
- ID Produk: `id_sproduct` → harus dimulai dengan `SPR` (contoh: `SPR001`)

## 🔁 Stored Procedures dan Trigger
### Stored Procedure yang tersedia:
- `SPALL`: Menampilkan seluruh data dari semua tabel
- `InsertCustomer`: Menambahkan pelanggan baru
- `sp_UpdateCustomer`: Memperbarui data pelanggan
- `DeleteCustomerByID`: Menghapus pelanggan berdasarkan ID
- `SPINPUTDATAPEGAWAI`: Menambahkan pegawai

### Trigger:
- `TRINPUTBARANG`: Menampilkan notifikasi saat data barang dimasukkan
- `UPDATEPRODUCT_Log`: Menyimpan log saat data produk diperbarui
- `DeleteSTOCKPRODUCT_Log1`: Menyimpan log saat data produk dihapus

## 👁️‍🗨️ View: Menu
```sql
CREATE VIEW Menu AS
SELECT o.id_order, p.name_product AS product_name, p.price
FROM ORDERS o
JOIN PRODUCT.STOCKPRODUCT p ON o.id_sproduct = p.id_sproduct;
```

## 📷 Screenshot
### Entity Relationship Diagram (ERD)
![ERD](./ERD.png)

### Schematic Diagram
![Schematic](./SchematicDiagram.jpg)

## 📄 Dokumentasi Lengkap
Lihat file berikut untuk laporan proyek yang mencakup penjelasan sistem, desain tabel, ERD, serta proses analisis:
- [`[PROJECT 3] DATABASE IN DUM DUM.docx`](./[PROJECT%203]%20DATABASE%20IN%20DUM%20DUM.docx)

## 🔧 Cara Menjalankan Project
1. Buka Microsoft SQL Server Management Studio (SSMS).
2. Jalankan perintah:
   ```sql
   CREATE DATABASE DUMDUM;
   USE DUMDUM;
   ```
3. Buat semua skema dan tabel sesuai `DUMDUM.sql`.
4. Jalankan prosedur `EXEC SPALL` untuk melihat semua data.
5. Gunakan `EXEC` pada stored procedure untuk input atau update data.
6. Cek view `Menu` untuk melihat ringkasan pesanan.

## 👨‍💻 Developer
- Leann Nataly Kenan Pakpahan
- Salma Aufa Ramadhanti Iswara
- Techi Kariska Sari

## 📅 Timeline
- **Mulai**: 14 Desember 2023
- **Selesai**: 28 Desember 2023

