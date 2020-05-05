# **TextEditingController**, Mengirim data dari form

`TextEditingController` adalah controller dari `form/textfield` yang dapat diedit/diisi. Ibarat sebuah form dalam sebuah aplikasi harus memiliki identitas pada masing-masing textfieldnya. Untuk membedakan value dan attribute lainnya. Singkatnya saat tombol submit diklik, value dari sebuah `TextField` akan diambil dari controllernya. 

Jika `TextEditingController` tidak diset maka value dari textfield tersebut tidak dapat dikirim.  Oke langsung saja masuk ke contoh. Di bawah ini saya beri contoh dari post sebelumnya dimana ada sebuah textfield untuk mengisi nama dan sebuah tombol submit.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "My Apps",
    home: new Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("My Apps"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: new InputDecoration(
                hintText: "Nama User",
                labelText: "Nama",
                icon: Icon(Icons.people),
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
              ),
              keyboardType: TextInputType.numberWithOptions(),
            ),
            RaisedButton(
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
```

Selanjutnya kita akan membuat controller pada `TextField` dan membuat action saat tombol diklik. Sebagai catatan, berbeda dari post sebelumnya di sini saya menggunakan `StatefulWidget`. Apa bedanya dengan `StatelessWidget`? 

- Membuat Controller.
- Membuat Action `onPress` pada tombol

Untuk membuat controller kita cukup menambahkan code seperti contoh di bawah ini (tanda kuning). Setiap `TextField` akan memiliki controllernya masing-masing.

Di sini saya contohkan menggunakan `print`. Saat tombol diklik maka text akan dikirimkan dan ditampilkan ke dalam `console` pada editor.

```dart
class _MyappState extends State<Myapp> {
  var txtnama = new TextEditingController();

  void _kirimdata() {
    print("nama anda adalah ${txtnama.text}");
  }
  ...
```
Pada `TextEditingController`, value dari sebuah `TextField` diambil dengan property `text`. Pada contoh di atas pemanggilannya adalan dengan `txtnama.text`.


```dart
TextField(
  controller: txtnama,
```
```dart
RaisedButton(
  onPressed: _kirimdata,
```

![Hasil](/flutter-texteditcontrol.png)

> [ref.](https://www.byriza.com/flutter-17-form-bagian-2-texteditingcontroller-mengirim-data-dari-form)
