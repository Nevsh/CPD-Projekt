import 'package:flutter/material.dart';

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
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // childAspectRatio:
        //     (MediaQuery.of(context).size.height - 50 - 25) / (4 * 240),
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
              color: Colors.white54,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset('assets/${imageList[index]}_80.png'),
                ),
                Center(
                  child: Text(
                    '${categoryList[index]}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
