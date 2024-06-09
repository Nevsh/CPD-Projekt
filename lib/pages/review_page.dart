import 'package:cpd_project/config/headings.dart';
import 'package:cpd_project/widgets/app_bar/custom_app_bar.dart';
import 'package:cpd_project/widgets/review_page/review_widget.dart';
import 'package:cpd_project/widgets/review_page/today_overview_widget.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurple[200],
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heading('Review', mainHeading, Colors.deepPurple[800]),
            const SizedBox(height: 10),
            const ReviewWidget(),
            const SizedBox(height: 10),
            heading('Today', mainHeading, Colors.deepPurple[800]),
            const SizedBox(height: 10),
            const TodayOverviewWidget(),
          ],
        ),
      ),
    );
  }
}
