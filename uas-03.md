## Create Project Flutter

### Tambah Package dari terminal

```
flutter pub add sqflite_common_ffi
```

```
flutter pub add sqflite_common_ffi_web
```

```
dart run sqflite_common_ffi_web:setup
```


### Buat File sqlite_helper.dart

```dart
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class SQLiteHelper {
  static final SQLiteHelper _instance = SQLiteHelper._internal();

  Database? _database;

  SQLiteHelper._internal();
  factory SQLiteHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    databaseFactory = databaseFactoryFfiWeb;

    return await databaseFactory.openDatabase('product_database',
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: _onCreate,
        ));
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS product(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      stock INTEGER
    )
  ''');
  }

  Future<int> insertProduct(String name, int stock) async {
    final db = await database;
    return await db.insert('product', {'name': name, 'stock': stock});
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await database;
    return await db.query('product');
  }
}
```
