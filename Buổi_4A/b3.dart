import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'o7planning.org',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}


class MyHomePageState extends State<MyHomePage> {
  List<Widget> _children = [];
  int idx = 0;

  @override
  void initState()  {
    super.initState();

    this._children = [
      ElevatedButton(
          key: Key(this.idx.toString()),
          child: Text("Button " + idx.toString()),
          onPressed: (){}
      )
    ];
  }

  void addChildHandler()  {
    this.idx++;
    this.setState(() {
      var newChild = ElevatedButton(
          key: Key(this.idx.toString()),
          child: Text("Button " + idx.toString()),
          onPressed: (){}
      );
      this._children.add(newChild);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Create new List object:

    this._children = this._children == null? [] : List.from(this._children);

    return Scaffold(
      appBar: AppBar(
          title: Text("Flutter Column Example")
      ),
      body: Center(
          child: Column (
              children:  this._children
          )
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()  {
            this.addChildHandler();
          }
      ),
    );
  }
}