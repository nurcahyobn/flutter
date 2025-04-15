---
title: Membuat Object Database 
---

Berikut adalah penjelasan langkah pembuatan program **SQLiteHelper** di atas:

---

### **1. Import Library**
```dart
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
```
- `sqflite_common_ffi`: Library yang memungkinkan penggunaan SQLite menggunakan FFI (Foreign Function Interface) di Flutter.
- `sqflite_common_ffi_web`: Ekstensi dari `sqflite_common_ffi` untuk mendukung SQLite di platform web.

---

### **2. Deklarasi Kelas `SQLiteHelper`**
```dart
class SQLiteHelper {
  Database? _database;
```
- **`SQLiteHelper`** adalah kelas yang digunakan untuk mengelola database SQLite.
- **`_database`** adalah properti privat yang digunakan untuk menyimpan instance database.

---

### **3. Getter untuk Mengakses Database**
```dart
Future<Database> get database async {
  if (_database != null) {
    return _database!;
  }
  _database = await _initDB();
  return _database!;
}
```
- **Mengecek apakah database sudah diinisialisasi**.
  - Jika sudah, langsung dikembalikan.
  - Jika belum, dipanggil metode `_initDB()` untuk menginisialisasi database.

---

### **4. Inisialisasi Database**
```dart
Future<Database> _initDB() async {
  databaseFactory = databaseFactoryFfiWeb;
  return await databaseFactory.openDatabase('product_database', options: OpenDatabaseOptions(
    version: 1,
    onCreate: _onCreate,
  ));
}
```
- **Menentukan `databaseFactory`** agar menggunakan SQLite versi Web (`databaseFactoryFfiWeb`).
- **Membuka atau membuat database dengan nama `product_database`**.
- **Menjalankan `onCreate` jika database belum ada** (versi pertama).

---

### **5. Membuat Tabel Database**
```dart
Future<void> _onCreate(Database db, int version) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS product(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL
    )
  ''');
}
```
- **Mengeksekusi perintah SQL untuk membuat tabel `product`** jika belum ada.
- **Kolom tabel**:
  - `id`: **Primary key** dengan auto-increment.
  - `name`: **Kolom teks** yang wajib diisi (`NOT NULL`).

---

### **6. Menambahkan Data ke Tabel**
```dart
Future<int> insertProduct(String name) async {
  final db = await database;
  return await db.insert('product', {'name': name});
}
```
- **Mengambil instance database**.
- **Menyisipkan data produk** ke dalam tabel `product`.

---

### **7. Mengambil Data dari Tabel**
```dart
Future<List<Map<String, dynamic>>> getProducts() async {
  final db = await database;
  return await db.query('product');
}
```
- **Mengambil instance database**.
- **Melakukan query untuk mengambil semua data dari tabel `product`**.

---

### **Kesimpulan**
Kelas `SQLiteHelper` ini berfungsi untuk:
1. **Menginisialisasi database SQLite** menggunakan `sqflite_common_ffi_web`.
2. **Membuat tabel `product`** jika belum ada.
3. **Memasukkan data produk** ke dalam tabel.
4. **Mengambil semua data produk** dari tabel.

