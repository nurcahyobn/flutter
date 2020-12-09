# INPUT DATA PADA LIST VIEW MENGGUNAKAN ARRAY

Listview merupakan objek atau Widget pada flutter yang dapat menampilkan data secara dynamis, baik dalam bentuk Teks, Angka, Gambar maupun Wiget, dalam contoh kita berikut akan ditampilkan data yang berasal dari Array mengingt pembelajaran kita secara Online yang hanya memakai satu Page
Perhatikan Gambar berikut



>## Langkah 1: Buat Class yang menggunakan StatefulWidget

```dart
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  final txtnama = TextEditingController();
  final txtnim = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(title: Text("Belajar Pintar")),
            body: new ListView(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextField(
                        controller: txtnama,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Nama'),
                      ),
                      TextField(
                        controller: txtnim,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Nim'),
                      ),
                      RaisedButton(
                          color: Colors.green,
                          child: Text("Tambah"),
                          onPressed: null),
                    ],
                  ),
                ),
                new Column(
                    // Isi List View
                    )
              ],
            )));
  }
}
```
>## Langkah 2: Buat Listview Contructor untuk Getter (Pengambilan Data)

Letakkan program di bawah ini pada tempat deklarasi variabel
```dart
List<Widget> data = [];

String nama = '';
  String nim = '';
  ambilData() {
    setState(() {
      nama = txtnama.text;
      nim = txtnim.text;

      data.add(ListTile(
        leading: Icon(Icons.people),
        title: Text('$nama'),
        subtitle: Text("$nim"),
      ));
    });
  }
  ```
>## Langkah 3: Panggil Pada Design

masukkan Array kedalam ListView
```dart
new Column(
   children: data,
  )
  
 
```
Panggil Constructor
```dart
RaisedButton(
    color: Colors.green,
    child: Text("Tambah"),
     onPressed: ambilData,
),
```
