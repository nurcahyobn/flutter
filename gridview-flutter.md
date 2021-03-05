# Dashbord dengan GridView 

Hal yang perlu diperhatikan |
------------ |
Editor yang digunakan [DartPad](http://dartpad.dartlang.org) |
Jalankan Program setiap langkah (`step`) |


> `Step-1` : Membuat Layout `StatelessWidget`

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('NurcahyoProject'),
        ),
      //body
      ),
    );
  }
}
```
Penggunaan GridView di Flutter seperti penggabungan antara penggunaan ListView widget serta penggunaan row dan column widget. Berikut contoh sederhana Penggunaan GridView di flutter framework

```dart
body: GridView.count(
  crossAxisCount: 3,
  children: <Widget>[],
  ),
```

Nilai tiga (3) pada crossAxisCount merupakan nilai untuk jumlah column pada grid. Sedangkan children merupakan widget turunan yang akan ditampilkan dalam bentuk grid.

