import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  State<ThirdScreen> createState() => ThirdState();
}

class ThirdState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third screen')
      ),
      body: Column(
          children: [
            const Text('Third screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: const Text('Back')
              )
          ],
        ),
    );
  }
}