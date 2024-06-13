import 'package:cpd_project/config/headings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/activity.dart';
import '../../models/review_model.dart';
import '../home_page/streak_overview_widget.dart';

class DayOverviewWidget extends StatelessWidget {
  const DayOverviewWidget(
      {super.key, required this.activity, this.review = true});
  final Activity? activity;
  final bool review;

  @override
  Widget build(BuildContext context) {
    // final medModel = Provider.of<MeditationTimerModel>(context);
    // final pomModel = Provider.of<PomodoroTimerModel>(context);
    // final exModel = Provider.of<ExerciseModel>(context);
    final revModel = Provider.of<ReviewModel>(context);

    // final actModel = Provider.of<ActivityModel>(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(16),
      ),
      // height: 260,
      // width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: heading('Completed', subHeading2,
                    review ? Colors.deepPurple : Colors.blue[600]),
              ),
              Text(
                revModel.formattedDate(activity),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: review ? Colors.deepPurple : Colors.blue[600]),
              ),
            ],
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createIcon(context, 'assets/meditation_80.png',
                    activity != null ? activity!.meditation : false),
                createIcon(context, 'assets/pomodoro_80.png',
                    activity != null ? activity!.pomodoro : false),
                createIcon(context, 'assets/exercise_80.png',
                    activity != null ? activity!.exercise : false),
                createIcon(context, 'assets/review_80.png',
                    activity != null ? activity!.review : false),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: heading('Review', subHeading2,
                review ? Colors.deepPurple : Colors.blue[600]),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heading('Note', subHeading3,
                            review ? Colors.deepPurple[400] : Colors.blue),
                        Text(
                          // revModel.userNote,
                          activity != null
                              ? activity!.note
                              : 'Fehler: activity null',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Image.asset(
                    // 'assets/${revModel.savedMood}_96.png',
                    'assets/${activity != null ? activity!.rating : 'empty'}_96.png',
                    // height: 60,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
