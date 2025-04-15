---
title: Main function
---

### **Penjelasan dan Langkah Pembuatan Program**

Program ini adalah aplikasi **Flutter** yang menggunakan **SQLite** untuk menyimpan dan menampilkan daftar produk. Program ini terdiri dari dua bagian utama:

1. **`sqlite_helper.dart`** (sudah dijelaskan sebelumnya) → Mengelola database SQLite.
2. **`main.dart`** (kode yang sedang kita bahas) → Menampilkan antarmuka pengguna (UI) untuk menampilkan dan menambah data produk.

---

## **1. Impor Library**
```dart
import 'package:flutter/material.dart';
import 'sqlite_helper.dart';
```
- **`flutter/material.dart`** → Library utama Flutter untuk membangun UI.
- **`sqlite_helper.dart`** → File helper yang mengelola database SQLite.

---

## **2. Fungsi `main()`**
```dart
void main() {
  runApp(const MyApp());
}
```
- **Menjalankan aplikasi Flutter dengan `MyApp` sebagai widget utama**.

---

## **3. Kelas `MyApp`**
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SQLite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Product List'),
    );
  }
}
```
- **Mendefinisikan tema aplikasi** dengan warna dasar `deepPurple`.
- **Menetapkan `MyHomePage` sebagai halaman utama aplikasi**.

---

## **4. Kelas `MyHomePage`**
```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
```
- **Kelas ini merupakan `StatefulWidget`** agar UI bisa berubah saat data produk diperbarui.
- **Properti `title` digunakan untuk menampilkan judul halaman**.

---

## **5. State `MyHomePage`**
```dart
class _MyHomePageState extends State<MyHomePage> {
  final SQLiteHelper dbHelper = SQLiteHelper();
  List<Map<String, dynamic>> _products = [];
```
- **`dbHelper`** → Objek dari `SQLiteHelper` untuk mengelola database.
- **`_products`** → List yang menyimpan data produk dari database.

---

## **6. Inisialisasi Data (`initState`)**
```dart
@override
void initState() {
  super.initState();
  _loadProducts();
}
```
- **Ketika halaman pertama kali dibuka (`initState`), fungsi `_loadProducts()` dipanggil** untuk mengambil data dari database dan menampilkannya di UI.

---

## **7. Fungsi Memuat Data dari Database**
```dart
Future<void> _loadProducts() async {
  final products = await dbHelper.getProducts();
  setState(() {
    _products = products;
  });
}
```
- **Mengambil semua produk dari database** dengan `dbHelper.getProducts()`.
- **Memperbarui state (`setState`) agar UI menampilkan data terbaru**.

---

## **8. Fungsi Menambah Produk**
```dart
Future<void> _addProduct() async {
  await dbHelper.insertProduct('Product ${_products.length + 1}');
  _loadProducts();
}
```
- **Menambahkan produk baru ke dalam database** dengan nama `'Product X'`.
- **Memuat ulang daftar produk** setelah penambahan.

---

## **9. Pembuatan UI di `build()`**
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text(widget.title)),
    body: ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return ListTile(
          title: Text(product['name']),
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _addProduct,
      child: const Icon(Icons.add),
    ),
  );
}
```
- **`Scaffold`** → Struktur dasar UI Flutter dengan `AppBar`, `ListView`, dan `FloatingActionButton`.
- **`ListView.builder`** → Menampilkan daftar produk dari database.
- **`FloatingActionButton`** → Tombol untuk menambahkan produk baru.

---

## **Alur Kerja Program**
1. **Aplikasi dimulai**, lalu memuat daftar produk dari SQLite (`_loadProducts`).
2. **Data dari SQLite ditampilkan dalam `ListView`**.
3. **Ketika tombol tambah (`+`) ditekan**:
   - Produk baru dimasukkan ke database (`_addProduct`).
   - Daftar produk diperbarui di UI.

---

## **Kesimpulan**
✅ **Program ini adalah aplikasi CRUD sederhana menggunakan SQLite di Flutter**.  
✅ **Data produk disimpan di database SQLite dan ditampilkan dalam UI**.  
✅ **Menggunakan `StatefulWidget` untuk memperbarui UI saat ada perubahan data**.  

🚀 **Cocok untuk belajar SQLite dalam Flutter!**
