import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  State<ThirdScreen> createState() => ThirdState();
}

class ThirdState extends State<ThirdScreen> {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third screen')
      ),
      body: Container(
        child: Column(
          children: [
            const Text('Third screen'),
            ElevatedButton(
              onPressed: onPressed, 
              child: const Text('Back')
              )
          ],
        ),
      ),
    );
  }
}