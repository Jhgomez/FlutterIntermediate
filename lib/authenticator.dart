import 'package:flutter/material.dart';

class Authenticator extends StatefulWidget {


  const Authenticator({super.key, this.onAutheticated});
  
  final ValueChanged<bool>? onAutheticated;

  @override
  State<Authenticator> createState() => AuthenticatorState(onAuthenticated: onAutheticated);
}

class AuthenticatorState extends State<Authenticator> {

  AuthenticatorState({this.onAuthenticated});

  late TextEditingController user;
  late TextEditingController password;
  final ValueChanged<bool>? onAuthenticated;

  void onClick() {
    if(user.text != 'user' || password.text != '1234') {
      onAuthenticated?.call(false);
    } else {
      onAuthenticated?.call(true);
    }
  }

  @override
  void initState() {
    super.initState();
    password = TextEditingController();
    user = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(      
          children: [
           TextField(
             controller: user,
             decoration: const InputDecoration(labelText: 'Username'),
           ),
           TextField(
             controller: password,
             decoration: const InputDecoration(labelText: 'Password'),
             obscureText: true,
           ),
           Padding(
             padding: const EdgeInsets.all(10),
             child: ElevatedButton(
               onPressed: onClick,
               child: const Text('Login'),
             ),
           )
          ],
        ),
      )
    );
  } 

}