import 'package:cpd_project/models/exercise_model.dart';
import 'package:cpd_project/models/pomodoro_timer_model.dart';
import 'package:cpd_project/models/timer_model.dart';
import 'package:flutter/material.dart';

class TimerDropdown extends StatelessWidget {
  final TimerModel timerModel;
  final List<int> optList;
  final String unit;
  final int? value;
  final ValueChanged<int?> onChanged;
  final String hintText;
  final Icon icon;

  const TimerDropdown({
    super.key,
    required this.timerModel,
    required this.optList,
    required this.unit,
    required this.value,
    required this.onChanged,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final List<int> items;
    if (timerModel is ExerciseModel && unit == 'cycles') {
      items = optList;
    } else {
      items = timerModel.durationList;
    }

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
        items: items.asMap().entries.map(
          (entry) {
            return DropdownMenuItem<int>(
              value: entry.value,
              child: timerModel is PomodoroTimerModel
                  ? Text('${entry.value} / ${optList[entry.key]} $unit')
                  : Text('${entry.value} $unit'),
            );
          },
        ).toList(),
      ),
    );
  }
}
