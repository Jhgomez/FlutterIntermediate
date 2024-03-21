import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    throw Scaffold(
      appBar: AppBar(
        title: const Text('Intermediate App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Make it awesome'),
            IconButton(
              onPressed: null, 
              icon: 
              Icon(Icons.alarm),
              tooltip: 'My first tooltip',
              )
          ]
        )
      )
    );
  }  
}