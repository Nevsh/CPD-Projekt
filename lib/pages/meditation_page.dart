import 'package:cpd_project/widgets/meditation_timer_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/meditation_timer.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  Widget createButton(button) {
    final isRunning = button.timer == null ? false : button.timer!.isActive;
    final isCompleted =
        button.timeInSec == button.maxTime || button.timeInSec == 0;

    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerButton(
                onClicked: () {
                  if (isRunning) {
                    button.stopTimer(reset: false);
                  } else {
                    button.startTimer();
                  }
                },
                icon: isRunning
                    ? const Icon(
                        Icons.pause,
                        color: Colors.white,
                        size: 32,
                      )
                    : const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 32,
                      ),
              ),
              const SizedBox(
                width: 32,
              ),
              TimerButton(
                onClicked: button.stopTimer,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          )
        : TimerButton(
            onClicked: button.startTimer,
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 32,
            ));
  }

  Widget createTime(time) {
    if (time == 0) {
      return const Icon(
        Icons.done_rounded,
        color: Colors.greenAccent,
        size: 160,
      );
    }
    return Text(
      time.toString(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 64,
        color: Colors.white,
      ),
    );
  }

  Widget createTimer(timer) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: (1 - timer.timeInSec / timer.maxTime) as double,
            strokeWidth: 12,
            valueColor: const AlwaysStoppedAnimation(Colors.greenAccent),
            backgroundColor: Colors.white,
          ),
          Center(
            child: createTime(timer.timeInSec),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DropdownButtonTimer>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.teal[200],
        appBar: AppBar(
          title: const Text(
            'MEDITATION',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal[600],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButton(
                  // icon: const Icon(Icons.watch_later_outlined),
                  iconEnabledColor: Colors.lightBlue,
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  hint: const Text('Wähle Dauer'),
                  value: value.time,
                  onChanged: value.timerSet,
                  items: const [
                    DropdownMenuItem(
                      value: 1,
                      child: Text('5 min'),
                    ),
                    DropdownMenuItem(
                      value: 10,
                      child: Text('10 min'),
                    ),
                    DropdownMenuItem(
                      value: 15,
                      child: Text('15 min'),
                    ),
                    DropdownMenuItem(
                      value: 30,
                      child: Text('30 min'),
                    ),
                  ],
                ),
              ),
            ),
            createTimer(value),
            createButton(value),
          ],
        ),
      ),
    );
  }
}
