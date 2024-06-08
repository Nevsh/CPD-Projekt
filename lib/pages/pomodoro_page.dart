import 'package:cpd_project/models/pomodoro_timer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/timer_dropdown_widget.dart';
import '../widgets/timer_wigets.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PomodoroTimerModel>(
      builder: (context, pomModel, child) => Scaffold(
        backgroundColor: Colors.red[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 24),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
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
                  value: pomModel.time,
                  onChanged: pomModel.timerSet,
                  hintText: 'Choose duration: work / break ',
                  icon: const Icon(Icons.watch_later_outlined),
                ),
              ),
            ),
            Text(
              pomModel.focusSessionDone ||
                      pomModel.timeInSec == 0 && pomModel.inputIsSet()
                  ? 'BREAK'
                  : 'WORK',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: pomModel.focusSessionDone ||
                          pomModel.timeInSec == 0 && pomModel.inputIsSet()
                      ? Colors.blue[900]
                      : Colors.red[900]),
            ),
            createTimer(context, pomModel, true),
            createButton(pomModel, Colors.red[600]),
            Text(
              'Session: ${pomModel.session}',
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
