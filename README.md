# Pertemuan 03 - Arithmatika #

## Step 1 : Copy Perintah berikut ##
```
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Program Penjumlahan'),
        ),
        body: Penjumlahan(),
      ),
    );
  }
}

class Penjumlahan extends StatefulWidget {
  _PenjumlahanState createState() => _PenjumlahanState();
}

class _PenjumlahanState extends State<Penjumlahan> {
  String _nama = 'Nama Mahasiswa';

  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_nama, style: TextStyle(fontSize: 30),),
        RaisedButton(
          child: Text('Proses'),
          onPressed: () {
            _doSomething();
          },
        ),
      ],
    );
  }

  void _doSomething() {
    setState(() {
      _nama = 'Nurcahyo Budi Nugroho';
    });
  }
}
```

## Step 2 : Ubah ```class _PenjumlahanState``` ##
```
class _PenjumlahanState extends State<Penjumlahan> {
  final textFieldValueHolder = TextEditingController();

  String result = '';

  getTextInputData() {
    setState(() {
      result = textFieldValueHolder.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: textFieldValueHolder,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Isi Nama Mahasiswa'),
              )),
          RaisedButton(
            onPressed: getTextInputData,
            color: Color(0xffFF1744),
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('Proses'),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Nama = $result", style: TextStyle(fontSize: 20)))
        ],
      ),
    ));
  }
}
```
