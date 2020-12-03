# Aplikasi dengan Navigasi

Untuk Pengujian awali dengan perintah berikut:

```
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Informasi(),
  ));
}

```

Beberapa bagian berikutnya menunjukkan cara menavigasi di antara dua rute, menggunakan langkah-langkah berikut:

1. Buat 2 (dua) Tampilan visual
1. Navigasikan ke rute kedua menggunakan `Navigator.push ()`
1. Kembali ke rute pertama menggunakan `Navigator.pop ()`


## 1. Buat 2 (dua) Tampilan visual

Pertama, buat dua rute untuk dikerjakan. Karena ini adalah contoh dasar, setiap rute hanya berisi satu tombol. Mengetuk tombol di rute pertama akan menavigasi ke rute kedua. Mengetuk tombol di rute kedua akan mengembalikan ke rute pertama.

```
class Informasi extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Mahasiswa'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Input Data'),
          onPressed: () {
            // Navigasi ke rute kedua (Input Data).
          },
        ),
      ),
    );
  }
}

class InputData extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Data Mahasiswa"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke rute pertama (Informasi)
          },
          child: Text('Kembali'),
        ),
      ),
    );
  }
}

```

## 2. Navigasikan ke rute kedua menggunakan `Navigator.push ()`

Untuk beralih ke rute baru, gunakan `Navigator.push()`. Push() menambahkan Rute ke tumpukan rute dikelola oleh Navigator. Dari mana Routea salnya Anda dapat membuatnya sendiri, atau menggunakan  MaterialPageRoute, yang berguna karena transisi ke rute baru menggunakan animasi khusus platform.


```
onPressed: () {
  // Navigasi ke rute kedua (Input Data).
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => InputData()),  
  );
}
```

## 3. Kembali ke rute pertama menggunakan `Navigator.pop ()`

Untuk menutup rute kedua dan kembali ke rute pertama gunakan `Navigator.pop()`. Pop()  menghilangkan arus Rute dari tumpukan rute dikelola oleh Navigator.

```
onPressed: () {
  // Navigasi ke rute pertama (Informasi)
  Navigator.pop(context);
}
```
