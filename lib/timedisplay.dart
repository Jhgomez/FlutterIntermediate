import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {

  TimeDisplay({super.key, this.color = Colors.green, this.duration = const Duration(), this.onClear});
  
  Duration duration;
  Color color;
  final ValueChanged<Duration>? onClear;

  void onClick() {
    onClear??(duration);
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
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