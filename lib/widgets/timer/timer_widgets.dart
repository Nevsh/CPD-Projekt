import 'package:cpd_project/models/review_model.dart';
import 'package:cpd_project/models/timer_model.dart';
import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton(
      {super.key,
      required this.constraints,
      required this.onClicked,
      required this.icon,
      required this.color});

  final BoxConstraints constraints;
  final Icon icon;
  final VoidCallback onClicked;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    double width = constraints.maxWidth / 4;
    double height = width;

    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const CircleBorder(),
        // minimumSize: const Size(100, 100),
        minimumSize: Size(width, height),
      ),
      child: icon,
    );
  }
}

Widget createButton(BoxConstraints constraints, ReviewModel revModel,
    TimerModel timer, Color? buttonColor) {
  final isRunning = timer.timer == null ? false : timer.timer!.isActive;
  final isCompleted = timer.timeInSec == timer.maxTime || timer.timeInSec == 0;

  return isRunning || !isCompleted
      ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerButton(
              constraints: constraints,
              onClicked: () {
                if (isRunning) {
                  timer.stopTimer(reset: false);
                } else {
                  timer.startTimer(revModel);
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
              color: buttonColor,
            ),
            const SizedBox(
              width: 32,
            ),
            TimerButton(
              constraints: constraints,
              onClicked: timer.stopTimer,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
                size: 32,
              ),
              color: buttonColor,
            ),
          ],
        )
      : TimerButton(
          constraints: constraints,
          onClicked: () {
            if (timer.timeInSec > 0) {
              timer.startTimer(revModel);
            } else if (timer.timeInSec == 0 && timer.inputIsSet()) {
              timer.stopTimer(reset: true);
            }
          },
          icon: timer.timeInSec == 0 && timer.inputIsSet()
              ? const Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 32,
                )
              : const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 32,
                ),
          color: buttonColor,
        );
}

Widget createTime(BuildContext context, dynamic timer, bool isPomodoroPage) {
  String formattedTime = timer.formatTime(timer.timeInSec);
  if (timer.timeInSec == 0) {
    if (!isPomodoroPage || timer.focusSessionDone) {
      return Stack(
        fit: StackFit.expand,
        children: [
          isPomodoroPage
              ? Image.asset('assets/pomodoro_80.png', scale: 0.75)
              : Image.asset('assets/meditation_80.png', scale: 0.75),
          Icon(
            Icons.done_rounded,
            color: timer.inputIsSet() ? Colors.greenAccent : Colors.transparent,
            size: 160,
            // size: MediaQuery.of(context).size.width / 3,
          )
          // Image.asset('assets/check_80.png'),
        ],
      );
    }
  }
  if (timer.timer == null && timer.time == null) {
    return isPomodoroPage
        ? Image.asset('assets/pomodoro_80.png', scale: 0.75)
        : Image.asset('assets/meditation_80.png', scale: 0.75);
  }
  return isPomodoroPage
      ? Text(
          formattedTime,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 48,
            color: timer.focusSessionDone ? Colors.blue[900] : Colors.red[900],
          ),
        )
      : Text(
          formattedTime,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 48,
            color: Colors.teal[900],
          ),
        );
}

Widget createTimer(BuildContext context, BoxConstraints constraints,
    TimerModel timer, bool isPomodoroPage) {
  return SizedBox(
    // width: 200,
    // height: 200,
    width: constraints.maxWidth / 2,
    height: constraints.maxWidth / 2,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircularProgressIndicator(
          value: timer.calcTimeProgress(),
          strokeWidth: 12,
          valueColor: const AlwaysStoppedAnimation(Colors.greenAccent),
          backgroundColor: Colors.white,
        ),
        Center(
          child: createTime(context, timer, isPomodoroPage),
        ),
      ],
    ),
  );
}
