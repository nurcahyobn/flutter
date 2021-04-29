Langkah-langkah Pembuatan Aplikasi Sistem Pakar |
------------ |
1. Create New Project `project_01` sesuai dengan kelompoknya |
2. Mengatur file pubspec.yaml |
3. Membuat folder `database` dan `models` |
4. Program DatabaseHelper |



> `1` : 

```dart
final String tblPenyakit = 'scores';
final String columnId = '_id';


final List<String> tables = [
  '''
  CREATE TABLE $tblPenyakit (
    $columnId INTEGER PRIMARY KEY,
    ...
  )
  '''
];

```
