import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(Object context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Text('Custom View'),
    );
  }
}
