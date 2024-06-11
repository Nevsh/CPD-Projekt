import 'package:cpd_project/widgets/app_bar/custom_app_bar.dart';
import 'package:cpd_project/widgets/timer/timer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meditation_timer_model.dart';
import '../models/review_model.dart';
import '../widgets/timer/timer_dropdown_widget.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final revModel = Provider.of<ReviewModel>(context);
    return Consumer<MeditationTimerModel>(
      builder: (context, medModel, child) => Scaffold(
        backgroundColor: Colors.teal[200],
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimerDropdown(
                  timerModel: medModel,
                  optList: medModel.durationList,
                  unit: 'min',
                  // items: medModel.medDurationList,
                  value: medModel.time,
                  onChanged: medModel.timerSet,
                  hintText: 'Choose duration: ',
                  icon: const Icon(Icons.watch_later_outlined),
                ),
                createTimer(context, medModel, false),
                createButton(revModel, medModel, Colors.teal[600]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
