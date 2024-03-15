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
  ProgrammingLanguage? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter SimpleDialog Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Select a Language"),
              onPressed: () {
                showMyAlertDialog(context);
              },
            ),
            SizedBox(width: 5, height: 5),
            Text("Selected Language: " +
                (selectedLanguage == null ? '?' : selectedLanguage!.name)),
          ],
        ),
      ),
    );
  }

  void showMyAlertDialog(BuildContext context) {
    var languages = [
      ProgrammingLanguage("Javascript", 67.7),
      ProgrammingLanguage("HTML/CSS", 63.1),
      ProgrammingLanguage("SQL", 57.4),
      ProgrammingLanguage("Python", 44.1),
      ProgrammingLanguage("Java", 40.2),
      ProgrammingLanguage("Bash/Shell/PowerShell", 33.1),
      ProgrammingLanguage("C#", 31.4),
      ProgrammingLanguage("PHP", 26.2),
      ProgrammingLanguage("Typescript", 25.4),
      ProgrammingLanguage("C++", 23.9),
      ProgrammingLanguage("C", 21.8),
      ProgrammingLanguage("Go", 8.8)
    ];

    // A List of SimpleDialogOption(s).
    var itemList = languages.map((lang) => SimpleDialogOption(
          onPressed: () {
            // Close and return value
            Navigator.pop(context, lang);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(lang.name),
              Text(
                lang.percent.toString(),
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ));

    // Create SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: Text('Select a Language:'),
      children: itemList.toList(),
    );

    // Call showDialog function to show dialog.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedLanguage = value as ProgrammingLanguage;
        });
      }
    });
  }
}

class ProgrammingLanguage {
  String name;
  double percent;

  ProgrammingLanguage(this.name, this.percent);
}