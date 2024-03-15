import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
    return Scaffold (

      appBar: AppBar(
        title: Text("IconButton Example"),
      ),
      body: Center(
          child: getIconButtons()
      ),
    );
  }

  Widget getIconButtons()  {
    double MAX_SIZE = 96;
    double LEFT = 30;
    return  Center(

        child: Column (

            children: [
              Row (
                  children: [
                    SizedBox(width: LEFT),
                    IconButton (
                      icon: Image.network("https://raw.githubusercontent.com/o7planning/rs/master/flutter/feel_good_96.png"),
                      onPressed: () {
                        print("Pressed");
                      },
                      iconSize: MAX_SIZE,
                    ),
                    Text("Real Size: 96"),
                    Text(" --- "),
                    Text("Set iconSize: " + MAX_SIZE.toString()),
                  ]
              ),
              Row (
                  children: [
                    SizedBox(width: LEFT),
                    IconButton (
                      icon: Image.network("https://raw.githubusercontent.com/o7planning/rs/master/flutter/feel_good_72.png"),
                      onPressed: () {
                        print("Pressed");
                      },
                      iconSize: MAX_SIZE,
                    ),
                    Text("Real Size: 72"),
                    Text(" --- "),
                    Text("Set iconSize: " + MAX_SIZE.toString()),
                  ]
              ),
              Row (
                  children: [
                    SizedBox(width: LEFT),
                    IconButton (
                      icon: Image.network("https://raw.githubusercontent.com/o7planning/rs/master/flutter/feel_good_24.png"),
                      onPressed: () {
                        print("Pressed");
                      },
                      iconSize: MAX_SIZE,
                    ),
                    Text("Real Size: 24"),
                    Text(" --- "),
                    Text("Set iconSize: " + MAX_SIZE.toString()),
                  ]
              ),
            ])
    );
  }
}