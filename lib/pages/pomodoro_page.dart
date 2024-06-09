import 'package:cpd_project/config/headings.dart';
import 'package:cpd_project/models/pomodoro_timer_model.dart';
import 'package:cpd_project/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/timer/timer_dropdown_widget.dart';
import '../widgets/timer/timer_widgets.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PomodoroTimerModel>(
      builder: (context, pomModel, child) => Scaffold(
        backgroundColor: Colors.red[200],
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimerDropdown(
                  timerModel: pomModel,
                  optList: pomModel.breakDurationList,
                  unit: 'min',
                  // items: pomModel.pomDurationList,
                  value: pomModel.time,
                  onChanged: pomModel.timerSet,
                  hintText: 'Choose duration: work / break ',
                  icon: const Icon(Icons.watch_later_outlined),
                ),
                pomPhaseHeading(pomModel),
                createTimer(context, pomModel, true),
                createButton(pomModel, Colors.red[600]),
                heading(
                  'Session: ${pomModel.session}',
                  mainHeading,
                  Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
