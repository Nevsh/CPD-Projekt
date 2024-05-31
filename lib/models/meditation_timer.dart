import 'dart:async';

import 'package:flutter/material.dart';

class MeditationTimerModel extends ChangeNotifier {
  int? _time;
  int _timeInSec = 1;
  int _maxTime = 1;
  Timer? _timer;

  int? get time => _time;
  int get timeInSec => _timeInSec;
  int get maxTime => _maxTime;
  Timer? get timer => _timer;

  void timerSet(int? selectedTime) {
    if (selectedTime is int) {
      _time = selectedTime;
      _timeInSec = selectedTime * 60;
      _maxTime = selectedTime * 60;
      notifyListeners();
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_timeInSec > 0) {
        _timeInSec--;
      } else {
        stopTimer(reset: false);
      }
      notifyListeners();
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    if (_timer is Timer) {
      _timer?.cancel();
      notifyListeners();
    }
  }

  void resetTimer() {
    _timeInSec = _maxTime;
    notifyListeners();
  }

  String formatTime(int seconds) {
    // Berechne Stunden, Minuten und Sekunden
    // int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;

    // Formatiere die Werte als zweistellige Strings
    // String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = secs.toString().padLeft(2, '0');

    // Setze die Werte im Format HH:MM:SS zusammen
    // return '$hoursStr:$minutesStr:$secondsStr';
    return '$minutesStr:$secondsStr';
  }
}
