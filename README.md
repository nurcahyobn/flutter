# ListView dan Card 

Hal yang perlu diperhatikan |
------------ |
Editor yang digunakan [DartPad](http://dartpad.dartlang.org) |

> `Step-1` : Membuat Layout `StatelessWidget`

```dart
import 'package:flutter/material.dart';

void main() => runApp(App14());

class App14 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NurcahyoProject',
      home: Scaffold(
        appBar: AppBar(
          title: Text('NurcahyoProject'),
          
        ),
      ),
    );
  }
}
```

> `Step-2` : Membuat Layout `StatefulWidget`

- tambah kode `home: MahasiswaApp(),`
- tambah perintah dibawah untuk `class NurcahyoApp()` 
  
