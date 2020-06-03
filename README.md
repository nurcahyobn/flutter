# ListView dan Card 

Hal yang perlu diperhatikan |
------------ |
Editor yang digunakan [DartPad](http://dartpad.dartlang.org) |


> `Step-1` : Membuat Layout `StatelessWidget`

```dart
import 'package:flutter/material.dart';

void main() => runApp(App14());

class App14 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program Persegi Panjang',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nurcahyo (KELAS)'),
        ),
        body: Text("Step-1"),
      ),
    );
  }
}
```

> `Step-2` : Membuat Layout `StatefulWidget`
- ubah kode `body: NurcahyoApp(),`
- tambah perintah dibawah untuk `class NurcahyoApp()`
  
```dart
class NurcahyoApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<NurcahyoApp> {
  Widget build(BuildContext context) {
    return Center(
      child: Text("Step-2"),
    );
  }
}
```

> `Step-3` : Buat Objek untuk items ListView posisi bawah

* class `Mahasiswa`, `MahasiswaList` dan `MahasiswaCard` 

```dart
class Mahasiswa {
  final String namalengkap;
  final String jkelamin;
  final String usia;
  final String fotoURL;
 
  Mahasiswa({this.jkelamin, this.namalengkap, this.usia, this.fotoURL});
}

class MahasiswaList {
  static List<Mahasiswa> getMahasiswa() {
    return [
      Mahasiswa(
          namalengkap: 'Nurcahyo',
          jkelamin: 'Laki-laki',
          usia: '38 tahun',
          fotoURL: ''),
      Mahasiswa(
          namalengkap: '',
          jkelamin: '',
          usia: '',
          fotoURL:''),      
    ];
  }
}

class MahasiswaCard extends StatelessWidget {
  final Mahasiswa mhs;

  MahasiswaCard({this.mhs});

  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(mhs.fotoURL),
            ),
            title: Text(mhs.namalengkap),
            subtitle: Text(mhs.jkelamin),
            trailing: Text(mhs.usia),
          )
        ],
      ),
    );
  }
}
```  

> `Step-4` : Mengatur `_MyAppState` pada `Step-2`
> ubah `return Center` 

