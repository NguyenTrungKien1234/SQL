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

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter SnackBar Example'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Builder(
        builder: (BuildContext ctxOfScaffold)  {
          return Center(
            child: ElevatedButton(
              child: Text('Show SnackBar'),
              onPressed: () {
                _showSnackBarMsgDeleted(ctxOfScaffold);
              }
            ),
          );
        }
      )
    );
  }

  void _showSnackBarMsgDeleted(BuildContext ctxOfScaffold) {
    final snackBar = SnackBar(
      content: Text('Message is deleted!'),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: () {
          _showSnackBarMsgRestored(ctxOfScaffold);
        },
      ),
    );
    ScaffoldMessenger.of(ctxOfScaffold).showSnackBar(snackBar);
  }

  void _showSnackBarMsgRestored(BuildContext ctxOfScaffold) {
    final snackBar = SnackBar(
      content: Text('Message is restored!')
    );
    ScaffoldMessenger.of(ctxOfScaffold).showSnackBar(snackBar);
  }
}