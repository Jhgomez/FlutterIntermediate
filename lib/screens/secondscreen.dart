import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => SecondState();
}

class SecondState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen')
      ),
      body: Column(
          children: [
            const Text('Second screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              }, 
              child: const Text('Next')
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              }, 
              child: const Text('Back')
              )
          ],
        )
    );
  }
}