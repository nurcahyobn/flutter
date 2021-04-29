Langkah-langkah Pembuatan Aplikasi Sistem Pakar |
------------ |
1. Create New Project `project_01` sesuai dengan kelompoknya |
2. Mengatur file pubspec.yaml |
3. Membuat folder `database` dan `models` |
4. Program DatabaseHelper |



> `1` : 

```dart
final String tblPenyakit = 'penyakit';
final String columnId = 'id';


final List<String> tables = [
  '''
  CREATE TABLE $tblPenyakit (
    $columnId INTEGER PRIMARY KEY,
  )
  '''
];
```

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.orange,
      title: Text('UTS - Mahasiswa'),
    ));
  }
}
```dart

