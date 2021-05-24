# Evaluasi & Diskusi Aplikasi Database SQFLite

Langkah-langkah Pembuatan Aplikasi Sistem Pakar |
------------ |
1. Create New Project `quis_nurcahyo` |
2. Tambahkan package untuk `sqflite` dan `path` |

```dart
class DBHelper {
  static Database _db;
  Future<Database> get db async {
    if (_db != null) return _db; // jika database tidak null

    String path = join(await getDatabasesPath(), "nurcahyo.db");
    return await openDatabase(path, version: 1, onCreate: _onCreateTable);
  }

  _onCreateTable(Database db, int version) async {
    await db
        .execute("CREATE TABLE quis (id INTEGER PRIMARY KEY, namamhs TEXT)")
        .then((value) => print("Sukses Membuat Database : nurcahyo.db"));
  }


  Future<int> insert(Map<String, dynamic> map) async {
    final Database database = await db;
    return await database.insert('quis', map);
  }

  Future<List<Map<String, dynamic>>> getAllPenyakit() async {
    final Database database = await db;
    return await database.query('quis');
  }
}

```

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Nurcahyo()));
}

class Nurcahyo extends StatefulWidget {
  Nurcahyo({Key key}) : super(key: key);

  @override
  _NurcahyoState createState() => _NurcahyoState();
}

class _NurcahyoState extends State<Nurcahyo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.orange,
      title: Text('Quis - Mahasiswa'),
    ));
  }
}
```

