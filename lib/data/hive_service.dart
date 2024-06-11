import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/activity.dart';

class HiveService {
  static const String _activityBoxName = "activityBox";
  static const String _exerciseBoxName = "exerciseBox";
  // static const String _streakBoxName = "streakBox";
  // static const String _dailySessionDoneBoxName = "dailySessionDoneBox";

  static Future<void> saveActivity(Activity activity) async {
    var box = await Hive.openBox<Activity>(_activityBoxName);
    await box.put(activity.date, activity);
  }

  static Future<Activity?> getActivity(String date) async {
    var box = await Hive.openBox<Activity>(_activityBoxName);
    return box.get(date);
  }

  static Future<List<Activity>> getAllActivities() async {
    var box = await Hive.openBox<Activity>(_activityBoxName);
    return box.values.toList();
  }

  // static Future<void> saveStreakCounter(String key, int streak) async {
  //   var box = await Hive.openBox<int>(_streakBoxName);
  //   await box.put(key, streak);
  // }
  //
  // static Future<int> getStreakCounter(String key) async {
  //   var box = await Hive.openBox<int>(_streakBoxName);
  //   return box.get(key, defaultValue: 0)!;
  // }
  //
  // static Future<void> saveDailySessionDone(String key, bool isDone) async {
  //   var box = await Hive.openBox<bool>(_dailySessionDoneBoxName);
  //   await box.put(key, isDone);
  // }
  //
  // static Future<bool> getDailySessionDone(String key) async {
  //   var box = await Hive.openBox<bool>(_dailySessionDoneBoxName);
  //   return box.get(key, defaultValue: false)!;
  // }

  static Future<void> saveExerciseList(List<String> exerciseList) async {
    var box = await Hive.openBox<String>(_exerciseBoxName);
    await box.put('exerciseList', jsonEncode(exerciseList));
  }

  static Future<List<String>> getExerciseList() async {
    var box = await Hive.openBox<String>(_exerciseBoxName);
    String? exerciseListString = box.get('exerciseList');
    if (exerciseListString != null) {
      return List<String>.from(jsonDecode(exerciseListString));
    } else {
      return <String>[];
    }
  }
}
