import 'package:flutter/material.dart';

class TimerDropdown extends StatelessWidget {
  final List<DropdownMenuItem<int>> items;
  final int? value;
  final ValueChanged<int?> onChanged;
  final String hintText;
  final Icon icon;

  const TimerDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<int>(
        isExpanded: true,
        icon: icon,
        iconEnabledColor: Colors.black,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        hint: Text(
          hintText,
          style: const TextStyle(color: Colors.black38),
        ),
        value: value,
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
