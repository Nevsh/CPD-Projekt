import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/activity.dart';

class HiveService {
  static const String _activityBoxName = "activityBox";
  static const String _exerciseBoxName = "exerciseBox";

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
