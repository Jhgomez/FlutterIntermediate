import 'package:flutter/material.dart';
// import 'screens/home/home.dart';
// import 'screens/secondscreen.dart';
// import 'screens/thirdscreen.dart';
// // import 'screens/removedscreen.dart';
// import '/screens/reduxscreen.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

//Actions
enum ReduxAction {Increment, Decrement}

//Reducer
int reducer(int state, dynamic action) {
  if (action == ReduxAction.Increment) state++;
  if (action == ReduxAction.Decrement) state--;
  return state;
}

void main() {
  final store = Store<int>(reducer, initialState: 0);
  runApp(
    ReduxScreen(store: store)
    // MyApp()
  );
}

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Navigation',
//       routes: <String, WidgetBuilder> {
//         '/home': (context) => Home(),
//         '/removed': (context) => RemovedScreen(),
//         '/second': (context) => SecondScreen(''),
//         '/third': (context) => ThirdScreen(),
//         '/redux':(context) => ReduxScreen(store: )
//       },
//       home: Home()
//     );
//   }
// }


class ReduxScreen extends StatelessWidget {
  const ReduxScreen({super.key, required this.store});
  
  final Store<int> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        title: 'Redux',
        home: Scaffold(
        appBar: AppBar(
         title: const Text('Redux screen')
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
           children: [
            const Text('Using Redux'),
            StoreConnector(
              converter: (store) => store.state.toString(),
              builder: (context, count) {
                return Text('Count with redux: $count');
              },
            ),
            IconButton(
              onPressed: () => store.dispatch(ReduxAction.Increment),
              icon: const Icon(Icons.add)
            ),
            IconButton(
              onPressed: () => store.dispatch(ReduxAction.Decrement),
              icon: const Icon(Icons.remove)
            )
           ],
         ),
        )
       ),
        )
    );
  }
}