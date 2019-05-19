import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
//          child: Row(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(width: 120, height: 120, color: Colors.green),
              Container(width: 100, height: 100, color: Colors.blue),
              Container(width: 80, height: 80, color: Colors.amber),
            ],
          ),
        ),
      ),
    );
  }
}
