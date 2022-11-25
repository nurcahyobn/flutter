```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ProgramData());
}

class ProgramData extends StatelessWidget {
  const ProgramData({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Program Data Mahasiswa'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Input Data'),
          icon: const Icon(Icons.add),
        ),
        body: const MyList(),
      ),
    );
  }
}

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final List<Mahasiswa> mhs = MahasiswaList.getMahasiswa();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: mhs.isNotEmpty
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
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  background: Container(),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  child: MahasiswaCard(mahasiswa: mhs[index]),
                );
              },
            )
          : const Center(child: Text('No Items')),
    );
  }
}

class Mahasiswa {
  String namalengkap;
  String jurusan;
  String alamat;
  String fotoURL;

  Mahasiswa({
    this.namalengkap = "",
    this.alamat = "",
    this.jurusan = "",
    this.fotoURL = "",
  });
}

// Objek Data
class MahasiswaList {
  static List<Mahasiswa> getMahasiswa() {
    return [
      Mahasiswa(
        namalengkap: 'Nurcahyo Budi Nugroho',
        jurusan: 'Sistem Informasi',
        alamat: 'Medan',
        fotoURL:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAAa6yMAH0xupn5R2PG6W663_fW473SUTXPw&usqp=CAU',
      ),
      Mahasiswa(
        namalengkap: 'Rika Wahyuni',
        jurusan: 'Ekonomi',
        alamat: 'Siantar',
        fotoURL:
            'https://m.media-amazon.com/images/M/MV5BMjJkNDg5ZDctM2RlZS00NjFmLTkxZjktMWE5NGQzMDg4NDFhXkEyXkFqcGdeQXVyMTMwMDM1OTQ@._V1_UY209_CR6,0,140,209_AL_.jpg',
      ),
    ];
  }
}

//Objek View
class MahasiswaCard extends StatelessWidget {
  final Mahasiswa? mahasiswa;

  const MahasiswaCard({super.key, this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(mahasiswa!.fotoURL),
            ),
            title: Text(mahasiswa!.namalengkap),
            subtitle: Text(mahasiswa!.jurusan),
            trailing: Text(mahasiswa!.alamat),
          )
        ],
      ),
    );
  }
}

```
