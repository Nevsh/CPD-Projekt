import 'package:cpd_project/models/pomodoro_timer_model.dart';
import 'package:flutter/material.dart';

double _mainHeading = 30;
double _subHeading1 = 24;
double _subHeading2 = 20;
double _subHeading3 = 16;

double get mainHeading => _mainHeading;
double get subHeading1 => _subHeading1;
double get subHeading2 => _subHeading2;
double get subHeading3 => _subHeading3;

Widget heading(String text, double? fontSize, Color? color) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

Widget pomPhaseHeading(PomodoroTimerModel pomModel) {
  return Text(
    pomModel.focusSessionDone && pomModel.inputIsSet()
        // || pomModel.timeInSec == 0 && pomModel.inputIsSet()
        ? 'BREAK'
        : 'WORK',
    style: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: pomModel.focusSessionDone && pomModel.inputIsSet()
          // || pomModel.timeInSec == 0 && pomModel.inputIsSet()
          ? Colors.blue[900]
          : Colors.red[900],
    ),
  );
}
