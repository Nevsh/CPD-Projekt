import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cpd_project/config/assets.dart';
import 'package:cpd_project/models/review_model.dart';
import 'package:cpd_project/models/timer_model.dart';
import 'package:flutter/foundation.dart';

class MeditationTimerModel extends TimerModel {
  final List<int> _durationList = const [1, 3, 5, 10, 15, 30];

  @override
  List<int> get durationList => _durationList;

  @override
  void startTimer(ReviewModel revModel) {
    notifyListeners();
    timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      if (timeInSec > 0) {
        timeInSec--;
        if (timeInSec == 0) {
          if (kIsWeb) {
            print('Ist Web');
          } else {
            print('Nicht Web');
          }
          audioPlayer.play(
            AssetSource(Assets.bellSound),
          );
          revModel.medDailySessionDone = true;
          stopTimer(reset: false);
        }
      }
      notifyListeners();
    });
  }
}
