import 'package:cpd_project/config/headings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/assets.dart';
import '../../config/palette.dart';
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
        color: Palette.revSubContainer1Color,
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
                child: heading(
                    'Completed',
                    subHeading2,
                    review
                        ? Palette.revSubHeading1Color
                        : Palette.hisSubHeading1Color),
              ),
              Text(
                revModel.formattedDate(activity),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: review
                        ? Palette.revSubHeading1Color
                        : Palette.hisSubHeading1Color),
              ),
            ],
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Palette.revSubContainer2Color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createIcon(context, Assets.med_img,
                    activity != null ? activity!.meditation : false),
                createIcon(context, Assets.pom_img,
                    activity != null ? activity!.pomodoro : false),
                createIcon(context, Assets.ex_img,
                    activity != null ? activity!.exercise : false),
                createIcon(context, Assets.rev_img,
                    activity != null ? activity!.review : false),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: heading(
                'Review',
                subHeading2,
                review
                    ? Palette.revSubHeading1Color
                    : Palette.hisSubHeading1Color),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Palette.exSubContainer2Color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Palette.revSubContainer3Color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heading(
                            'Note',
                            subHeading3,
                            review
                                ? Palette.revSubHeading2Color
                                : Palette.hisSubHeading2Color),
                        Text(
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
                    'assets/images/${activity != null ? activity!.rating : 'empty'}_96.png',
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
