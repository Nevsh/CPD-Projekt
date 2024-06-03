import 'dart:async';

import 'package:cpd_project/models/timer_model.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class PomodoroTimerModel extends TimerModel {
  int _breakTime = 0;
  int _timeSelected = 0;
  bool _focusSessionDone = false;
  int _session = 0;

  int get breakTime => _breakTime;
  int get timeSelected => _timeSelected;
  bool get focusSessionDone => _focusSessionDone;
  int get session => _session;

  @override
  void timerSet(int? selectedTime) {
    if (selectedTime is int) {
      time = selectedTime;
      timeInSec = selectedTime * 60;
      maxTime = selectedTime * 60;
      _timeSelected = selectedTime * 60;
      if (selectedTime == 25) {
        _breakTime = 5 * 60;
      } else if (selectedTime == 50) {
        _breakTime = 10 * 60;
      } else {
        _breakTime = 20 * 60;
      }
      _focusSessionDone = false;
      stopTimer();
      notifyListeners();
    }
  }

  @override
  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 1), (_) {
      if (timeInSec > 0) {
        timeInSec--;
      } else {
        dailySessionDone = true;
        FlutterRingtonePlayer().playNotification();
        if (_focusSessionDone) {
          stopTimer(reset: false);
          _focusSessionDone = false;
          maxTime = _timeSelected;
        } else {
          _focusSessionDone = true;
          timeInSec = _breakTime;
          maxTime = _breakTime;
          _session++;
        }
      }
      notifyListeners();
    });
  }
}
