import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tú Sena', 
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 237, 144, 217)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Đây là Điện thoại'), 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BottomAppBar Example"),
        ),
        body: Center(
            child:  Text(
              'Flutter BottomAppBar Example',
            )
        ),
        floatingActionButton: FloatingActionButton.extended (
          elevation: 4.0,
          icon: const Icon(Icons.add),
          label: const Text('Add a task'),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(icon: Icon(Icons.home), onPressed: () {},),
              PopupMenuButton(
                icon: Icon(Icons.share),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text("Facebook"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("Instagram"),
                  ),
                ],
              ),
              IconButton(icon: Icon(Icons.email), onPressed: () {},),
            ],
          ),
        )
    );
  }
}
