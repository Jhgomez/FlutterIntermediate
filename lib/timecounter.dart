import 'package:flutter/material.dart';
import 'dart:async';
import 'timedisplay.dart';

class TimeCounter extends StatefulWidget {
  @override
  State<TimeCounter> createState() => TimeCounterState();
}

class TimeCounterState extends State<TimeCounter> {
  
  late Stopwatch watch;
  late Timer timer;
  late  Duration duration;

  void onStart() {
    setState(() {
      watch = Stopwatch();
      timer = Timer.periodic(const Duration(milliseconds: 100), onTimeOut);
    });
    watch.start();
  }

  void onStop() {
    timer.cancel();
    watch.stop();
  }

  void onTimeOut(Timer timer) {
    if (!watch.isRunning) return;

    setState(() {
      duration = watch.elapsed;
    });
  }

  void onClear(Duration value) {
    setState(() {
      duration = const Duration();
    });
  }

  @override
  void initState() {
    duration = Duration();
  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
      child: Center(
        child: Column(
          children: [
            TimeDisplay(
              color: Colors.red,
              duration: duration,
              onClear: onClear,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: onStart,
                    child: const Text('Start'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: onStop,
                    child: const Text('Stop'),
                  ),
                )
              ],
            )
          ]
          )
        ),
    );
  }
  
}