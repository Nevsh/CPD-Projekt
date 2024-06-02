import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class TimerModel extends ChangeNotifier {
  int? time;
  int timeInSec = 1;
  int maxTime = 1;
  Timer? timer;

  void timerSet(int? selectedTime) {
    if (selectedTime is int) {
      time = selectedTime;
      timeInSec = selectedTime * 60;
      maxTime = selectedTime * 60;
      notifyListeners();
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      if (timeInSec > 0) {
        timeInSec--;
      } else {
        FlutterRingtonePlayer().playNotification();
        stopTimer(reset: false);
      }
      notifyListeners();
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    if (timer is Timer) {
      timer?.cancel();
      notifyListeners();
    }
  }

  void resetTimer() {
    timeInSec = maxTime;
    notifyListeners();
  }

  double calcTimeProgress() {
    return (1 - timeInSec / maxTime);
  }

  String formatTime(int seconds) {
    // Berechne Stunden, Minuten und Sekunden
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;

    // Formatiere die Werte als zweistellige Strings
    String hoursStr = hours.toString().padLeft(1, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = secs.toString().padLeft(2, '0');

    // Setze die Werte im Format H:MM:SS oder MM:SS zusammen
    return hours > 0
        ? '$hoursStr:$minutesStr:$secondsStr'
        : '$minutesStr:$secondsStr';
  }
}
