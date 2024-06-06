import 'package:cpd_project/widgets/categories_widget.dart';
import 'package:cpd_project/widgets/streak_overview_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                right: 16,
              ),
              child: Text('Streaks ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.blue[800],
                  )),
            ),
          ),
          const StreakOverviewWidget(),
          const Padding(
            padding: EdgeInsets.only(
              left: 16,
              top: 16,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Categories',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
          const CategoriesWidget(),
        ],
      ),
    );
  }
}
