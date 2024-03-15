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
      appBar: AppBar(
        title: Text("TextButton Example"),
      ),
      body: Center (
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon (
              icon: Icon(Icons.add_shopping_cart),
              label: Text("Dark"),
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize: MaterialStateProperty.all<Size>(Size(50, 20)), // Điều chỉnh kích thước tối thiểu của nút
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(8)), // Điều chỉnh khoảng cách nút
              ),
            ),
            TextButton.icon (
              icon: Icon(Icons.add_shopping_cart),
              label: Text("Light"),
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                minimumSize: MaterialStateProperty.all<Size>(Size(50, 20)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(8)),
              ),
            ),
            TextButton.icon (
              icon: Icon(Icons.monetization_on),
              label: Text("Dark"),
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize: MaterialStateProperty.all<Size>(Size(50, 20)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(8)),
              ),
            ),
            TextButton.icon (
              icon: Icon(Icons.monetization_on),
              label: Text("Light"),
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                minimumSize: MaterialStateProperty.all<Size>(Size(50, 20)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}