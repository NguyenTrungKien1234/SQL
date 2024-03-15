import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
            width: 250,
            height: 250,
            color: Colors.blueGrey,
            margin: EdgeInsets.all(20),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 50,
                  left: 50,
                  child: Container(
                    width: 290,
                    height: 100,
                    color: Colors.green,
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 70,
                  child: Container(
                    width: 120,
                    height: 230,
                    color: Colors.yellow,
                  ),
                )
              ],
            )));
  }
}
