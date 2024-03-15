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
                (this.selectedLanguage == null
                    ? '?'
                    : this.selectedLanguage!.name)),
          ],
        ),
      ),
    );
  }

  void showMyAlertDialog(BuildContext context) {
    late ProgrammingLanguage javascript;
    late ProgrammingLanguage htmlCss;
    late ProgrammingLanguage sql;

    javascript = ProgrammingLanguage("Javascript", 67.7);
    htmlCss = ProgrammingLanguage("HTML/CSS", 63.1);
    sql = ProgrammingLanguage("SQL", 57.4);

    // Create SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: const Text('Select a Language:'),
      children: <Widget>[
        SimpleDialogOption(
          key: Key('javascript'),
          onPressed: () => onSelectedLanguage(context, javascript),
          child: Text(javascript.name),
        ),
        SimpleDialogOption(
          key: Key('htmlCss'),
          onPressed: () => onSelectedLanguage(context, htmlCss),
          child: Text(htmlCss.name),
        ),
        SimpleDialogOption(
          key: Key('sql'),
          onPressed: () => onSelectedLanguage(context, sql),
          child: Text(sql.name),
        )
      ],
    );

    // Call showDialog function to show dialog.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  void onSelectedLanguage(BuildContext context, ProgrammingLanguage language) {
    setState(() {
      this.selectedLanguage = language;
    });

    Navigator.pop(context); // Close the dialog
  }
}

class ProgrammingLanguage {
  String name;
  double percent;

  ProgrammingLanguage(this.name, this.percent);
}