import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/secondscreen.dart';
import 'screens/thirdscreen.dart';
import 'screens/removedscreen.dart';
import '/screens/reduxscreen.dart';

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
        '/home': (context) => Home(),
        '/removed': (context) => RemovedScreen(),
        '/second': (context) => SecondScreen(''),
        '/third': (context) => ThirdScreen(),
        '/redux':(context) => ReduxScreen()
      },
      home: Home()
    );
  }
}
