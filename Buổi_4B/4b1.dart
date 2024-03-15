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
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageUrl = "https://s3.o7planning.com/images/boy-128.png";
  //String imageUrl = "https://file-not-found";
  bool _loadImageError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter CircleAvatar Example"),
      ),
      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: _loadImageError ? null : NetworkImage(imageUrl),
          onBackgroundImageError: _loadImageError ? null : (Object error, StackTrace? stackTrace) {
            print("Error loading image! " + error.toString());
            setState(() {
              _loadImageError = true;
            });
          },
          child: _loadImageError
              ? Icon(
            Icons.error,
            size: 40,
            color: Colors.red,
          )
              : null,
        ),
      ),
    );
  }
}