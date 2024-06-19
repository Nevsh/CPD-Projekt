import 'package:cpd_project/config/assets.dart';
import 'package:cpd_project/models/meditation_timer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks/mocks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late MeditationTimerModel meditationTimerModel;
  late MockReviewModel mockReviewModel;
  late MockAudioPlayer mockAudioPlayer;

  setUp(() {
    mockReviewModel = MockReviewModel();
    mockAudioPlayer = MockAudioPlayer();
    meditationTimerModel = MeditationTimerModel(audioPlayer: mockAudioPlayer);
  });

  group('MeditationTimerModel Tests', () {
    test('initial values are correct', () {
      expect(meditationTimerModel.time, isNull);
      expect(meditationTimerModel.timeInSec, 0);
      expect(meditationTimerModel.maxTime, 0);
      expect(meditationTimerModel.timer, isNull);
      expect(meditationTimerModel.durationList, [1, 3, 5, 10, 15, 30]);
    });

    test('timerSet sets correct values', () {
      meditationTimerModel.timerSet(5);
      expect(meditationTimerModel.time, 5);
      expect(meditationTimerModel.timeInSec, 300);
      expect(meditationTimerModel.maxTime, 300);
    });

    test('resetTimer resets the timer', () {
      meditationTimerModel.timerSet(5);
      meditationTimerModel.resetTimer();
      expect(meditationTimerModel.timeInSec, meditationTimerModel.maxTime);
    });

    test('stopTimer cancels the timer and resets', () {
      meditationTimerModel.timerSet(5);
      meditationTimerModel.startTimer(mockReviewModel);
      meditationTimerModel.stopTimer();
      expect(meditationTimerModel.timer, isNull);
      expect(meditationTimerModel.timeInSec, meditationTimerModel.maxTime);
    });

    test('calcTimeProgress returns correct progress', () {
      meditationTimerModel.timerSet(5);
      meditationTimerModel.timeInSec = 150;
      expect(meditationTimerModel.calcTimeProgress(), 0.5);
    });

    test('formatTime formats time correctly', () {
      expect(meditationTimerModel.formatTime(3661), '1:01:01');
      expect(meditationTimerModel.formatTime(61), '01:01');
      expect(meditationTimerModel.formatTime(59), '00:59');
    });

    test('startTimer counts down', () async {
      meditationTimerModel.timerSet(1);
      meditationTimerModel.startTimer(mockReviewModel);

      await Future.delayed(const Duration(seconds: 1));

      expect(meditationTimerModel.timeInSec, lessThan(60));
      expect(meditationTimerModel.timer, isNotNull);
    });

    test('startTimer sets medDailySessionDone to true if time is up', () async {
      meditationTimerModel.timeInSec = 1;
      meditationTimerModel.startTimer(mockReviewModel);

      await Future.delayed(const Duration(seconds: 1));

      expect(meditationTimerModel.timeInSec, 0);
      expect(meditationTimerModel.timer, isNull);
      verify(mockAudioPlayer.play(Assets.bellSound)).called(1);
      verify(mockReviewModel.medDailySessionDone = true).called(1);
    });
  });
}
