# Mengirim Data ke Layar Baru

### 01 - Mulai dengan mengimport `package:flutter/material.dart`, untuk membangun UI

```dart
import 'package:flutter/material.dart';
```

### 02 - Buat Struktur Class `Mahasiswa`

```dart
class Mahasiswa {
  String namamhs;
  String jkelamin;
  String jurusan;

  Mahasiswa({this.namamhs, this.jkelamin, this.jurusan});
}
```

### 03 - Buat Material App untuk Flutter

```dart
void main() {
  runApp(MaterialApp(
    home: Informasi(),
  ));
}

class Informasi extends StatelessWidget {
  //deklarasi variabel & fungsi
  
  //Constructor Informasi

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Mahasiswa'),
      ),
      //body
      //floatingActionButton
    );
  }
}
```

### 04 - Deklarasi Variabel & Inisialisasikan Data Mahasiswa

```dart
  //deklarasi variabel & fungsi
  final mahasiswa = [
    Mahasiswa(namamhs: 'Nurcahyo', jkelamin: 'Laki-laki', jurusan: 'Komputer'),
    Mahasiswa(namamhs: 'Mulia Dewi', jkelamin: 'Perempuan', jurusan: 'Bahasa'),
  ];
```

### 05 - Pada `Scaffold` isi `body` dengan ListView 

```dart
    body: ListView.builder(
      itemCount: mahasiswa.length,
      itemBuilder: (context, index) {
        final mhs = mahasiswa[index];
        return ListTile(
          leading: Icon(Icons.people),
          title: Text(mhs.namamhs),
          subtitle: Text(mhs.jkelamin),
          trailing: Text(mhs.jurusan),
        );
      },
    ),
```

### 06 - Pada `Scaffold` isi `floatingActionButton` untuk menampilkan layar InputData 

```dart
    floatingActionButton: FloatingActionButton.extended(
      icon: Icon(Icons.add),
      label: Text('New Mahasiswa'),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InputData()));
      },
    ),
```

<hr />

### 01 - Buat Layar Baru `InputData` dan MaterialPageRoute ke `=> InputData()`

```dart
class InputData extends StatefulWidget {
  createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  //deklarasi variabel & fungsi  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Data Mahasiswa"),
      ),
      //body
    );
  }
}
```

```dart
    body: RaisedButton(
      child: Text("Simpan"),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Informasi(data: data)));
      },
    ),
```

```dart
  //deklarasi variabel & fungsi  
  final data = Mahasiswa(
    namamhs: 'Akmal',
    jkelamin: 'Laki-laki',
    jurusan: 'Teknik',
  );
```  

### 03 - Pada class `Informasi` tambahkan deklarasi variabel & Constructor

```dart
  //deklarasi variabel & fungsi
  final Mahasiswa data;
  
  //Constructor Informasi
  Informasi({this.data});
```
