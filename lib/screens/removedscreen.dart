import 'package:flutter/material.dart';

class RemovedScreen extends StatefulWidget {
  @override
  State<RemovedScreen> createState() => RemovedScreenState();
}

class RemovedScreenState extends State<RemovedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Removed screen')
      ),
      body: Column(
          children: [
            const Text('Removed screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              }, 
              child: const Text('Next')
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: const Text('Back')
              )
          ],
        )
    );
  }
}