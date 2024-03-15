import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title of Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Flutter Row Example")
      ),
      body: Center(
          child: Row (
              children: [
                ElevatedButton(child: const Text("BTN 1"), onPressed:(){}),
                const Icon(Icons.ac_unit, size: 64, color: Colors.blue),
                ElevatedButton(
                    onPressed:(){},
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(const Size.square(100))
                    ),
                    child: const Text("Button 2")
                ),
                ElevatedButton(child: const Text("BTN 3"), onPressed:(){}),
              ]
          )
      ),
    );
  }
}