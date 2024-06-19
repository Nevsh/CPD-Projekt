import 'package:cpd_project/config/assets.dart';
import 'package:cpd_project/models/pomodoro_timer_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks/mocks.dart';

void main() {
  late PomodoroTimerModel pomodoroTimerModel;
  late MockReviewModel mockReviewModel;
  late MockAudioPlayer mockAudioPlayer;

  setUp(() {
    mockReviewModel = MockReviewModel();
    mockAudioPlayer = MockAudioPlayer();
    pomodoroTimerModel = PomodoroTimerModel(audioPlayer: mockAudioPlayer);
  });

  group('PomodoroTimerModel Tests', () {
    test('initial values are correct', () {
      expect(pomodoroTimerModel.time, isNull);
      expect(pomodoroTimerModel.timeInSec, 0);
      expect(pomodoroTimerModel.maxTime, 0);
      expect(pomodoroTimerModel.timer, isNull);
      expect(pomodoroTimerModel.breakTime, 0);
      expect(pomodoroTimerModel.timeSelected, 0);
      expect(pomodoroTimerModel.focusSessionDone, false);
      expect(pomodoroTimerModel.durationList, [25, 50, 90]);
      expect(pomodoroTimerModel.breakDurationList, [5, 10, 20]);
    });

    test('timerSet sets correct values', () {
      pomodoroTimerModel.timerSet(25);
      expect(pomodoroTimerModel.time, 25);
      expect(pomodoroTimerModel.timeInSec, 25 * 60);
      expect(pomodoroTimerModel.maxTime, 25 * 60);
      expect(pomodoroTimerModel.timeSelected, 25 * 60);
      expect(pomodoroTimerModel.breakTime, 5 * 60);
      expect(pomodoroTimerModel.focusSessionDone, false);
    });

    test('resetTimer resets the timer', () {
      pomodoroTimerModel.timerSet(25);
      pomodoroTimerModel.startTimer(mockReviewModel);
      pomodoroTimerModel.resetTimer();
      expect(pomodoroTimerModel.timeInSec, pomodoroTimerModel.maxTime);
    });

    test('stopTimer cancels the timer and resets', () {
      pomodoroTimerModel.timerSet(25);
      pomodoroTimerModel.startTimer(mockReviewModel);
      pomodoroTimerModel.stopTimer();
      expect(pomodoroTimerModel.timer, isNull);
      expect(pomodoroTimerModel.timeInSec, pomodoroTimerModel.maxTime);
    });

    test('calcTimeProgress returns correct progress', () {
      pomodoroTimerModel.timerSet(25);
      pomodoroTimerModel.timeInSec = 750;
      expect(pomodoroTimerModel.calcTimeProgress(), 0.5);
    });

    test('formatTime formats time correctly', () {
      expect(pomodoroTimerModel.formatTime(3661), '1:01:01');
      expect(pomodoroTimerModel.formatTime(61), '01:01');
      expect(pomodoroTimerModel.formatTime(59), '00:59');
    });

    test('startTimer runs correctly and handles session completion', () async {
      pomodoroTimerModel.timerSet(25);
      pomodoroTimerModel.timeInSec = 1;
      pomodoroTimerModel.startTimer(mockReviewModel);

      // when work phase finishes and work phase starts
      expect(pomodoroTimerModel.focusSessionDone, false);
      await Future.delayed(const Duration(seconds: 1));
      expect(pomodoroTimerModel.focusSessionDone, true);
      verify(mockReviewModel.pomDailySessionDone = true).called(1);
      verify(mockReviewModel.updatePomSessions()).called(1);

      // when break phase finishes
      pomodoroTimerModel.timeInSec = 1;
      await Future.delayed(const Duration(seconds: 1));
      verify(mockAudioPlayer.play(Assets.doneSound)).called(2);
      expect(pomodoroTimerModel.timer, isNull);
      expect(pomodoroTimerModel.maxTime, pomodoroTimerModel.timeSelected);
    });

    test('resetTimer resets the timer correctly', () {
      pomodoroTimerModel.timerSet(25);
      pomodoroTimerModel.startTimer(mockReviewModel);
      pomodoroTimerModel.resetTimer();

      expect(pomodoroTimerModel.timeInSec, pomodoroTimerModel.maxTime);
      expect(pomodoroTimerModel.focusSessionDone, false);
      expect(pomodoroTimerModel.timer, isNotNull);
    });
  });
}
