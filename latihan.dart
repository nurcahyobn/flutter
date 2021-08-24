import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Belajar Mobile1 - 5SIC3'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
