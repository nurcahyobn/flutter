```dart
import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MainApp> with SingleTickerProviderStateMixin {
  late TabController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          title: const Text('NurcahyoProject'),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
          bottom: TabBar(
            controller: controller,
            tabs: const <Tab>[
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: "Mahasiswa"),
              Tab(text: "Dosen"),
              Tab(text: "Mata Kuliah"),
            ],
          ),
        ),
        drawer: const Menu(),
        body: TabBarView(
          controller: controller,
          children: const <Widget>[
            Camera(),
            Mahasiswa(),
            Dosen(),
            MataKuliah(),
          ],
        ),
      ),
    );
  }
}

// class Camera
class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      color: Colors.lightBlue,
      child: const Center(
        child: Text('Camera', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}

// class Mahasiswa
class Mahasiswa extends StatelessWidget {
  const Mahasiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      color: Colors.lightGreen,
      child: const Center(
        child: Text('Mahasiswa', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}

// class Dosen
class Dosen extends StatelessWidget {
  const Dosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      color: Colors.amber,
      child: const Center(
        child: Text('Dosen', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}

// class MataKuliah
class MataKuliah extends StatelessWidget {
  const MataKuliah({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      color: Colors.lightGreenAccent,
      child: const Center(
        child: Text('MataKuliah', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}

// class Menu (Drawer)
class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 50.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('Nurcahyo Budi Nugroho'),
            accountEmail: const Text('nurcahyobn@gmail.com'),
            currentAccountPicture: Image.network(
              'https://www.tutorialkart.com/img/hummingbird.png',
              fit: BoxFit.cover,
            ),
            decoration: const BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Pemrograman Mobile-2'),
            onTap: () {},
          ),
          const Divider(height: 2.0),
          ListTile(
            leading: const Icon(Icons.accessibility),
            title: const Text('Sistem Informasi'),
            onTap: () {},
          ),
          const Divider(height: 2.0),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sign Out'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

```
