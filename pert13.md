# Program Aritmatika

> `Step-1` : Membuat Layout `StatelessWidget`

```dart
import 'package:flutter/material.dart';

void main() => runApp(App13());

class App13 extends StatelessWidget {
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
      var panjang = int.parse(txtpanjang.text);
      var lebar = int.parse(txtlebar.text);
      var luas = panjang * lebar;
      hasil = luas.toString();
    });
  }

  Widget build(BuildContext context) {
  ...
```

> `Step-5` : Widget input `TextField`

- hapus semua attribut `color` (contoh: `color: Colors.green,`)
- ubah widget `Text` dengan `TextField`

```dart
TextField(
    controller: txtnama,
    decoration: new InputDecoration(
    ...
),
```

> berikut kode `return Center`

![hasil](/flutter-usia.gif)

```dart
import 'package:flutter/material.dart';

void main() => runApp(App12());

class App12 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program Menghitung Usia',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nurcahyo (KELAS)'),
        ),
        body: NurcahyoApp(),
      ),
    );
  }
}

class NurcahyoApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<NurcahyoApp> {
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
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
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
          RaisedButton(
            child: Text("Hitung"),
            onPressed: onHitung,
          ),
          Text(hasil),
        ],
      ),
    );
  }
}
```

```dart
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Drawer Layout Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Drawer Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Scaffold(
      appBar: AppBar(
        title: Text('Developine App Bar'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.photo_album),
            tooltip: 'Hi!',
            onPressed: () => {},
          ),
          new IconButton(
            icon: new Icon(Icons.pie_chart),
            tooltip: 'Wow',
            onPressed: () => {},
          )
        ],
      ),
      drawer: Drawer(
          elevation: 20.0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Hammad Tariq'),
                accountEmail: Text('developine.com@gmail.com'),
                currentAccountPicture: Image.network(
                    'https://raw.githubusercontent.com/nurcahyobn/profile/master/pic1-me.jpg'),
                decoration: BoxDecoration(color: Colors.blueAccent),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Drawer layout Item 1'),
                onTap: () {
                  // This line code will close drawer programatically....
                  Navigator.pop(context);
                },
              ),
              Divider(
                height: 2.0,
              ),
              ListTile(
                leading: Icon(Icons.accessibility),
                title: Text('Drawer layout Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                height: 2.0,
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('Drawer layout Item 3'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          )),
    ));
  }
}


```
