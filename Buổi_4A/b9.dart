import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
            title: const Text("Flutter Sizebox Example")
        ),
        body: Center (
            child:SizedBox (
    width:250,
    height: 50,
    child: ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
          shadowColor : Colors.redAccent,
          elevation: 10,
          minimumSize: const Size(200,  200 )
      ),
      child: const Text("Button ")
    )
)
        )
    );
  }
}