import 'package:flutter/material.dart';

import '../../config/palette.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  final List categoryList = const [
    'Meditation',
    'Pomodoro',
    'Exercise',
    'Review',
  ];

  final List pagesList = const [
    'meditation_page',
    'pomodoro_page',
    'exercise_page',
    'review_page',
    'history_page',
  ];

  final List imageList = const [
    'meditation',
    'pomodoro',
    'exercise',
    'review',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/${pagesList[index]}');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Palette.homeCategoryContainerColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/${imageList[index]}_80.png'),
                    Center(
                      child: Text(
                        '${categoryList[index]}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Palette.homeCategoryContainerFontColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
