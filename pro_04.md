# DAO : Data Access Objek pada Aplikasi

### Menyimpan data 

```dart
 Future<int> insert(Object obj) async {
    final dbClient = await db;
    return await dbClient.insert('tablename', obj.toMap());
  }
```

<hr />

### Menghapus data 

```dart
  Future<int> delete(int id) async {
    final dbClient = await db;
    return await dbClient.delete('tablename', where: 'id=?', whereArgs: [id]);
  }
```

<hr />

### Mengubah data 

```dart
  Future<int> update(Object obj) async{
    final dbClient = await db;
    var result = await dbClient
        .update("tablename", obj.toMap(), where: "id=?", whereArgs: [obj.id]);
    return result;
  }
```

<hr />

### Mengambil Semua data 

```dart
  Future<List<Object>> queryAll() async {
    final dbClient = await db;
    var maps = await dbClient.query("tablename");
    List<Object> list = 
        maps.isNotEmpty ? maps.map((c) => Object.fromMap(c)).toList() : [];
    return list;
  }
```

<hr />

### Mengambil Data berdasarkan ID 

```dart
  Future<Object> getObjectById(int id) async {
    final dbClient = await db;
    var maps = await dbClient.query("tablename", where: "id=?", whereArgs: [id]);
    return maps.isNotEmpty ? Object.fromMap(maps.first) : Null;
  }
```

<hr />

### Deklarasi Fungsi Awal Mengambil data dari DBHelper

```dart
class _HomePageState extends State<HomePage> {

  DBHelper database = DBHelper();
  List<Object> obj = [];
  
  void initState() {
    super.initState();
    RefreshList();
  }

  RefreshList() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      obj = await database.queryAll();
      setState(() {});
    });
  }
}  
```
### Menampilkan Data di ListView

```dart
ListView.builder(
  itemCount: obj.length,
  padding: EdgeInsets.fromLTRB(24, 0, 24, 8),
  itemBuilder: (BuildContext context, int index) {
    var value = obj[index];
    return ListTile(
      leading: null,
      title: Text("Kode : ${value.kode}"),
      subtitle: Text("${value.nama}"),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await database.deletePenyakit(value.id);
          RefreshList();
        },
      ),
      onTap: () {},
    );
  },
),
```
ketika layoutnya dibagi kedalam beberapa `widget`, gunakan `Expanded(child: ListView...`

