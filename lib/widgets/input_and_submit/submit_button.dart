import 'package:flutter/material.dart';

import '../../config/palette.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.color,
    required this.text,
    required this.action,
  });

  final Color? color;
  final String text;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(color!),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Palette.buttonTextAndIconColor,
        ),
      ),
    );
  }
}
