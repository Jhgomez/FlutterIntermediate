import 'package:flutter/material.dart';
import '/mywidget.dart';
import '/code/globalstate.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => SecondState();
}

class SecondState extends State<SecondScreen> {

  GlobalState _store = GlobalState.instance;

  void _onNavigateWithParameters() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => SecondScreen()));
  }

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
            const Text('Navigate with parameters'),
            ElevatedButton(
              onPressed: _onNavigateWithParameters,
              child: const Text('Go')
              )
          ],
        )
    );
  }
}