# 12 - Sistem Pakar Bagian#2 File & Database

Langkah-langkah Pembuatan Aplikasi Sistem Pakar |
------------ |
1. Create New Project `project_01` sesuai dengan kelompoknya |
2. Mengatur file pubspec.yaml |
3. Membuat folder `database` dan `models` |
4. Program DatabaseHelper |

```
sqflite: any
path_provider: any
```

> file `tables.dart` 

```dart
final String tblLogin = 'login';
final String tblPasien = 'pasien';

final String colId = 'id';

// tabel Login
final String colUsername = 'username';
final String colPassword = 'password';

// tabel Penyakit
final String colKodePenyakit = 'kodepenyakit';
final String colNamaPenyakit = 'namapenyakit';
final String colSolusi = 'solusi';

// tabel Gejala
final String colKodeGejala = 'kodegejala';
final String colNamaGejala = 'namagejala';

// tabel BasisPengetahuan
final String colKodeGejala = 'kodegejala';
final String colNilaiProb = 'nilai_prob';

// tabel Pasien
final String colNamaPasien = 'namapasien';
final String colAlamat = 'alamat';
final String colUsia = 'usia';
final String colTelepon = 'telepon';

// tabel Konsultasi
final String colIdPasien = 'idpasien';
final String colGejalaDipilih = 'gejala_dipilih';

final List<String> tables = [
  '''
  CREATE TABLE $tblLogin (
    $colId INTEGER PRIMARY KEY,
    $colUsername TEXT,
    $colPassword TEXT
  )
  ''',
  '''
  CREATE TABLE $tblPasien (
    $colId INTEGER PRIMARY KEY,
    $colNamaPasien TEXT,
    $colAlamat TEXT,
    $colUsia TEXT,
    $colTelepon TEXT
  )
  '''
];

```

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.orange,
      title: Text('UTS - Mahasiswa'),
    ));
  }
}
```

