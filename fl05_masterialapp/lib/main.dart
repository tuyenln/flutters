import 'package:flutter/material.dart';

void main() {
 runApp(MaterialExample());
}

class MaterialExample extends StatefulWidget {
  @override
  _MaterialExampleState createState() => _MaterialExampleState();
}

class _MaterialExampleState extends State<MaterialExample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor:  Colors.amber ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material AppBar'),
        ),
        body: Center(
          child: Text(
            "HELLO", style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
