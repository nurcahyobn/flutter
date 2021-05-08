# Akses Database SQFLite menggunakan Model Flutter

### Create Project

> `flutter create nurcahyobn`

> `cd nurcahyobn`

> `flutter pub add sqflite` 

> `flutter pub add path`

> pada Visual Studio Code > add Folder to Workspace > pilih folder `nurcahyobn` 

### Membuat Akses ke Database

> buat file `lib\dbhelper.dart`
 
> import

```dart
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
```

lalu ketik perintah:

```dart
class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;

    String path = join(await getDatabasesPath(), "quisnurcahyo.db");
    _db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return _db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE buku (id INTEGER PRIMARY KEY, judul TEXT, tahun INTEGER)');
  }

  Future<int> simpan(Map<String, dynamic> map) async {
    _db = await db; //koneksi database
    return _db.insert("buku", map);
  }

  Future<List<Map<String, dynamic>>> tampilBuku() async {
    _db = await db; //koneksi database
    return _db.query("buku");
  }
}
```


### Membuat Tampilan Program `home.dart`

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Nurcahyo()));
}

class Nurcahyo extends StatefulWidget {
  _NurcahyoState createState() => _NurcahyoState();
}

class _NurcahyoState extends State<Nurcahyo> {
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
```
