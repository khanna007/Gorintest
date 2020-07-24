import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List decodedObject;
  List<Map> _myJson = [
    {"id": 0, "emp_name": "emp 1", "age": " 20"},
    {"id": 1, "emp_name": "emp 2", "age": "24"},
    {"id": 2, "emp_name": "emp ", "age": "25"}
  ];
  String _mySelection;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            height: 50.0,
            child: DropdownButton<String>(
              isDense: true,
              hint: new Text("Select"),
              value: _mySelection,
              onChanged: (String newValue) {
                setState(() {
                  _mySelection = newValue;
                });

                print(_mySelection);
              },
              items: _myJson.map((Map map) {
                return new DropdownMenuItem<String>(
                  value: map["emp_name"].toString(),
                  child: new Text(
                    map["emp_name"],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
