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
  int pressedCount = 0;
  int longPressCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Pressed: $pressedCount --- Long Press: $longPressCount"),
      ),
      body: Center (
        child: ElevatedButton (
          child: Text("Test Me"),
          onPressed: onPressHandler,
          onLongPress: onLongPressHandler,
        ),
      ),
    );
  }

  void onPressHandler() {
    setState(() {
      pressedCount++;
    });

    showDialog (
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Message"),
        content: Text("OK, You just Pressed!"),
        actions: <Widget>[
          TextButton(
            child: Text('Close me!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  void onLongPressHandler() {
    setState(() {
      longPressCount++;
    });

    showDialog (
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Message"),
        content: Text("Hey, I show up for long press"),
        actions: <Widget>[
          TextButton(
            child: Text('Close me!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}