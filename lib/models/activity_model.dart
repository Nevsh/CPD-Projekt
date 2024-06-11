import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityModel extends ChangeNotifier {
  // Activity? _activity;
  // List<Activity> _activities = [];
  //
  // Activity? get activity => _activity;
  // List<Activity> get activities => _activities;

  // void updateActivity() {}
  //
  // Future<void> loadAllActivities() async {
  //   _activities = await HiveService.getAllActivities();
  //   // Sortiere die Aktivitäten nach Datum, absteigend
  //   // _activities.sort((a, b) => b.date.compareTo(a.date));
  //   activities.sort((a, b) {
  //     DateTime dateA = DateTime.parse(a.date);
  //     DateTime dateB = DateTime.parse(b.date);
  //     return dateB.compareTo(dateA); // Sortieren in absteigender Reihenfolge
  //   });
  //   notifyListeners();
  // }
  //
  // Future<void> saveActivity(Activity activity) async {
  //   await HiveService.saveActivity(activity);
  //   await loadAllActivities();
  // }
  //
  // // Future<void> loadData(BuildContext context) async {
  // //   await loadActivity(context).then((context) =>
  // //       context.read<ReviewModel>().loadModelData(activity, lastActivity));
  // // }
  // Future<void> loadData() async {
  //   await loadActivity();
  //   await Future.delayed(
  //       Duration.zero); // Sicherstellen, dass alle Änderungen angewendet werden
  //   await Provider.of<ReviewModel>(providerContext, listen: false)
  //       .loadModelData(_activity, lastActivity);
  // }
  //
  // Future<void> loadActivity() async {
  //   String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
  //   _activity = await HiveService.getActivity(today);
  //   if (_activity == null) {
  //     _activity = Activity(
  //       date: today,
  //       meditation: false,
  //       pomodoro: false,
  //       exercise: false,
  //       review: false,
  //       rating: 'empty',
  //       note: '',
  //     );
  //     saveActivity(_activity!);
  //     _activities.add(_activity!);
  //   }
  //   notifyListeners();
  // }
  //
  // Activity? get lastActivity {
  //   loadAllActivities();
  //   if (_activities.isNotEmpty) {
  //     return _activities.first;
  //   }
  //   return null;
  // }
}
