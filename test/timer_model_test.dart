import 'package:cpd_project/models/meditation_timer_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MeditationTimerModel Tests', () {
    late MeditationTimerModel meditationTimer;

    setUp(() {
      meditationTimer = MeditationTimerModel();
    });

    test('timerSet sets the correct values', () {
      meditationTimer.timerSet(5);
      expect(meditationTimer.timeInSec, 5 * 60);
      expect(meditationTimer.maxTime, 5 * 60);
    });

    test('startTimer decreases timeInSec correctly', () async {
      meditationTimer.timerSet(1);
      meditationTimer.startTimer();

      await Future.delayed(const Duration(seconds: 1));
      expect(meditationTimer.timeInSec, lessThan(60));
    });

    test('stopTimer resets timer when reset is true', () {
      meditationTimer.timerSet(1);
      meditationTimer.startTimer();
      meditationTimer.stopTimer(reset: true);

      expect(meditationTimer.timeInSec, meditationTimer.maxTime);
      expect(meditationTimer.timer?.isActive, isFalse);
    });

    test('stopTimer stops timer without resetting when reset is false',
        () async {
      meditationTimer.timerSet(1);
      meditationTimer.startTimer();
      await Future.delayed(const Duration(seconds: 1));
      meditationTimer.stopTimer(reset: false);

      expect(meditationTimer.timeInSec, lessThan(meditationTimer.maxTime));
      expect(meditationTimer.timer?.isActive, isFalse);
    });

    test('formatTime formats time correctly', () {
      expect(meditationTimer.formatTime(0), '00:00');
      expect(meditationTimer.formatTime(59), '00:59');
      expect(meditationTimer.formatTime(60), '01:00');
      expect(meditationTimer.formatTime(61), '01:01');
      expect(meditationTimer.formatTime(300), '05:00');
      expect(meditationTimer.formatTime(599), '09:59');
      expect(meditationTimer.formatTime(600), '10:00');
      expect(meditationTimer.formatTime(601), '10:01');
      expect(meditationTimer.formatTime(900), '15:00');
      expect(meditationTimer.formatTime(1800), '30:00');
    });
  });
}
