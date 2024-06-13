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
    final currentWidth = MediaQuery.of(context).size.width;
    // final currentHeight = MediaQuery.of(context).size.height;

    return Consumer<MeditationTimerModel>(
      builder: (context, medModel, child) => Scaffold(
        backgroundColor: Colors.teal[200],
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: currentWidth > 500 ? 500 : currentWidth,
              // height: currentHeight - 56,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 100),
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
                        const SizedBox(height: 100),
                        createTimer(context, constraints, medModel, false),
                        const SizedBox(height: 100),
                        createButton(
                            constraints, revModel, medModel, Colors.teal[600]),
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
