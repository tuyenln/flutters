import 'package:flutter/material.dart';
import 'package:fl09_stream/my_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  MyBloc bloc = new MyBloc();

  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    bloc.counterStream.listen((data) {
      print(data.toString());
    });


    return Scaffold(
      appBar: AppBar(
        title: Text("STREAM"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Center(
          child: StreamBuilder(
            stream: bloc.counterStream,
            builder: (context, snapshot) => Text(
              snapshot.hasData ? snapshot.data.toString() : "0",
              style: TextStyle(fontSize: 40, color: Colors.amber),
          )),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          bloc.inCrement();
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
