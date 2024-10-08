import 'package:cpd_project/config/headings.dart';
import 'package:cpd_project/widgets/review_page/day_overview_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/palette.dart';
import '../models/review_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final revModel = Provider.of<ReviewModel>(context);
    final numOfActivities =
        revModel.activities.length < 7 ? revModel.activities.length : 7;
    final activities = revModel.activities.sublist(0, numOfActivities);
    final scrollController = ScrollController();
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Palette.mainPageBackgroundColor,
      body: Center(
        child: SizedBox(
          width: currentWidth > 500 ? 500 : currentWidth,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                heading(
                  numOfActivities > 1
                      ? 'Last $numOfActivities Activities'
                      : 'Last Activity',
                  mainHeading,
                  Palette.hisMainHeadingColor,
                ),
                Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    controller: scrollController,
                    child: ListView.builder(
                      controller: scrollController,
                      padding: EdgeInsets.zero,
                      itemCount: numOfActivities,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: DayOverviewWidget(
                            activity: activities[index],
                            review: false,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
