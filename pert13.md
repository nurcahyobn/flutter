# Program Aritmatika

> `Step-1` : Membuat Layout `StatelessWidget`

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NurcahyoApp(),
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
  @override
  State<NurcahyoApp> createState() => _MyAppState();
}

class _MyAppState extends State<NurcahyoApp> {
  @override
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
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(
              labelText: "Nama Mahasiswa",
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Tahun Lahir",
            ),
          ),
          ElevatedButton(
            child: const Text("Hitung"),
            onPressed: () {},
          ),
          const Text("Usia"),
        ],
      ),
    );```

> `Step-4` : Deklarasi `variabel` dan `fungsi` klik Button Hitung

```dart
class _MyAppState extends State<NurcahyoApp> {  
  final txtnama = TextEditingController();
  final txttahunlahir = TextEditingController();

  String hasil = '';

  onHitung() {
    setState(() {
      var usia = 2024 - int.parse(txttahunlahir.text);
      hasil = "${txtnama.text} berusia $usia tahun";
    });
  }
  
  @override
  Widget build(BuildContext context) {
  ...
```

> `Step-5` : Tambah attribut `controller` pada `TextField`, `onPressed` pada `ElevatedButton` dan var `hasil` pada `Text`

```dart
TextField(
    controller: txtnama,
    decoration: new InputDecoration(
    ...
),
ElevatedButton(
    child: Text("Hitung"),
    onPressed: onHitung,
),
Text(hasil),
```

> berikut kode `return Center`

![hasil](/flutter-usia.gif)
