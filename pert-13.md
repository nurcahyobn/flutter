# Program Scaffold, Tabs dan Images 

Hal yang perlu diperhatikan |
------------ |
Editor yang digunakan [DartPad](http://dartpad.dartlang.org) |
Jalankan Program setiap langkah (`step`) |
Ubah `NurcahyoApp` dengan nama sendiri |
Tugas `6SIA1` jam `11.30` |

![hasil](/flutter-tabs.gif) 

> `Step-1` : Membuat Layout `StatelessWidget`

```dart
import 'package:flutter/material.dart';

void main() => runApp(App13());

class App13 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NurcahyoProject',
      home: Scaffold(
        appBar: AppBar(
          title: Text('NurcahyoProject'),
        ),
      ),
    );
  }
}
```

> `Step-2` : Membuat Layout `StatefulWidget`

- ubah kode `home: NurcahyoApp(),`
- tambah perintah dibawah untuk `class NurcahyoApp()` dan `MyTabsState` dengan menggunakan objek `SingleTickerProviderStateMixin` yang bertujuan untuk membuat `AnimationController` pada `Tab`.
- Agar dapat dianimasikan, objek `state` yang Anda asosiasikan dengan `stateful` widget Anda tidak hanya harus meng-extend class State, itu juga harus menggunakan `mixin` yang disebut `SingleTickerProviderStateMixin`. Seperti namanya, mixin menawarkan objek `Ticker`, yang secara berulang kali menghasilkan `callback`, yang secara konvensional dikenal sebagai `ticks`. Karena object `ticks` dihasilkan berulang kali pada interval waktu yang sama, Anda dapat menggunakannya untuk memutuskan kapan masing-masing frame animasi Anda ditampilkan.
  
```dart
class NurcahyoApp extends StatefulWidget {
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<NurcahyoApp> with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NurcahyoProject'),
        ),
    );
  }
}
// class Camera
// class Mahasiswa
// class Dosen
// class MataKuliah
// class Menu
// class Search
// class More_Vert
```

> `Step-3` :  Membuat `TabController`

- `TabController`, berfungsi untuk mengkordinasikan antara `TabBar` dan `TabBarView`.
- `TabController(vsync: this, length: 4)`, yaitu jumlah 4 tabs

```dart
class MyTabsState extends State<NurcahyoApp> with SingleTickerProviderStateMixin {
  
  TabController controller;

  void initState(){
    super.initState();
    controller = new TabController(vsync: this, length: 4);
  }

  void dispose(){
    controller.dispose();
    super.dispose();
  }
  ... 
```

> `Step-4` : Design `AppBar`

```dart
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('NurcahyoProject'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: TabBar(controller: controller, tabs: <Tab>[
          Tab(icon: Icon(Icons.camera_alt)),
          Tab(text: "Mahasiswa"),
          Tab(text: "Dosen"),
          Tab(text: "Mata Kuliah")
        ]),
      ),
      // body Scaffold

      // drawer: Menu(),
    );
  ...
```

> `Step-5` : Membuat  `TabBarView` 

- Menambahkan `body: TabBarView()` pada `Scaffold` setelah `appbar` sebelum `);`
- Menambahkan `TabBarView` pada `body` Scaffold.

```dart
      // body Scaffold
      body: TabBarView(controller: controller, children: <Widget>[
        Camera(),
        Mahasiswa(),
        Dosen(),
        MataKuliah(),
      ]),
    ...
```

- Menambahkan `class` di akhir program pada untuk pemilihan item `TabBarView`

```dart
// class Camera
class Camera extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        color: Colors.lightBlue,
        child: Center(
          child: Text('Camera', style: TextStyle(fontSize: 32)),
        ));
  }
}

// class Mahasiswa
class Mahasiswa extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        color: Colors.lightGreen,
        child: Center(
          child: Text('Mahasiswa', style: TextStyle(fontSize: 32)),
        ));
  }
}

// class Dosen
class Dosen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        color: Colors.amber,
        child: Center(
          child: Text('Dosen', style: TextStyle(fontSize: 32)),
        ));
  }
}

// class MataKuliah
class MataKuliah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        color: Colors.lightGreenAccent,
        child: Center(
          child: Text('MataKuliah', style: TextStyle(fontSize: 32)),
        ));
  }
}
```


> `Step-6` : Membuat  `Menu Por`

- buat deklarasi `GlobalKey<ScaffoldState>` untuk `_scaffoldKey`
- untuk mengaktifkan `Menu` pada `AppBar` tambahkan properties `key` dengan nilai `_scaffoldKey`
- lalu pada `leading`, `onPressed` diisi  `_scaffoldKey.currentState.openDrawer())` 
- aktifkan properties `drawer: Menu(),`
- buat program `class Menu` di akhir program

```dart
class MyTabsState extends State<NurcahyoApp> with SingleTickerProviderStateMixin {

  TabController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ...
```

```dart
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        title: Text('NurcahyoProject'),
        ...
       drawer: Menu(),
    );
    ...
```

```dart
// class Menu
class Menu extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 50.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Nurcahyo Budi Nugroho'),
              accountEmail: Text('nurcahyobn@gmail.com'),
              currentAccountPicture: Image.network(
                  'https://www.tutorialkart.com/img/hummingbird.png'),
              decoration: BoxDecoration(color: Colors.blueAccent),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Pemrograman Mobile-2'),
              onTap: () {},
            ),
            Divider(height: 2.0),
            ListTile(
              leading: Icon(Icons.accessibility),
              title: Text('Sistem Informasi'),
              onTap: () {},
            ),
            Divider(height: 2.0),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
```

> `Tugas 13` : pindahkan `Camera` dari `Tabs` ke `AppBar`

![tugas](/6sia1-p13.png)X
