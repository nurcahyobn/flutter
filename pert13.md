# Program Aritmatika

> `Step-1` : Membuat Layout `StatelessWidget`

```dart
import 'package:flutter/material.dart';

void main() => runApp(App04());

class App04 extends StatelessWidget {
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

> `Step-3` : Membuat Layout Container, Column, TextField, RaisedButton, Text
> ubah `return Center` pada `step-2`

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
          RaisedButton(
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
class _MyAppState extends State<MyApp> {
  final txtnama = TextEditingController();
  final txttahunlahir = TextEditingController();

  String hasil = '';

  onHitung() {
    setState(() {
      var usia = 2020 - int.parse(txttahunlahir.text);
      hasil = "${txtnama.text} berusia $usia tahun";
    });
  }

  Widget build(BuildContext context) {
  ...
```

> `Step-5` : Tambah attribut `controller` pada `TextField`, `onPressed` pada `RaisedButton` dan var `hasil` pada `Text`

```dart
TextField(
    controller: txtnama,
    decoration: new InputDecoration(
    ...
),
RaisedButton(
    child: Text("Hitung"),
    onPressed: onHitung,
),
Text(hasil),
```

> berikut kode `return Center`

![hasil](/flutter-usia.gif)
