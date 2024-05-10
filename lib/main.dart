import 'package:cpd_project/logic/meditation_timer.dart';
import 'package:cpd_project/pages/break_page.dart';
import 'package:cpd_project/pages/exercise_page.dart';
import 'package:cpd_project/pages/history_page.dart';
import 'package:cpd_project/pages/home_page.dart';
import 'package:cpd_project/pages/meditation_page.dart';
import 'package:cpd_project/pages/review_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => DropdownButtonTimer(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const HomePage(),
      routes: {
        '/home_page': (context) => const HomePage(),
        '/meditation_page': (context) => const MeditationPage(),
        '/break_page': (context) => const BreakPage(),
        '/exercise_page': (context) => const ExercisePage(),
        '/review_page': (context) => const ReviewPage(),
        '/history_page': (context) => const HistoryPage(),
      },
    );
  }
}
