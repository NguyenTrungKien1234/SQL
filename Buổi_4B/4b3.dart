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

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color(0xffF4F6F6),
      appBar: AppBar(
        title: Text("TextButton Example"),
      ),
      body: Center (
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton (
              child: Text("Default Text Button"),
              onPressed: () {},
            ),
            TextButton (
              child: Text("Text Button with Color"),
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white, // Sử dụng foregroundColor thay vì primary
              ),
            )
          ],
        )
      )
    );
  }
}