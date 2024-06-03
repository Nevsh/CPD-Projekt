import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton(
      {super.key,
      required this.onClicked,
      required this.icon,
      required this.color});

  final Icon icon;
  final VoidCallback onClicked;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 4;
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

Widget createButton(timer, Color? buttonColor) {
  final isRunning = timer.timer == null ? false : timer.timer!.isActive;
  final isCompleted = timer.timeInSec == timer.maxTime || timer.timeInSec == 0;

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
              color: buttonColor,
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
              color: buttonColor,
            ),
          ],
        )
      : TimerButton(
          onClicked: () {
            if (timer.timeInSec > 1) {
              timer.startTimer();
            } else if (timer.timeInSec == 0) {
              timer.stopTimer(reset: true);
            }
          },
          icon: timer.timeInSec == 0
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
    if (!isPomodoroPage || !timer.focusSessionDone) {
      return Stack(
        fit: StackFit.expand,
        children: [
          isPomodoroPage
              ? Image.asset("assets/pomodoro_80.png", scale: 0.75)
              : Image.asset("assets/meditation_80.png", scale: 0.75),
          Icon(
            Icons.done_rounded,
            color: Colors.greenAccent,
            // size: 160,
            size: MediaQuery.of(context).size.width / 3,
          )
        ],
      );
    }
  }
  if (timer.timer == null && timer.time == null) {
    return isPomodoroPage
        ? Image.asset("assets/pomodoro_80.png", scale: 0.75)
        : Image.asset("assets/meditation_80.png", scale: 0.75);
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

Widget createTimer(BuildContext context, dynamic timer, bool isPomodoroPage) {
  double width = MediaQuery.of(context).size.width / 2;
  double height = width;

  return SizedBox(
    // width: 200,
    // height: 200,
    width: width,
    height: height,
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
