import 'package:cpd_project/models/review_model.dart';
import 'package:cpd_project/pages/exercise_page.dart';
import 'package:cpd_project/pages/history_page.dart';
import 'package:cpd_project/pages/home_page.dart';
import 'package:cpd_project/pages/main_page.dart';
import 'package:cpd_project/pages/meditation_page.dart';
import 'package:cpd_project/pages/pomodoro_page.dart';
import 'package:cpd_project/pages/review_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/activity.dart';
import 'models/activity_model.dart';
import 'models/exercise_model.dart';
import 'models/home_navigation_bar_model.dart';
import 'models/meditation_timer_model.dart';
import 'models/pomodoro_timer_model.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ActivityAdapter());
  // await Hive.deleteBoxFromDisk('activityBox');

  // var box = await Hive.openBox('activityBox');
  // await box.deleteFromDisk();
  // var box2 = await Hive.openBox('streakBox');
  // await box2.deleteFromDisk();
  // var box3 = await Hive.openBox('dailySessionDoneBox');
  // await box3.deleteFromDisk();

  // print('Datenbank wurde gelöscht');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return ActivityModel();
        }),
        ChangeNotifierProvider(create: (context) => MeditationTimerModel()),
        ChangeNotifierProvider(create: (context) => PomodoroTimerModel()),
        ChangeNotifierProvider(create: (context) {
          final model = ExerciseModel();
          model.loadExercises();
          return model;
        }),
        ChangeNotifierProvider(create: (context) {
          final model = ReviewModel();
          model.loadData();
          return model;
        }),
        ChangeNotifierProvider(create: (context) => HomeNavigationBarModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: const MainPage(),
        routes: {
          '/home_page': (context) => const HomePage(),
          '/meditation_page': (context) => const MeditationPage(),
          '/pomodoro_page': (context) => const PomodoroPage(),
          '/exercise_page': (context) => const ExercisePage(),
          '/review_page': (context) => const ReviewPage(),
          '/history_page': (context) => const HistoryPage(),
        },
      ),
    );
  }
}
