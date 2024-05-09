import 'dart:async';

import 'package:flutter/material.dart';

class DropdownButtonTimer extends ChangeNotifier {
  int? _time;
  int _timeInSec = 0;
  int _maxTime = 0;
  Timer? _timer;

  int? get time => _time;
  int? get timeInSec => _timeInSec;
  int? get maxTime => _maxTime;
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
    _timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
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
}
