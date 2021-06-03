```dart
import 'package:flutter/material.dart';

import 'db_helper.dart';
import 'student.dart';

// void main() => runApp(MyApp());

class MyApp06 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: StudentPage(),
    );
  }
}

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Future<List<Student>> students;
  String _studentName;
  bool isUpdate = false;
  int studentIdForUpdate;
  DBHelper dbHelper;
  final _studentNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshStudentList();
  }

  refreshStudentList() {
    setState(() {
      students = dbHelper.getStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite CRUD in Flutter - SQLITE06'),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formStateKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Student Name';
                      }
                      if (value.trim() == "")
                        return "Only Space is Not Valid!!!";
                      return null;
                    },
                    onSaved: (value) {
                      _studentName = value;
                    },
                    controller: _studentNameController,
                    decoration: InputDecoration(
                        focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.purple,
                                width: 2,
                                style: BorderStyle.solid)),
                        // hintText: "Student Name",
                        labelText: "Student Name",
                        icon: Icon(
                          Icons.business_center,
                          color: Colors.purple,
                        ),
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.purple,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.purple,
                child: Text(
                  (isUpdate ? 'UPDATE' : 'ADD'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (isUpdate) {
                    if (_formStateKey.currentState.validate()) {
                      _formStateKey.currentState.save();
                      dbHelper
                          .update(Student(studentIdForUpdate, _studentName))
                          .then((data) {
                        setState(() {
                          isUpdate = false;
                        });
                      });
                    }
                  } else {
                    if (_formStateKey.currentState.validate()) {
                      _formStateKey.currentState.save();
                      dbHelper.add(Student(null, _studentName));
                    }
                  }
                  _studentNameController.text = '';
                  refreshStudentList();
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              RaisedButton(
                color: Colors.red,
                child: Text(
                  (isUpdate ? 'CANCEL UPDATE' : 'CLEAR'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _studentNameController.text = '';
                  setState(() {
                    isUpdate = false;
                    studentIdForUpdate = null;
                  });
                },
              ),
            ],
          ),
          const Divider(
            height: 5.0,
          ),
          Expanded(
            child: FutureBuilder(
              future: students,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return generateList(snapshot.data);
                }
                if (snapshot.data == null || snapshot.data.length == 0) {
                  return Text('No Data Found');
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView generateList(List<Student> students) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('NAME'),
            ),
            DataColumn(
              label: Text('DELETE'),
            )
          ],
          rows: students
              .map(
                (student) => DataRow(
                  cells: [
                    DataCell(
                      Text(student.name),
                      onTap: () {
                        setState(() {
                          isUpdate = true;
                          studentIdForUpdate = student.id;
                        });
                        _studentNameController.text = student.name;
                      },
                    ),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          dbHelper.delete(student.id);
                          refreshStudentList();
                        },
                      ),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
```


```dart
import 'package:flutter/material.dart';
import 'package:tutorial_flutter/flutter-todo-app/ui/main_screen.dart';
import 'package:tutorial_flutter/sqlite-02/db_page.dart';
import 'package:tutorial_flutter/sqlite-03/sqfliteactivity.dart';
import 'package:tutorial_flutter/sqlite-06/main.dart';
import 'package:tutorial_flutter/sqlite-07/main.dart';

import 'sqlite-05/main.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Tutorial()));
}

class Tutorial extends StatefulWidget {
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  var widgetMenu = [
    '1. Listview Widget',
    '2. Future',
    '3. Sistem Pakar',
  ];

  _onTileClicked(int index) {
    print("You tapped on item $index");
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DBTestPage()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SqfliteActivity()));
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Tutorial Flutter - Triguna Dharma'),
      ),
      body: ListView.builder(
          itemCount: widgetMenu.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: [
              InkWell(
                  child: ListTile(
                    title: new Text(
                      widgetMenu[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    _onTileClicked(index);
                  }),
              Divider(
                thickness: 1,
                indent: 10,
                endIndent: 10,
                height: 2,
                color: Colors.orange,
              ),
            ]);
          }),
    );
  }
}

```
