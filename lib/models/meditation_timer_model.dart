import 'dart:async';

import 'package:cpd_project/models/timer_model.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class MeditationTimerModel extends TimerModel {
  final List<int> _durationList = const [1, 3, 5, 10, 15, 30];

  @override
  List<int> get durationList => _durationList;

  @override
  void timerSet(int? selectedTime) {
    if (selectedTime is int) {
      time = selectedTime;
      timeInSec = selectedTime * 60;
      maxTime = selectedTime * 60;
      stopTimer();
      notifyListeners();
    }
  }

  @override
  void startTimer() {
    notifyListeners();
    timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      if (timeInSec > 0) {
        timeInSec--;
        if (timeInSec == 0) {
          dailySessionDone = true;
          FlutterRingtonePlayer().playNotification();
          stopTimer(reset: false);
        }
      }
      notifyListeners();
    });
  }

  @override
  void resetTimer() {
    timeInSec = maxTime;
    notifyListeners();
  }
}
