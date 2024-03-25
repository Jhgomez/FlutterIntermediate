import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {

  const TimeDisplay({super.key, this.color = Colors.green, this.duration = const Duration(), this.onClear});
  
  final Duration duration;
  final Color color;
  final ValueChanged<Duration>? onClear;

  void onClick() {
    onClear?.call(duration);
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            duration.toString(),
            style: TextStyle(
              fontSize: 32,
              color: color
              ),
            ),
          ),
        IconButton(
          onPressed: onClick, 
          icon: const Icon(Icons.clear)
          )
      ],
    );
  }
}