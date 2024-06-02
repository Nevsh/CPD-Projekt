import 'package:cpd_project/models/pomodoro_timer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/timer_dropdown_widget.dart';
import '../widgets/timer_wigets.dart';

class BreakPage extends StatelessWidget {
  const BreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PomodoroTimerModel>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.red[200],
        appBar: AppBar(
          title: const Text(
            'POMODORO',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red[600],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TimerDropdown(
                  items: const [
                    DropdownMenuItem(
                      value: 25,
                      child: Text('25 / 5 min'),
                    ),
                    DropdownMenuItem(
                      value: 50,
                      child: Text('50 / 10 min'),
                    ),
                    DropdownMenuItem(
                      value: 90,
                      child: Text('90 / 20 min'),
                    ),
                  ],
                  value: value.time,
                  onChanged: value.timerSet,
                  hintText: 'Choose duration: work / break ',
                ),
              ),
            ),
            Text(
              value.focusSessionDone || value.timeInSec == 0 ? 'BREAK' : 'WORK',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: value.focusSessionDone || value.timeInSec == 0
                      ? Colors.blue[900]
                      : Colors.red[900]),
            ),
            createTimer(context, value, true),
            createButton(value, Colors.red[600]),
            Text(
              'Session: ${value.session}',
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
