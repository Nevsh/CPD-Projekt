import 'package:cpd_project/widgets/meditation_timer_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meditation_timer.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  Widget createButton(timer) {
    final isRunning = timer.timer == null ? false : timer.timer!.isActive;
    final isCompleted =
        timer.timeInSec == timer.maxTime || timer.timeInSec == 0;

    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerButton(
                onClicked: () {
                  if (isRunning) {
                    timer.stopTimer(reset: false);
                  } else {
                    timer.startTimer();
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
                onClicked: timer.stopTimer,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          )
        : TimerButton(
            onClicked: () {
              if (timer.timeInSec != 1) {
                timer.startTimer();
              }
            },
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 32,
            ));
  }

  Widget createTime(timeInSec, timer, time, formatTime) {
    if (timeInSec == 0) {
      return const Icon(
        Icons.done_rounded,
        color: Colors.greenAccent,
        size: 160,
      );
    }
    if (timer == null && time == null) {
      return const Icon(
        Icons.timer,
        color: Colors.white,
        size: 128,
      );
    }
    return Text(
      // timeInSec.toString(),
      formatTime(timeInSec),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 48,
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
            child: createTime(
                timer.timeInSec, timer.timer, timer.time, timer.formatTime),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MeditationTimerModel>(
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
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton(
                    icon: const Icon(Icons.watch_later_outlined),
                    iconEnabledColor: Colors.teal[600],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.black,
                    // ),
                    hint: const Text(
                      'Wähle Dauer ',
                      style: TextStyle(color: Colors.black38),
                    ),
                    value: value.time,
                    onChanged: value.timerSet,
                    items: const [
                      DropdownMenuItem(
                        value: 1,
                        child: Text('1 min'),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text('3 min'),
                      ),
                      DropdownMenuItem(
                        value: 5,
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
            ),
            createTimer(value),
            createButton(value),
          ],
        ),
      ),
    );
  }
}
