import 'package:cpd_project/config/headings.dart';
import 'package:cpd_project/widgets/home_page/categories_widget.dart';
import 'package:cpd_project/widgets/home_page/streak_overview_widget.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Palette.mainPageBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: currentWidth > 500 ? 500 : currentWidth,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  heading(
                    'Streaks',
                    mainHeading,
                    Palette.homeMainHeadingColor,
                  ),
                  const SizedBox(height: 10),
                  const StreakOverviewWidget(),
                  const SizedBox(height: 10),
                  heading(
                    'Categories',
                    mainHeading,
                    Palette.homeMainHeadingColor,
                  ),
                  const SizedBox(height: 10),
                  const CategoriesWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
