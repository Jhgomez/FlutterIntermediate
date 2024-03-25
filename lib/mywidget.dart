import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Text('Click to Navigate'),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/third');
            },
            child: const Text('Go')
            )
        ]
      )
    );
  }
  
}