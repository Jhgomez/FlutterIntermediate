import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => SecondState();
}

class SecondState extends State<SecondScreen> {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen')
      ),
      body: Container(
        child: Column(
          children: [
            const Text('Second screen'),
            ElevatedButton(
              onPressed: onPressed, 
              child: const Text('Next')
              ),
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