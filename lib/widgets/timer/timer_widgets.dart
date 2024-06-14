import 'package:cpd_project/models/review_model.dart';
import 'package:cpd_project/models/timer_model.dart';
import 'package:flutter/material.dart';

import '../../config/assets.dart';
import '../../config/palette.dart';

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
                      color: Palette.buttonTextAndIconColor,
                      size: 32,
                    )
                  : const Icon(
                      Icons.play_arrow,
                      color: Palette.buttonTextAndIconColor,
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
                color: Palette.buttonTextAndIconColor,
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
                  color: Palette.buttonTextAndIconColor,
                  size: 32,
                )
              : const Icon(
                  Icons.play_arrow,
                  color: Palette.buttonTextAndIconColor,
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
              ? Image.asset(Assets.pomImg, scale: 0.75)
              : Image.asset(Assets.medImg, scale: 0.75),
          Icon(
            Icons.done_rounded,
            color: timer.inputIsSet()
                ? Palette.timerDoneCheckColor
                : Colors.transparent,
            size: 160,
          )
        ],
      );
    }
  }
  if (timer.timer == null && timer.time == null) {
    return isPomodoroPage
        ? Image.asset(Assets.pomImg, scale: 0.75)
        : Image.asset(Assets.medImg, scale: 0.75);
  }
  return isPomodoroPage
      ? Text(
          formattedTime,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 48,
            color: timer.focusSessionDone
                ? Palette.pomBreakPhaseFontColor
                : Palette.pomWorkPhaseFontColor,
          ),
        )
      : Text(
          formattedTime,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 48,
            color: Palette.medTimerFontColor,
          ),
        );
}

Widget createTimer(BuildContext context, BoxConstraints constraints,
    TimerModel timer, bool isPomodoroPage) {
  return SizedBox(
    width: constraints.maxWidth / 2,
    height: constraints.maxWidth / 2,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircularProgressIndicator(
          value: timer.calcTimeProgress(),
          strokeWidth: 12,
          valueColor: const AlwaysStoppedAnimation(Palette.timerIndicatorColor),
          backgroundColor: Palette.timerBackgroundIndicatorColor,
        ),
        Center(
          child: createTime(context, timer, isPomodoroPage),
        ),
      ],
    ),
  );
}
