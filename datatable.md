# Penggunaan DataTable

`DataTable` adalah Widget di Flutter untuk membuat tabel. 
Ini merupakan bagian tak terpisahkan dari UI sehari-hari. 
Kita dapat memberikan informasi secara jelas dan ringkas, yang sangat membantu pada tampilan seluler (relatif) kecil.

## Membuat DataTable Sederhana

![ListView Card](/listview.png)

1. Buat Widget `DataTable`, dengan syntax berikut: 

```dart
DataTable(
   columns:[],
   rows:[],
   ...
),
```

2. Kemudian tentukan kolom (judul kolom), dengan menambahkan `DataColumn`

Setiap `DataColumn` memiliki properti `label`. Label adalah ditampilkan pada kolom tersebut.

```dart
columns: [
  DataColumn(
    label: Text("Nama Barang"),
    numeric: false,
  ),
  DataColumn(
    label: Text("Harga"),
    numeric: true,
   ),
  ],
...
```

3. Terakhir, tentukan `DataRow`. DataRow Anda berisi Baris Data yang sebenarnya. Ini terdiri dari banyak DataCell.

```dart
DataRow(
  cells: <DataCell>[
      DataCell(Text('Pandu Azhari')),
      DataCell(Text('Pria')),
      DataCell(Text('Sistem Informasi')),
    ],
  ),
```

> `Contoh-1` : Program Sederhana pada DataTable

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nurcahyo - Kelas'),
      ),
      body: ListView(children: <Widget>[
        Center(
            child: Text('Data Mahasiswa',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        DataTable(
          columns: [
            DataColumn(label: Text('NIRM')),
            DataColumn(label: Text('Nama Mahasiswa')),
            DataColumn(label: Text('Jurusan')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('2018021061')),
              DataCell(Text('Pandu Azhari')),
              DataCell(Text('Komputer')),
            ]),
            DataRow(cells: [
              DataCell(Text('2018020019')),
              DataCell(Text('Vina Al Fitriani')),
              DataCell(Text('Hukum')),
            ]),
            DataRow(cells: [
              DataCell(Text('2018021014')),
              DataCell(Text('Dien Ronatio Tambunan')),
              DataCell(Text('Ekonomi')),
            ]),
          ],
        ),
      ]),
    );
  }
}
```

## Membuat DataTable dengan List Array

1. Untuk Data pada `DataRow` kita letakkan pada sebuah nama class, berikut:

```dart
class Mahasiswa {
  //Attribut
  String nirm;
  String namamhs;
  String jurusan;

  //Constructor
  Mahasiswa({this.nirm, this.namamhs, this.jurusan});

  //Data List
  static List<Mahasiswa> getMahasiswa() {
    return <Mahasiswa>[
      Mahasiswa(nirm: "061", namamhs: "Pandu Azhari", jurusan: "Komputer"),
      Mahasiswa(nirm: "019", namamhs: "Vina Al Fitriani", jurusan: "Hukum"),
      Mahasiswa(nirm: "014", namamhs: "Dien Ronatio", jurusan: "Ekonomi"),
    ];
  }
}
```

2. Deklarasi objek untuk penggunakan data pada class.

```dart
class _MyAppState extends State<MyApp> {
  List<Mahasiswa> mahasiswa;  //deklarasi
  ...
```

3. Pada `DataTable` gunakan properti `rows` sebagai berikut:

```dart
rows: Mahasiswa.getMahasiswa()
  .map(
    (mahasiswa) => DataRow(cells: [
      DataCell(Text(mahasiswa.nirm)),
      DataCell(Text(mahasiswa.namamhs)),
      DataCell(Text(mahasiswa.jurusan)),
    ]),
  )
  .toList(),
```
  
