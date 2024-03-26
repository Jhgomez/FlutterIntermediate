import 'package:flutter/material.dart';
import '/mywidget.dart';
import '/code/globalstate.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => SecondState();
}

class SecondState extends State<SecondScreen> {

  GlobalState _store = GlobalState.instance;

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
            Text('Hello ${_store.get('name')}')
          ],
        )
    );
  }
}