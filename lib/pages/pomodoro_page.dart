import 'package:cpd_project/config/headings.dart';
import 'package:cpd_project/models/pomodoro_timer_model.dart';
import 'package:cpd_project/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/palette.dart';
import '../models/review_model.dart';
import '../widgets/timer/timer_dropdown_widget.dart';
import '../widgets/timer/timer_widgets.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final revModel = Provider.of<ReviewModel>(context);
    final currentWidth = MediaQuery.of(context).size.width;
    return Consumer<PomodoroTimerModel>(
      builder: (context, pomModel, child) => Scaffold(
        backgroundColor: Palette.pomPageBackgroundColor,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: currentWidth > 500 ? 500 : currentWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 100),
                        TimerDropdown(
                          timerModel: pomModel,
                          optList: pomModel.breakDurationList,
                          unit: 'min',
                          value: pomModel.time,
                          onChanged: pomModel.timerSet,
                          hintText: 'Choose duration: work / break ',
                          icon: const Icon(Icons.watch_later_outlined),
                        ),
                        const SizedBox(height: 25),
                        pomPhaseHeading(pomModel),
                        const SizedBox(height: 25),
                        createTimer(context, constraints, pomModel, true),
                        const SizedBox(height: 100),
                        createButton(
                          constraints,
                          revModel,
                          pomModel,
                          Palette.pomTimerButtonColor,
                        ),
                        const SizedBox(height: 25),
                        heading(
                          'Sessions: ${revModel.activity != null ? revModel.activity!.pomSessions : 0}',
                          mainHeading,
                          Colors.white,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
