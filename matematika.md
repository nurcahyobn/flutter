# Program Menghitung Usia 

Hal yang perlu diperhatikan |
------------ |
Editor yang digunakan [DartPad](http://dartpad.dartlang.org) |
Jalankan Program setiap langkah (`step`) |
Ubah `NurcahyoApp` dengan nama sendiri |
Tugas jam `10.15` |

> `Step-1` : Membuat Layout `StatelessWidget`

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: const MyHomePage(title: 'Nurcahyo B.N - 6SIC1'),
    );
  }
}
```

> `Step-2` : Membuat Layout `StatefulWidget`


  
```dart
class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ), 
      body: Center(
        child: Text("Step-2"),
      ),
    );
  }
}
```

> `Step-3` : Membuat Layout Container, Column, TextField, RaisedButton, Text

- ubah `return Center` pada `step-2`

```dart
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: new InputDecoration(
              labelText: "Nama Mahasiswa",
            ),
          ),
          TextField(
            decoration: new InputDecoration(
              labelText: "Tahun Lahir",
            ),
          ),
          ElevatedButton(
            child: Text("Hitung"),
            onPressed: () {},
          ),
          Text("Usia"),
        ],
      ),
    );
```

> `Step-4` : Deklarasi `variabel` dan `fungsi` klik Button Hitung

```dart
class _MyAppState extends State<NurcahyoApp> {
  final txtnama = TextEditingController();
  final txttahunlahir = TextEditingController();

  String hasil = '';

  onHitung() {
    setState(() {
      var usia = 2025 - int.parse(txttahunlahir.text);
      hasil = "${txtnama.text} berusia $usia tahun";
    });
  }
  ...
```

> `Step-5` : Controll input `TextField` dan `onPressed` pada `RaisedButton`, dan `Text`

```dart
          TextField(
            controller: txtnama,
            decoration: new InputDecoration(
              labelText: "Nama Mahasiswa",
            ),
          ),
          TextField(
            controller: txttahunlahir,
            decoration: new InputDecoration(
              labelText: "Tahun Lahir",
            ),
          ),
          ElevatedButton(
            child: Text("Hitung"),
            onPressed: onHitung,
          ),
          Text(hasil, style: TextStyle(fontSize: 16)),

    ...
```

![hasil](/flutter-usia.gif)

> Tugas 12 : Program Menghitung Biaya Warnet

![hasil](/tugas12-6sia1.png)
