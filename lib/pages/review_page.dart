import 'package:cpd_project/config/headings.dart';
import 'package:cpd_project/models/review_model.dart';
import 'package:cpd_project/widgets/app_bar/custom_app_bar.dart';
import 'package:cpd_project/widgets/review_page/day_overview_widget.dart';
import 'package:cpd_project/widgets/review_page/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/palette.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Consumer<ReviewModel>(
      builder: (context, revModel, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Palette.revPageBackgroundColor,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: currentWidth > 500 ? 500 : currentWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heading('Review', mainHeading, Palette.revMainHeadingColor),
                    const SizedBox(height: 10),
                    const ReviewWidget(),
                    const SizedBox(height: 10),
                    heading('Today', mainHeading, Palette.revMainHeadingColor),
                    const SizedBox(height: 10),
                    DayOverviewWidget(activity: revModel.activity),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
