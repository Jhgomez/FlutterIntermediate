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
    var now = DateTime.now;
    var formatter = DateFormat
    setState(() {
      time = timer.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}