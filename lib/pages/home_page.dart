import 'package:cpd_project/config/headings.dart';
import 'package:cpd_project/widgets/home_page/categories_widget.dart';
import 'package:cpd_project/widgets/home_page/streak_overview_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            heading('Streaks', mainHeading, Colors.blue[800]),
            const SizedBox(height: 10),
            const StreakOverviewWidget(),
            const Expanded(child: SizedBox(height: 10)),
            heading('Categories', mainHeading, Colors.blue[800]),
            const SizedBox(height: 10),
            const CategoriesWidget(),
          ],
        ),
      ),
    );
  }
}
