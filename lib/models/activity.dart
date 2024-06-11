import 'package:hive/hive.dart';

part 'activity.g.dart';

@HiveType(typeId: 0)
class Activity extends HiveObject {
  @HiveField(0)
  String date;

  @HiveField(1)
  bool meditation;

  @HiveField(2)
  bool pomodoro;

  @HiveField(3)
  bool exercise;

  @HiveField(4)
  bool review;

  @HiveField(5)
  String rating;

  @HiveField(6)
  String note;

  @HiveField(7)
  int medStreak;

  @HiveField(8)
  int pomStreak;

  @HiveField(9)
  int exStreak;

  @HiveField(10)
  int revStreak;

  @HiveField(11)
  List<Activity> activities;

  Activity(
      {required this.date,
      required this.meditation,
      required this.pomodoro,
      required this.exercise,
      required this.review,
      required this.rating,
      required this.note,
      required this.medStreak,
      required this.pomStreak,
      required this.exStreak,
      required this.revStreak,
      required this.activities});
}
