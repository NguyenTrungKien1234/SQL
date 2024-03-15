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
      body: Center(
          child: Row(children: [
        ElevatedButton(child: Text("B1"), onPressed: () {}),
        Expanded(
          child: Icon(Icons.ac_unit, size: 32, color: Colors.red),
        ),
        ElevatedButton(
            child: Text("B2"),
            onPressed: () {},
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(50, 100)))),
        Expanded(
          child: Icon(Icons.add_circle, size: 96, color: Colors.green),
        ),
        ElevatedButton(child: Text("Btn 3"), onPressed: () {}),
      ])),
    );
  }
}
