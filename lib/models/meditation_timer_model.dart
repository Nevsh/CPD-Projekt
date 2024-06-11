import 'dart:async';

import 'package:cpd_project/models/review_model.dart';
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
  void startTimer(ReviewModel revModel) {
    notifyListeners();
    timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      if (timeInSec > 0) {
        timeInSec--;
        if (timeInSec == 0) {
          // saveModelData();
          // dailySessionDone = true;
          FlutterRingtonePlayer().playNotification();
          revModel.medDailySessionDone = true;
          // context.read<ReviewModel>().medDailySessionDone = true;
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

  // void loadModelData() async {
  //   print("load med counter");
  //   streakCounter = await HiveService.getStreakCounter('meditation_streak');
  //   dailySessionDone = await HiveService.getDailySessionDone('meditation_done');
  //   notifyListeners();
  // }

  // void saveModelData() async {
  //   if (!dailySessionDone) {
  //     print("save and inc med counter");
  //     streakCounter++;
  //     await HiveService.saveStreakCounter('meditation_streak', streakCounter);
  //     await HiveService.saveDailySessionDone(
  //         'meditation_done', dailySessionDone);
  //   }
  // }
}
