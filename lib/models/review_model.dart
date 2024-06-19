import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/hive_service.dart';
import 'activity/activity.dart';

class ReviewModel extends ChangeNotifier {
  final TextEditingController _textController = TextEditingController();
  String _chosenMood = 'empty';
  Activity? _activity;
  Activity? _lastActivity;
  List<Activity> _activities = [];

  TextEditingController get textController => _textController;
  String get chosenMood => _chosenMood;
  Activity? get activity => _activity;
  List<Activity> get activities => _activities;
  Activity? get lastActivity => _lastActivity;

  Future<void> loadLastActivity() async {
    if (_activities.isNotEmpty) {
      _lastActivity = _activities.first;
    } else {
      _lastActivity = null;
    }
  }

  set activity(Activity? act) {
    if (act != null) {
      _activity = act;
    }
  }

  set lastActivity(Activity? act) {
    if (act != null) {
      _lastActivity = act;
    }
  }

  set activities(List<Activity> acts) {
    if (acts.isNotEmpty) {
      _activities = acts;
    }
  }

  set medDailySessionDone(bool done) {
    if (_activity != null && !_activity!.meditation) {
      _activity!.meditation = done;
      _activity!.medStreak++;
    }
    saveActivity();
  }

  set pomDailySessionDone(bool done) {
    if (_activity != null && !_activity!.pomodoro) {
      _activity!.pomodoro = done;
      _activity!.pomStreak++;
    }
    saveActivity();
  }

  set exDailySessionDone(bool done) {
    if (_activity != null && !_activity!.exercise) {
      _activity!.exercise = done;
      _activity!.exStreak++;
    }
    saveActivity();
  }

  set revDailySessionDone(bool done) {
    if (_chosenMood != 'empty' && _activity != null && !_activity!.review) {
      _activity!.review = done;
      _activity!.revStreak++;
    }
    saveActivity();
  }

  void updatePomSessions() {
    if (_activity != null) {
      _activity!.pomSessions++;
    }
    saveActivity();
  }

  void setChosenMood(String chosenMood) {
    _chosenMood = chosenMood;
    notifyListeners();
  }

  void setSavedMood(String mood) {
    _activity!.rating = mood;
  }

  void setUserNote(String note) {
    if (note.isNotEmpty) {
      _activity!.note = note;
    }
  }

  String formattedDate(Activity? activity) {
    return activity != null
        ? DateFormat('dd.MM.yyyy').format(DateTime.parse(activity.date))
        : "no activity";
  }

  Future<void> saveReview(String mood, String note) async {
    if (_activity != null) {
      setSavedMood(mood);
      setUserNote(note);
      revDailySessionDone = true;
      notifyListeners();
    }
  }

  Future<void> loadModelData() async {
    if (activity != null) {
      _chosenMood = _activity!.rating;
      checkStreak();
    }
    notifyListeners();
  }

  Future<void> checkStreak() async {
    if (lastActivity != null) {
      DateTime activityDate = DateTime.parse(_activity!.date);
      DateTime lastActivityDate = DateTime.parse(lastActivity!.date);
      int differenceInDays = activityDate.difference(lastActivityDate).inDays;
      if (differenceInDays == 1) {
        if (_lastActivity!.meditation) {
          _activity!.medStreak = lastActivity!.medStreak;
        } else {
          _activity!.medStreak = 0;
        }
        if (_lastActivity!.pomodoro) {
          _activity!.pomStreak = lastActivity!.pomStreak;
        } else {
          _activity!.pomStreak = 0;
        }
        if (_lastActivity!.exercise) {
          _activity!.exStreak = lastActivity!.exStreak;
        } else {
          _activity!.exStreak = 0;
        }
        if (_lastActivity!.review) {
          _activity!.revStreak = lastActivity!.revStreak;
        } else {
          _activity!.revStreak = 0;
        }
      }
      saveActivity();
    }
  }

  Future<void> loadAllActivities() async {
    _activities = await HiveService.getAllActivities();
    _activities.sort((a, b) {
      DateTime dateA = DateTime.parse(a.date);
      DateTime dateB = DateTime.parse(b.date);
      return dateB.compareTo(dateA); // Sortieren in absteigender Reihenfolge
    });
    notifyListeners();
  }

  Future<void> saveActivity() async {
    if (_activity != null) {
      await HiveService.saveActivity(_activity!);
      await loadAllActivities();
    }
  }

  Future<void> loadData() async {
    await loadAllActivities();
    await loadLastActivity();
    await loadActivity();
    await loadModelData();
  }

  Future<void> loadActivity() async {
    DateTime now = DateTime.now();
    String today = DateFormat('yyyy-MM-dd').format(now);
    _activity = await HiveService.getActivity(today);
    if (_activity == null) {
      _activity = Activity(
        date: today,
        meditation: false,
        pomodoro: false,
        exercise: false,
        review: false,
        rating: 'empty',
        note: '',
        medStreak: 0,
        pomStreak: 0,
        exStreak: 0,
        revStreak: 0,
        pomSessions: 0,
      );
      saveActivity();
    }
    notifyListeners();
  }
}
