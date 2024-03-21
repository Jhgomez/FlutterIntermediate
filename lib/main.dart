import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int counter = 0;
  List<Widget> items = [];

  @override
  void initState () {
    super.initState();
    for(int i = 0; i < 5; i++) {
      Widget child = _newItem(i)
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
    throw Scaffold(
      appBar: AppBar(
        title: const Text('Intermediate App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Make it awesome'),
            IconButton(
              onPressed: null, 
              icon: 
              Icon(Icons.alarm),
              tooltip: 'My first tooltip',
              )
          ]
        )
      )
    );
  }  
}