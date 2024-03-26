import 'package:flutter/material.dart';
import 'clock.dart';
import 'timecounter.dart';
import 'authenticator.dart';
import '/code/globalstate.dart';
import '/screens/secondscreen.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {

  void _onNavigateWithParameters() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => SecondScreen(_name.text)));
  }

  late TextEditingController _name;
  final GlobalState _store = GlobalState.instance;

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

    _name = TextEditingController();
    _store.set('name', '');
    _name.text = _store.get('name');
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

  void _onPressed() {
    _store.set('name', _name.text);
    Navigator.of(context).pushNamed('/second');
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
                Navigator.of(context).pushNamed('/second');
              },
              child: const Text('Second')
              ),
            ElevatedButton(
              onPressed: () {
                Navigator
                .of(context)
                .pushNamedAndRemoveUntil(
                  '/removed',
                  (route) => false
                  );
              },
              child: const Text('Removed')
              ),
            TextField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Enter your name'),
            ),
            ElevatedButton(
              onPressed: _onPressed,
              child: const Text('Go to second screen')
              ),
            const Text('Navigate with parameters'),
            ElevatedButton(
              onPressed: _onNavigateWithParameters,
              child: const Text('Go')
              )
          ]
        )
        )
      )
    );
  }  
 }