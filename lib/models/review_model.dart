import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/hive_service.dart';
import 'activity.dart';

class ReviewModel extends ChangeNotifier {
  final TextEditingController _textController = TextEditingController();
  String _chosenMood = 'empty';
  // String _savedMood = 'empty';
  // String _userNote = '';
  // bool _medDailySessionDone = false;
  // bool _pomDailySessionDone = false;
  // bool _exDailySessionDone = false;
  // bool _revDailySessionDone = false;
  // int _medStreakCounter = 0;
  // int _pomStreakCounter = 0;
  // int _exStreakCounter = 0;
  // int _revStreakCounter = 0;
  Activity? _activity;
  Activity? _lastActivity;
  List<Activity> _activities = [];

  // int get medStreakCounter => _medStreakCounter;
  // int get pomStreakCounter => _pomStreakCounter;
  // int get exStreakCounter => _exStreakCounter;
  // int get revStreakCounter => _revStreakCounter;
  // set streakCounter(int value) => _streakCounter = value;

  Activity? get activity => _activity;
  List<Activity> get activities => _activities;
  Activity? get lastActivity => _lastActivity;
  // Activity? get lastActivity {
  //   loadAllActivities();
  //   if (_activities.isNotEmpty) {
  //     return _activities.first;
  //   }
  //   return null;
  // }

  Future<void> loadLastActivity() async {
    // loadAllActivities();
    if (_activities.isNotEmpty) {
      _lastActivity = _activities.first;
      print("lastActivty ist von ${lastActivity!.date}");
    } else {
      _lastActivity = null;
      print("lastActivity ist null.");
    }
  }

  String get chosenMood => _chosenMood;
  // String get savedMood => _savedMood;
  // String get userNote => _userNote;
  // bool get medDailySessionDone => _medDailySessionDone;
  // bool get pomDailySessionDone => _pomDailySessionDone;
  // bool get exDailySessionDone => _exDailySessionDone;
  // bool get revDailySessionDone => _revDailySessionDone;
  TextEditingController get textController => _textController;

  set medDailySessionDone(bool done) {
    // _medDailySessionDone = done;
    if (_activity != null && !_activity!.meditation) {
      _activity!.meditation = done;
      _activity!.medStreak++;
    }
    saveActivity();
  }

  set pomDailySessionDone(bool done) {
    // _pomDailySessionDone = done;
    if (_activity != null && !_activity!.pomodoro) {
      _activity!.pomodoro = done;
      _activity!.pomStreak++;
    }
    saveActivity();
  }

  set exDailySessionDone(bool done) {
    // _exDailySessionDone = done;
    if (_activity != null && !_activity!.exercise) {
      _activity!.exercise = done;
      _activity!.exStreak++;
    }
    saveActivity();
  }

  set revDailySessionDone(bool done) {
    // _revDailySessionDone = done;
    if (_chosenMood != 'empty' && _activity != null && !_activity!.review) {
      _activity!.review = done;
      _activity!.revStreak++;
    }
    saveActivity();
  }

  void setChosenMood(String chosenMood) {
    print(chosenMood);
    _chosenMood = chosenMood;
    notifyListeners();
  }

  void setSavedMood(String mood) {
    // Activity? activity = context.read<ActivityModel>().activity;
    // _savedMood = mood;
    _activity!.rating = mood;

    // notifyListeners();
  }

  void setUserNote(String note) {
    // Activity? activity = context.read<ActivityModel>().activity;
    if (note.isNotEmpty) {
      // _userNote = note;
      _activity!.note = note;
      // notifyListeners();
    }
  }

  // void setDailySessionDone(Activity activity) {
  //   // Activity? activity = context.read<ActivityModel>().activity;
  //   _dailySessionDone = true;
  //   activity.review = true;
  //   // notifyListeners();
  // }
  String formattedDate(Activity? activity) {
    return activity != null
        ? DateFormat('dd.MM.yyyy').format(DateTime.parse(activity.date))
        : "error";
  }

  Future<void> saveReview(String mood, String note) async {
    if (_activity != null) {
      setSavedMood(mood);
      setUserNote(note);
      revDailySessionDone = true;
      notifyListeners();
    } else {
      print("Fehler saving: activity $_activity");
    }
  }

  Future<void> loadModelData() async {
    if (activity != null) {
      // _medDailySessionDone = _activity!.meditation;
      // _pomDailySessionDone = _activity!.pomodoro;
      // _exDailySessionDone = _activity!.exercise;
      // _revDailySessionDone = _activity!.review;
      _chosenMood = _activity!.rating;
      // _savedMood = _activity!.rating;
      // _userNote = _activity!.note;
      // _medStreakCounter = _activity!.medStreak;
      // _pomStreakCounter = _activity!.pomStreak;
      // _exStreakCounter = _activity!.exStreak;
      // _revStreakCounter = _activity!.revStreak;
      checkStreak();
      // print(activities);
    } else {
      print(
          "Fehler loading: activity $activity und lastActivity $lastActivity");
    }
    // streakCounter = await HiveService.getStreakCounter('review_streak');
    notifyListeners();
  }

  Future<void> checkStreak() async {
    if (lastActivity != null) {
      DateTime activityDate = DateTime.parse(_activity!.date);
      DateTime lastActivityDate = DateTime.parse(lastActivity!.date);
      int differenceInDays = activityDate.difference(lastActivityDate).inDays;
      print("Tage Unterschied $differenceInDays");
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

  void printActivities() {
    for (var act in _activities) {
      print('Datum: ${act.date}');
    }
  }

  Future<void> loadAllActivities() async {
    _activities = await HiveService.getAllActivities();
    // Sortiere die Aktivitäten nach Datum, absteigend
    // _activities.sort((a, b) => b.date.compareTo(a.date));
    print("Unsotiert:");
    printActivities();
    // print(_activities[3].date);
    _activities.sort((a, b) {
      DateTime dateA = DateTime.parse(a.date);
      DateTime dateB = DateTime.parse(b.date);
      return dateB.compareTo(dateA); // Sortieren in absteigender Reihenfolge
    });
    print("Sotiert:");
    printActivities();
    // print(_activities[3].date);
    notifyListeners();
  }

  Future<void> saveActivity() async {
    if (_activity != null) {
      await HiveService.saveActivity(_activity!);
      await loadAllActivities();
    }
  }

  // Erzeugen von Testaktivitäten
  Future<void> demoSaveActivity() async {
    Activity? act1 = Activity(
      date: '2024-06-08',
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
      activities: [],
    );
    Activity? act2 = Activity(
      date: '2024-06-12',
      meditation: true,
      pomodoro: false,
      exercise: true,
      review: false,
      rating: 'empty',
      note: '',
      medStreak: 10,
      pomStreak: 5,
      exStreak: 4,
      revStreak: 2,
      activities: [],
    );
    Activity? act3 = Activity(
      date: '2024-06-02',
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
      activities: [],
    );
    await HiveService.saveActivity(act1);
    await HiveService.saveActivity(act2);
    await HiveService.saveActivity(act3);
    // await loadAllActivities();
  }

  Future<void> loadData() async {
    // await demoSaveActivity();
    await loadAllActivities();
    await loadLastActivity();
    await loadActivity();
    await loadModelData();
  }

  Future<void> loadActivity() async {
    DateTime now = DateTime.now();
    // String today = DateFormat('yyyy-MM-dd').format(now);
    String today = "2024-06-16";
    print("Heute: $today");
    print("Heute: $now");
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
        activities: [],
      );
      saveActivity();
      // _activities.add(_activity!);
      print("komplett neu");
    }
    print("Activity = $_activity");
    notifyListeners();
  }

  // Activity? get lastActivity {
  //   loadAllActivities();
  //   if (_activities.isNotEmpty) {
  //     return _activities.first;
  //   }
  //   return null;
  // }

  // Future<void> loadModelData(BuildContext context) async {
  //   // dailySessionDone = await HiveService.getDailySessionDone('review_done');
  //   Activity? activity = context.read<ActivityModel>().activity;
  //   Activity? lastActivity = context.read<ActivityModel>().lastActivity;
  //   if (activity != null && lastActivity != null) {
  //     _dailySessionDone = activity.review;
  //     _chosenMood = activity.rating;
  //     _savedMood = activity.rating;
  //     _userNote = activity.note;
  //     // checkStreak(context, activity, lastActivity, lastActivity.review);
  //     checkStreak(context, activity);
  //   } else {
  //     print(
  //         "Fehler loading: activity $activity und lastActivity $lastActivity");
  //   }
  //   streakCounter = await HiveService.getStreakCounter('review_streak');
  //   notifyListeners();
  // }

  // Future<void> checkStreak(BuildContext context, Activity activity) async {
  //   Activity? lastActivity = context.read<ActivityModel>().lastActivity;
  //   if (lastActivity != null) {
  //     DateTime activityDate = DateTime.parse(activity.date);
  //     DateTime lastActivityDate = DateTime.parse(lastActivity.date);
  //     int differenceInDays = activityDate.difference(lastActivityDate).inDays;
  //     if (differenceInDays > 1 ||
  //         (differenceInDays == 1 && !lastActivity.review)) {
  //       await HiveService.saveStreakCounter('review_streak', 0);
  //     }
  //   } else {
  //     await HiveService.saveStreakCounter('review_streak', 0);
  //   }
  // }

  // Future<void> checkStreak(BuildContext context) async {
  //   Activity? lastActivity = context.read<ActivityModel>().lastActivity;
  //   if (lastActivity != null) {
  //     if (!lastActivity.meditation) {
  //       await HiveService.saveStreakCounter('meditation_streak', 0);
  //     }
  //     if (!lastActivity.pomodoro) {
  //       await HiveService.saveStreakCounter('pomodoro_streak', 0);
  //     }
  //     if (!lastActivity.exercise) {
  //       await HiveService.saveStreakCounter('exercise_streak', 0);
  //     }
  //     if (!lastActivity.review) {
  //       await HiveService.saveStreakCounter('review_streak', 0);
  //     }
  //   }
  // }

  // void saveModelData() async {
  //   if (!_dailySessionDone) {
  //     await HiveService.saveStreakCounter('review_streak', streakCounter++);
  //     await HiveService.saveDailySessionDone('review_done', dailySessionDone);
  //   }
  // }

  // Future<void> saveActivity(Activity activity) async {
  //   await HiveService.saveActivity(activity);
  //   await loadAllActivities();
  // }
  //
  // Future<void> loadAllActivities() async {
  //   _activities = await HiveService.getAllActivities();
  //   // Sortiere die Aktivitäten nach Datum, absteigend
  //   _activities.sort((a, b) => b.date.compareTo(a.date));
  //   notifyListeners();
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
  //   savedMood = _activity!.rating;
  //   userNote = _activity!.note;
  //   notifyListeners();
  // }
  //
  // Activity? get latestActivity {
  //   if (_activities.isNotEmpty) {
  //     return _activities.first;
  //   }
  //   return null;
  // }
}
