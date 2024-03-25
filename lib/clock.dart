import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  @override
  State<Clock> createState() => ClockState();
}

class ClockState extends State<Clock> {
  String time = 'Time here';
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), onTimer);
  }

  void onTimer(Timer timer) {
    var now = DateTime.now();
    var formatter = DateFormat('hh:mm:ss');
    String formatted = formatter.format(now);
    setState(() => time = formatted);
  }

  @override
  Widget build(BuildContext context) {
    return Text(time, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),);
  }
}