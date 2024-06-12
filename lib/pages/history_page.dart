import 'package:cpd_project/config/headings.dart';
import 'package:cpd_project/widgets/review_page/day_overview_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/review_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final revModel = Provider.of<ReviewModel>(context);
    final numOfActivities =
        revModel.activities.length < 7 ? revModel.activities.length : 7;
    final activities = revModel.activities.sublist(0, numOfActivities);

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            heading(
                "Last $numOfActivities activities", mainHeading, Colors.white),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: numOfActivities,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DayOverviewWidget(activity: activities[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
