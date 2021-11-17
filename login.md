# UI dan Validasi Login pada Flutter

Hal yang perlu diperhatikan |
------------ |
Editor yang digunakan [DartPad](http://dartpad.dartlang.org) |

> `Step-1` : Membuat Layout `StatelessWidget` untuk halaman awal

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
    );
  }
}
```


```dart
class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
          ],
        ),
      ),
    );
  }
}
```

```dart
Container(
   width: 100,
   height: 100,
   decoration:
   BoxDecoration(color: Colors.black87, shape: BoxShape.circle),
   child: Center(
     child: Icon(
       Icons.person,
       size: 50,
       color: Colors.white,
     ),
   ),
 ),
```

```dart
Text(
  "Selamat Datang, Silahkan Masuk",
  style: TextStyle(fontSize: 20, color: Colors.black),
),
```

```dart
TextFormField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black87)),
    prefixIcon: Icon(
      Icons.person,
      size: 40,
    ),
    hintText: "Masukan Username",
    hintStyle: TextStyle(color: Colors.black87),
    labelText: "Username",
    labelStyle: TextStyle(color: Colors.black87),
  ),
),
```

```dart
Card(
  color: Colors.black87,
  elevation: 5,
  child: Container(
    height: 50,
    child: InkWell(
      splashColor: Colors.white,
      onTap: () {},
      child: Center(
        child: Text(
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    ),
  ),
)
```
