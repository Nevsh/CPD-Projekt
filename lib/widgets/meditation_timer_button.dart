import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({super.key, required this.onClicked, required this.icon});

  final Icon icon;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal[600],
        shape: const CircleBorder(),
        minimumSize: const Size(100, 100),
      ),
      child: icon,
    );
  }
}
