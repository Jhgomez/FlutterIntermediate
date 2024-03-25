import 'package:flutter/material.dart';
import 'clock.dart';
import 'timecounter.dart';
import 'authenticator.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {

  bool isAuthenticated = false;

  void onAuthentication(bool value) {
    setState(() => isAuthenticated = value);
  }

  int counter = 0;
  List<Widget> items = [Clock()];

  @override
  void initState () {
    super.initState();
    for(int i = 0; i < 5; i++) {
      Widget child = _newItem(i);
      items.add(child);
    }
  }

  void _onClick() {
    Widget child = _newItem(counter);
    setState(() => items.add(child));
  }

  Widget _newItem(int i) {
    Key key = Key('item_$i');
    Container child = Container(
      key: key,
      padding: const EdgeInsets.all(10),
      child: Chip(
        label: Text('$i Name here'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade500,
          child: Text(i.toString()),
          
          ),
        ),
    );

    counter++;
    return child;
  }

  void _removeItem(Key key) {
    for(int i = 0; i < items.length; i++) {
      Widget child = items.elementAt(i);
      if(child.key == key) {
        setState(() => items.removeAt(i));
        print('Removing ${key.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intermediate App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClick, 
        child: const Icon(Icons.add)
        ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const IconButton(
              onPressed: null, 
              icon: 
              Icon(Icons.alarm),
              tooltip: 'My first tooltip',
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: items,
            ),
            const Text('My Stop Watch'),
            TimeCounter(),
            Authenticator(
              onAutheticated: onAuthentication,
            ),
            Text('$isAuthenticated'),
            const Text('Navigation'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Second');
              },
              child: const Text('Next')
              )
          ]
        )
        )
      )
    );
  }  
 }