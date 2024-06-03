import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    return Scaffold(
      backgroundColor: Colors.blue[200],
      // appBar: AppBar(
      //   title: const Text(
      //     'HOME',
      //     style: TextStyle(
      //       fontSize: 32,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.white,
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue[600],
      // ),
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
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
            ),
            child: Container(
              width: double.infinity,
              height: 128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/meditation_80.png",
                              ),
                              Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.greenAccent,
                                size: MediaQuery.of(context).size.width / 8,
                              )
                            ],
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 8,
                        child: Image.asset(
                          "assets/pomodoro_80.png",
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 8,
                        child: Image.asset(
                          "assets/exercise_80.png",
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 8,
                        child: Image.asset(
                          "assets/review_80.png",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        width: MediaQuery.of(context).size.width / 8,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26,
                        ),
                        child: const Center(
                            child: Text(
                          "10",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        width: MediaQuery.of(context).size.width / 8,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26,
                        ),
                        child: const Center(
                            child: Text(
                          "10",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        width: MediaQuery.of(context).size.width / 8,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26,
                        ),
                        child: const Center(
                            child: Text(
                          "10",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        width: MediaQuery.of(context).size.width / 8,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26,
                        ),
                        child: const Center(
                            child: Text(
                          "10",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // childAspectRatio:
                  //     (MediaQuery.of(context).size.height - 50 - 25) /
                  //         (4 * 240),
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
                            child: Image.asset(
                                "assets/${imageList[index]}_80.png"),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
