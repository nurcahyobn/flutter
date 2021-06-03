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
class _MahasiswaPageState extends State<MahasiswaPage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Future<List<Mahasiswa>> mahasiswa;
  
  String _namaMhs;
  DBHelper dbHelper;  
  final _namaMhsController = TextEditingController();

  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshMahasiswaList();
  }

  refreshMahasiswaList() {
    setState(() {
      mahasiswa = dbHelper.getMahasiswa();
    });
  }
```
### Menampilkan Data di ListView

```dart
Expanded(
    child: FutureBuilder(
      future: students,
      builder: (context, AsyncSnapshot<List<Student>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text("${snapshot.data[index].name}"));
            },
          );
        }
        if (snapshot.data == null || snapshot.data.length == 0) {
          return Text('No Data Found');
        }
        return CircularProgressIndicator();
      },
    ),
  ),
```

```dart
 SingleChildScrollView generateList(List<Student> students) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
         width: MediaQuery.of(context).size.width,
        child: DataTable(
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('DELETE'))
          ],
          rows: students
              .map(
                (student) => DataRow(
                  cells: [
                    DataCell(Text(student.id.toString())),
                    DataCell(IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        dbHelper.delete(student.id);
                        refreshStudentList();
                      },
                    ))
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
```

### Form Input Data

```dart
Form(
  key: _formStateKey,
  autovalidate: true,
  child: Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: TextFormField(
          validator: (value) {
            if (value.isEmpty) return 'Please Enter Student Name';
            return null;
          },
          onSaved: (value) => _studentName = value,
          controller: _studentNameController,
          decoration: InputDecoration(labelText: "Student Name"),
        ),
      ),
    ],
  ),
),
```

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    ElevatedButton(
      child: Text('Simpan'),
      onPressed: () {
        if (_formStateKey.currentState.validate()) {
          _formStateKey.currentState.save();

          dbHelper.add(Student(null, _studentName));
        }
        _studentNameController.text = '';
        refreshStudentList();
      },
    ),
    Padding(
      padding: EdgeInsets.all(10),
    ),
    ElevatedButton(
      child: Text('Batal'),
      onPressed: () {},
    ),
  ],
),
```

