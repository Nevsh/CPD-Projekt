import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/activity.dart';
import '../../models/review_model.dart';

class StreakOverviewWidget extends StatelessWidget {
  const StreakOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final medModel = Provider.of<MeditationTimerModel>(context);
    // final pomModel = Provider.of<PomodoroTimerModel>(context);
    // final exModel = Provider.of<ExerciseModel>(context);
    final revModel = Provider.of<ReviewModel>(context);
    Activity? activity = revModel.activity;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 128,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              createIcon(context, 'assets/meditation_80.png',
                  activity != null ? activity.meditation : false),
              createIcon(context, 'assets/pomodoro_80.png',
                  activity != null ? activity.pomodoro : false),
              createIcon(context, 'assets/exercise_80.png',
                  activity != null ? activity.exercise : false),
              createIcon(context, 'assets/review_80.png',
                  activity != null ? activity.review : false),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              createStreakCounter(
                  context, activity != null ? activity.medStreak : 0),
              createStreakCounter(
                  context, activity != null ? activity.pomStreak : 0),
              createStreakCounter(
                  context, activity != null ? activity.exStreak : 0),
              createStreakCounter(
                  context, activity != null ? activity.revStreak : 0),
            ],
          ),
        ],
      ),
    );
  }
}

Widget createIcon(BuildContext context, String asset, bool dailySessionDone) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 8,
    child: dailySessionDone
        ? Stack(
            children: [
              Image.asset(asset),
              Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.greenAccent,
                size: MediaQuery.of(context).size.width / 8,
              )
            ],
          )
        : Image.asset(asset),
  );
}

Widget createStreakCounter(BuildContext context, int streakCount) {
  return Container(
    padding: const EdgeInsets.all(3),
    width: MediaQuery.of(context).size.width / 8,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.black26,
    ),
    child: Center(
      child: Text(
        streakCount.toString(),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
