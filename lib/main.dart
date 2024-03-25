import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/secondscreen.dart';
import 'screens/thirdscreen.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      routes: <String, WidgetBuilder> {
        '/Home': (context) => Home(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
      },
      home: 
    );
  }
}
