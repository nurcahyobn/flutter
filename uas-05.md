Berikut penjelasan program Flutter yang kamu berikan, bagian per bagian:

---

### 1. **Import dan Fungsi `main`**

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}
```

* `import 'package:flutter/material.dart';` – Mengimpor paket UI Flutter.
* `import 'sqlite_helper.dart';` – Mengimpor file lain (mungkin berisi logika SQLite, meskipun tidak digunakan di kode ini).
* `main()` – Fungsi utama yang menjalankan aplikasi Flutter, dimulai dari `MainApp`.

---

### 2. **Widget `MainApp`**

```dart
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InputDataProduk(),
    );
  }
}
```

* `MainApp` adalah root widget.
* Menggunakan `MaterialApp` dan mengatur `home`-nya ke widget `InputDataProduk`.

---

### 3. **Widget `InputDataProduk` (Stateful)**

```dart
class InputDataProduk extends StatefulWidget {
  const InputDataProduk({super.key});

  @override
  State<InputDataProduk> createState() => _InputDataProdukState();
}
```

* Menggunakan `StatefulWidget` karena akan ada perubahan data (misalnya produk bisa ditambah).
* `createState` mengembalikan `_InputDataProdukState`, tempat logika UI dan state berada.

---

### 4. **State `_InputDataProdukState`**

```dart
class _InputDataProdukState extends State<InputDataProduk> {
  final List<Map<String, dynamic>> _products = [];
```

* `_products` adalah list kosong untuk menyimpan data produk. Tiap produk disimpan dalam bentuk `Map` dengan kunci `'nama'`, `'stok'`, dan `'harga'`.

#### Fungsi Menampilkan Snackbar

```dart
  void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
```

* Menampilkan pesan (toast/snackbar) di bawah layar selama 2 detik.

---

### 5. **Build UI**

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
      ),
```

* Membuat layout dasar dengan `Scaffold` dan `AppBar`.

#### Isi Body

```dart
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text('Nama Produk')),
              DataColumn(label: Text('Stok')),
              DataColumn(label: Text('Harga')),
            ],
            rows: _products.map((product) {
              return DataRow(cells: <DataCell>[
                DataCell(Text(product['nama'])),
                DataCell(Text('${product['stok']}')),
                DataCell(Text('${product['harga']}')),
              ]);
            }).toList(),
          ),
        ),
      ),
```

* `SingleChildScrollView` digunakan agar tabel bisa di-scroll jika terlalu panjang.
* `DataTable` digunakan untuk menampilkan list produk dalam bentuk tabel.
* Tabel menampilkan data produk jika ada dalam `_products`.

#### Tombol Tambah (Floating Action Button)

```dart
      floatingActionButton: FloatingActionButton(
        onPressed: () => showToast(context, 'Data sukses di tambah!'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

* `FloatingActionButton` menampilkan ikon tambah (`+`) di kanan bawah.
* Saat ditekan, memanggil `showToast` untuk menampilkan pesan “Data sukses di tambah!”
* **Catatan**: belum ada logika untuk benar-benar menambahkan data ke `_products`.

---

### Ringkasan

* Program ini menampilkan halaman dengan tabel kosong dan tombol tambah.
* Saat tombol ditekan, hanya menampilkan snackbar (belum menambahkan produk ke tabel).
* Struktur sudah siap dikembangkan untuk menambahkan form input produk dan menyimpan ke SQLite (mungkin akan menggunakan `sqlite_helper.dart` nantinya).

---

Apakah kamu ingin saya bantu tambahkan form input produk dan simpan ke daftar?
