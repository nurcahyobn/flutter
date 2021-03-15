# UI dan Validasi Login pada Flutter

Hal yang perlu diperhatikan |
------------ |
Editor yang digunakan [DartPad](http://dartpad.dartlang.org) |

> `Step-1` : Membuat Layout `StatelessWidget` untuk halaman awal

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
        title: Text('Nurcahyo - Kelas'),
      ),
      body: Center(child: Text("Step-1")),
    );
  }
}
```

> `Step-2` pada body isi dengan:

```dart
Padding(
  padding: EdgeInsets.all(10),
  child: ListView(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'User Name',
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
      ),
      Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text('Login'),
            onPressed: () {},
          )),
    ],
  )),
```
