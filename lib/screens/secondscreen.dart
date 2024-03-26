import 'package:flutter/material.dart';
import '/mywidget.dart';
import '/code/globalstate.dart';

class SecondScreen extends StatefulWidget {

  SecondScreen(this.name);

  String name;

  @override
  State<SecondScreen> createState() => SecondState(name);
}

class SecondState extends State<SecondScreen> {

  SecondState(this.name);

  String name;

  final GlobalState _store = GlobalState.instance;

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
                Navigator.of(context).pop();
              }, 
              child: const Text('Back')
            ),
            MyWidget(),
            Text('Hello ${_store.get('name')}'),
            Text('Name with constructor $name')
          ],
        )
    );
  }
}