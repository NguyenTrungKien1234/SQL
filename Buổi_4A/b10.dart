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
   int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
            title: const Text("Flutter Sizebox Example")
        ),
        body: Card (
        margin: const EdgeInsets.all(10),
        color: Colors.green[100],
        shadowColor: Colors.blueGrey,
        elevation: 10,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon (
                  Icons.album,
                  color: Colors.cyan,
                  size: 45
              ),
              title: Text(
                "Let's Talk About Love",
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Modern Talking Album'),
            ),
          ],
        ),
      ),
    );
  }
}