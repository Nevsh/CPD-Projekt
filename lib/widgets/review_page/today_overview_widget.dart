import 'package:cpd_project/config/headings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/exercise_model.dart';
import '../../models/meditation_timer_model.dart';
import '../../models/pomodoro_timer_model.dart';
import '../../models/review_model.dart';
import '../home_page/streak_overview_widget.dart';

class TodayOverviewWidget extends StatelessWidget {
  const TodayOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final medModel = Provider.of<MeditationTimerModel>(context);
    final pomModel = Provider.of<PomodoroTimerModel>(context);
    final exModel = Provider.of<ExerciseModel>(context);
    final revModel = Provider.of<ReviewModel>(context);

    final String formattedDate =
        DateFormat('dd.MM.yyyy').format(DateTime.now());

    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(16),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: heading('Completed', subHeading2, Colors.deepPurple),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
              ],
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    createIcon(context, 'assets/meditation_80.png',
                        medModel.dailySessionDone),
                    createIcon(context, 'assets/pomodoro_80.png',
                        pomModel.dailySessionDone),
                    createIcon(context, 'assets/exercise_80.png',
                        exModel.dailySessionDone),
                    createIcon(context, 'assets/review_80.png',
                        revModel.dailySessionDone),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: heading('Review', subHeading2, Colors.deepPurple),
            ),
            Flexible(
              child: Container(
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
                            heading(
                                'Note', subHeading3, Colors.deepPurple[400]),
                            Text(
                              revModel.userNote,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Image.asset(
                        'assets/${revModel.savedMood}_96.png',
                        // height: 60,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
