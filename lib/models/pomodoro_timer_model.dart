import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cpd_project/models/review_model.dart';
import 'package:cpd_project/models/timer_model.dart';

import '../config/assets.dart';

class PomodoroTimerModel extends TimerModel {
  int _breakTime = 0;
  int _timeSelected = 0;
  bool _focusSessionDone = false;
  // int _session = 0;
  final List<int> _durationList = const [25, 50, 90];
  final List<int> _breakDurationList = const [5, 10, 20];

  @override
  List<int> get durationList => _durationList;
  List<int> get breakDurationList => _breakDurationList;
  int get breakTime => _breakTime;
  int get timeSelected => _timeSelected;
  bool get focusSessionDone => _focusSessionDone;
  // int get session => _session;

  @override
  void timerSet(int? selectedTime) {
    if (selectedTime is int) {
      time = selectedTime;
      timeInSec = selectedTime * 60;
      maxTime = selectedTime * 60;
      _timeSelected = selectedTime * 60;
      if (selectedTime == durationList[0]) {
        _breakTime = _breakDurationList[0] * 60;
      } else if (selectedTime == durationList[1]) {
        _breakTime = _breakDurationList[1] * 60;
      } else {
        _breakTime = _breakDurationList[2] * 60;
      }
      _focusSessionDone = false;
      stopTimer();
      notifyListeners();
    }
  }

  @override
  void startTimer(ReviewModel revModel) {
    notifyListeners();
    // timer = Timer.periodic(const Duration(seconds: 1), (_) {
    timer = Timer.periodic(const Duration(milliseconds: 1), (_) {
      if (timeInSec > 0) {
        timeInSec--;
        if (timeInSec == 0) {
          audioPlayer.play(AssetSource(Assets.doneSound));
          // context.read<ReviewModel>().pomDailySessionDone = true;
          revModel.pomDailySessionDone = true;
          // ac.pomDailySessionDone = true;
          // saveModelData();
          // dailySessionDone = true;
          if (_focusSessionDone) {
            stopTimer(reset: false);
            maxTime = _timeSelected;
          } else {
            _focusSessionDone = true;
            timeInSec = _breakTime;
            maxTime = _breakTime;
            revModel.updatePomSessions();
            // _session++;
          }
        }
      }
      notifyListeners();
    });
  }

  @override
  void resetTimer() {
    if (focusSessionDone) {
      _focusSessionDone = false;
      maxTime = _timeSelected;
    }
    timeInSec = maxTime;
    notifyListeners();
  }

  // void loadModelData() async {
  //   streakCounter = await HiveService.getStreakCounter('pomodoro_streak');
  //   dailySessionDone = await HiveService.getDailySessionDone('pomodoro_done');
  //   notifyListeners();
  // }
  //
  // void saveModelData() async {
  //   if (!dailySessionDone) {
  //     streakCounter++;
  //     await HiveService.saveStreakCounter('pomodoro_streak', streakCounter);
  //     await HiveService.saveDailySessionDone('pomodoro_done', dailySessionDone);
  //   }
  // }
}
