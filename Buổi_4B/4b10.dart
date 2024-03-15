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
        title: Text("Flutter AlertDialog Example"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Open Dialog"),
              onPressed: () {
                openMyAlertDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void openMyAlertDialog(BuildContext context) {
    // Create a AlertDialog.
    AlertDialog dialog = AlertDialog(
      title: Text("Confirm"),
      content: Text("Are you sure to remove this item?"),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      actions: [
        ElevatedButton(
          child: Text("Yes Delete"),
          onPressed: () {
            Navigator.of(context).pop(true); // Return true
          },
        ),
        ElevatedButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop(false); // Return false
          },
        ),
      ],
    );

    // Call showDialog function.
    Future<dynamic> futureValue = showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
    futureValue.then((value) {
      print("Return value: " + value.toString()); // true/false
    });
  }
}