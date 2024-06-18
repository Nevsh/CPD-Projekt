import 'package:cpd_project/config/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/palette.dart';
import '../../models/activity.dart';
import '../../models/review_model.dart';

class StreakOverviewWidget extends StatelessWidget {
  const StreakOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final revModel = Provider.of<ReviewModel>(context);
    Activity? activity = revModel.activity;

    return Container(
      height: 120,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Palette.homeStreakContainerColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Flexible(
                child: createIcon(context, Assets.medImg,
                    activity != null ? activity.meditation : false),
              ),
              const SizedBox(height: 10),
              createStreakCounter(
                  context, activity != null ? activity.medStreak : 0),
            ],
          ),
          Column(
            children: [
              Flexible(
                child: createIcon(context, Assets.pomImg,
                    activity != null ? activity.pomodoro : false),
              ),
              const SizedBox(height: 10),
              createStreakCounter(
                  context, activity != null ? activity.pomStreak : 0),
            ],
          ),
          Column(
            children: [
              Flexible(
                child: createIcon(context, Assets.exImg,
                    activity != null ? activity.exercise : false),
              ),
              const SizedBox(height: 10),
              createStreakCounter(
                  context, activity != null ? activity.exStreak : 0),
            ],
          ),
          Column(
            children: [
              Flexible(
                child: createIcon(context, Assets.revImg,
                    activity != null ? activity.review : false),
              ),
              const SizedBox(height: 10),
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
    child: dailySessionDone
        ? Stack(
            children: [
              Image.asset(asset),
              Image.asset(
                Assets.checkImg,
                width: 30,
              ),
            ],
          )
        : Image.asset(asset),
  );
}

Widget createStreakCounter(BuildContext context, int streakCount) {
  return Container(
    padding: const EdgeInsets.all(3),
    width: 64,
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
