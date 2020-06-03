# ListView dan Card 

Hal yang perlu diperhatikan |
------------ |
Editor yang digunakan [DartPad](http://dartpad.dartlang.org) |

![ListView Card](/listview.png)

> `Step-1` : Membuat Layout `StatelessWidget`

```dart
import 'package:flutter/material.dart';

void main() => runApp(App14());

class App14 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
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
  final String jurusan;
  final String thn_angkatan;
  final String fotoURL;
 
  Mahasiswa({this.jurusan, this.namalengkap, this.thn_angkatan, this.fotoURL});
}

class MahasiswaList {
  static List<Mahasiswa> getMahasiswa() {
    return [
      Mahasiswa(
          namalengkap: 'Nurcahyo Budi Nugroho',
          jurusan: 'Sistem Informasi',
          thn_angkatan: '2015',
          fotoURL: 'https://m.media-amazon.com/images/M/MV5BMmIzMjc5Y2ItNTIyZi00YTEzLWI4NDAtODQ0MzBiNTZmMDMxXkEyXkFqcGdeQXVyMjQwMzc1MzI@._V1_UY209_CR13,0,140,209_AL_.jpg'),
      Mahasiswa(
          namalengkap: 'Mulia Dewi',
          jurusan: 'Manajemen Informatika',
          thn_angkatan: '2019',
          fotoURL:'https://m.media-amazon.com/images/M/MV5BMTU1Njc2NTc3OV5BMl5BanBnXkFtZTgwMzUyNjU5NDM@._V1_UY209_CR87,0,140,209_AL_.jpg'),      
    ];
  }
}

class MahasiswaCard extends StatelessWidget {
  final Mahasiswa mahasiswa;

  MahasiswaCard({this.mahasiswa});

  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(mahasiswa.fotoURL),
            ),
            title: Text(mahasiswa.namalengkap),
            subtitle: Text(mahasiswa.jurusan),
            trailing: Text(mahasiswa.thn_angkatan),
          )
        ],
      ),
    );
  }
}
```  

> `Step-4` : Mengatur `_MyAppState` pada `Step-2`

* tabbah `final List<Mahasiswa> mhs = MahasiswaList.getMahasiswa();` 

```dart
class _MyAppState extends State<NurcahyoApp> {
  final List<Mahasiswa> mhs = MahasiswaList.getMahasiswa();

  Widget build(BuildContext context) {
    return Container(
      child: mhs.length > 0
          ? ListView.builder(
              itemCount: mhs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      mhs.removeAt(index);
                    });
                  },
                  secondaryBackground: Container(
                    child: Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.red,
                  ),
                  background: Container(),
                  child: MahasiswaCard(mahasiswa: mhs[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('No Items')),
    );
  }
}
```

