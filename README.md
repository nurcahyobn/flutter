# ListView dan Card 

| Membuat Project Baru    |  |
| -------- | :------ |
| Lokasi di folder | **`6SIC1`** |
| Nama Project | **`app3`** |
| Run Project | **`flutter run -d chrome`** |

### Tampilan Hasil

![ListView Card](/listview.png)

> `Step-1` : Mempersiapkan interface `HomePage`

| Menghapus Komentar    | _Replace_ **`Ctrl+H`**  |
| -------- | :------ |
| Ketik  **`//.*`** | pilih **`Replace All`** |
| Format Document | **`Shift+Alt+F`** |

![](/replace.png)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

> `Step-2` : Ubah interface dengan hanya menampilkan **Text** di **Center**
  
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Pemrograman Mobile-2'),
      ),
    );
  }
}
```

> `Step-3` : Buat Objek untuk items ListView posisi bawah

* class `Mahasiswa`, `MahasiswaList` dan `MahasiswaCard` 

```dart
// Objek Model
class Mahasiswa {
  String namalengkap;
  String jurusan;
  String alamat;
  String fotoURL;

  Mahasiswa({this.namalengkap="", this.alamat="", this.jurusan="", this.fotoURL=""});
}

// Objek Data
class MahasiswaList {
  static List<Mahasiswa> getMahasiswa(){
    return [
      Mahasiswa(
        namalengkap: 'Nurcahyo Budi Nugroho',
        jurusan: 'Sistem Informasi',
        alamat: 'Medan',
        fotoURL: 'https://m.media-amazon.com/images/M/MV5BNjE3NDQyOTYyMV5BMl5BanBnXkFtZTcwODcyODU2Mw@@._V1_UY209_CR5,0,140,209_AL_.jpg',
      ),
      Mahasiswa(
        namalengkap: 'Rika Wahyuni',
        jurusan: 'Ekonomi',
        alamat: 'Siantar',
        fotoURL: 'https://m.media-amazon.com/images/M/MV5BMjJkNDg5ZDctM2RlZS00NjFmLTkxZjktMWE5NGQzMDg4NDFhXkEyXkFqcGdeQXVyMTMwMDM1OTQ@._V1_UY209_CR6,0,140,209_AL_.jpg',
      ),
    ];
  }
}

//Objek View 
class MahasiswaCard extends StatelessWidget {
  final Mahasiswa? mahasiswa;
  
  MahasiswaCard({this.mahasiswa});

  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading:  CircleAvatar(
              backgroundImage: NetworkImage(mahasiswa!.fotoURL),),
            title:  Text(mahasiswa!.namalengkap),
            subtitle: Text(mahasiswa!.jurusan),
            trailing: Text(mahasiswa!.alamat),
          )
        ],
      ),
    );
  }
}
```  

> `Step-4` : Mengatur `_MyListState` pada `Step-2`

* tambah `final List<Mahasiswa> mhs = MahasiswaList.getMahasiswa();` 
* atau ganti isi `class _MyListState` berikut:

```dart
class _MyListState extends State<MyList> {
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

