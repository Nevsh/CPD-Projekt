import 'package:cpd_project/config/headings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/palette.dart';
import '../../models/exercise_model.dart';
import '../../models/review_model.dart';
import '../timer/timer_dropdown_widget.dart';

class RandomExerciseWidget extends StatelessWidget {
  const RandomExerciseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final exModel = Provider.of<ExerciseModel>(context);
    final revModel = Provider.of<ReviewModel>(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Palette.exSubContainer1Color,
        borderRadius: BorderRadius.circular(16),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              heading('Reminder', subHeading1, Palette.exSubHeadingColor),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 3,
                      right: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Palette.exTimerBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      exModel.formatTime(exModel.timeInSec),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Palette.exTimerFontColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Switch(
                    activeTrackColor: Palette.exActiveTrackColor,
                    inactiveTrackColor: Palette.exInactiveTrackColor,
                    inactiveThumbColor:
                        exModel.inputIsSet() && exModel.exerciseList.isNotEmpty
                            ? Palette.exInactiveThumbColor
                            : Palette.exInactiveDisabledThumbColor,
                    value: exModel.reminderIsActivated,
                    onChanged:
                        !exModel.inputIsSet() || exModel.exerciseList.isEmpty
                            ? null
                            : (switchState) {
                                exModel.reminderIsActivated = switchState;
                                if (exModel.reminderIsActivated) {
                                  exModel.startReminder(revModel);
                                } else {
                                  exModel.stopTimer();
                                }
                              },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Expanded(
                child: TimerDropdown(
                  timerModel: exModel,
                  optList: exModel.cyclesList,
                  unit: 'min',
                  value: exModel.time,
                  onChanged: exModel.timerSet,
                  hintText: 'Duration: ',
                  icon: const Icon(Icons.watch_later_outlined),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TimerDropdown(
                  timerModel: exModel,
                  optList: exModel.cyclesList,
                  unit: 'cycles',
                  value: exModel.numOfCycles,
                  onChanged: (int? cycles) {
                    exModel.numOfCycles = cycles;
                  },
                  hintText: 'Cycles: ',
                  icon: const Icon(Icons.refresh_rounded),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Palette.exSubContainer2Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                exModel.randomExercise,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Palette.exTextFontColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
