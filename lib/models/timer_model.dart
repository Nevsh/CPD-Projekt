import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cpd_project/models/review_model.dart';
import 'package:flutter/material.dart';

abstract class TimerModel extends ChangeNotifier {
  int? time;
  int timeInSec = 0;
  int maxTime = 0;
  Timer? timer;
  final AudioPlayer audioPlayer = AudioPlayer();
  // bool dailySessionDone = false;

  List<int> get durationList;

  void timerSet(int? selectedTime) {
    if (selectedTime is int) {
      time = selectedTime;
      timeInSec = selectedTime * 60;
      maxTime = selectedTime * 60;
      stopTimer();
      notifyListeners();
    }
  }

  void startTimer(ReviewModel revModel);

  void resetTimer() {
    timeInSec = maxTime;
    notifyListeners();
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    if (timer is Timer) {
      timer?.cancel();
      timer = null;
      notifyListeners();
    }
  }

  double calcTimeProgress() {
    return inputIsSet() ? (1 - timeInSec / maxTime) : 0;
  }

  // void setDailySessionDone() {
  //   dailySessionDone = true;
  //   notifyListeners();
  // }

  bool inputIsSet() {
    return time != null;
  }

  // void playNotificationSound(String assetPath) async {
  //   await audioPlayer.play(AssetSource(assetPath));
  // }

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
