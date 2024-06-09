import 'package:flutter/material.dart';

import '../mixins/streak_counter_mixin.dart';

class ReviewModel extends ChangeNotifier with StreakCounterMixin {
  String _mood = 'empty';
  String _savedMood = 'empty';
  String _userNote = '';
  bool dailySessionDone = false;
  final TextEditingController _textController = TextEditingController();

  String get mood => _mood;
  String get savedMood => _savedMood;
  String get userNote => _userNote;
  TextEditingController get textController => _textController;

  set userNote(String note) {
    if (note.isNotEmpty) {
      _userNote = note;
      notifyListeners();
    }
  }

  set savedMood(String mood) {
    _savedMood = mood;
    notifyListeners();
  }

  void setChosenMood(String chosenMood) {
    _mood = chosenMood;
    notifyListeners();
  }

  void setDailySessionDone() {
    dailySessionDone = true;
    notifyListeners();
  }
}
