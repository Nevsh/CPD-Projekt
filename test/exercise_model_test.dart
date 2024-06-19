import 'package:cpd_project/config/assets.dart';
import 'package:cpd_project/models/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks/mocks.dart';

void main() {
  late ExerciseModel exerciseModel;
  late MockReviewModel mockReviewModel;
  late MockAudioPlayer mockAudioPlayer;

  setUp(() {
    mockReviewModel = MockReviewModel();
    mockAudioPlayer = MockAudioPlayer();
    exerciseModel = ExerciseModel(audioPlayer: mockAudioPlayer);
  });

  group('ExerciseModel Tests', () {
    test('initial values are correct', () {
      expect(exerciseModel.userInput, '');
      expect(exerciseModel.randomExercise, 'Exercise');
      expect(exerciseModel.numOfCycles, isNull);
      expect(exerciseModel.reminderIsActivated, false);
      expect(exerciseModel.exerciseList, []);
      expect(exerciseModel.textController, isA<TextEditingController>());
      expect(
          exerciseModel.durationList, [1, 3, 5, 10, 15, 30, 45, 60, 90, 120]);
      expect(exerciseModel.cyclesList, [1, 2, 3, 4, 5]);
    });

    test('timerSet sets correct values', () {
      exerciseModel.timerSet(5);
      expect(exerciseModel.time, 5);
      expect(exerciseModel.timeInSec, 300);
      expect(exerciseModel.maxTime, 300);
    });

    test('resetTimer resets the timer', () {
      exerciseModel.timerSet(5);
      exerciseModel.resetTimer();
      expect(exerciseModel.timeInSec, exerciseModel.maxTime);
    });

    test('stopTimer cancels the timer and resets', () {
      exerciseModel.timerSet(5);
      exerciseModel.startTimer(mockReviewModel);
      exerciseModel.stopTimer();
      expect(exerciseModel.timer, isNull);
      expect(exerciseModel.timeInSec, exerciseModel.maxTime);
    });

    test('userInput setter updates value and notifies listeners', () {
      bool notified = false;
      exerciseModel.addListener(() {
        notified = true;
      });
      exerciseModel.userInput = 'push-ups';
      expect(exerciseModel.userInput, 'push-ups');
      expect(notified, true);
    });

    test('numOfCycles setter updates value and notifies listeners', () {
      bool notified = false;
      exerciseModel.addListener(() {
        notified = true;
      });
      exerciseModel.numOfCycles = 3;
      expect(exerciseModel.numOfCycles, 3);
      expect(notified, true);
    });

    test('reminderIsActivated setter updates value and notifies listeners', () {
      bool notified = false;
      exerciseModel.addListener(() {
        notified = true;
      });
      exerciseModel.reminderIsActivated = true;
      expect(exerciseModel.reminderIsActivated, true);
      expect(notified, true);
    });

    test('generateRandomExercise updates randomExercise', () {
      exerciseModel.exerciseList.add('push-ups');
      exerciseModel.exerciseList.add('pull-ups');
      exerciseModel.generateRandomExercise();
      expect(exerciseModel.exerciseList.contains(exerciseModel.randomExercise),
          true);
    });

    test('addExercise adds exercise and saves it', () {
      exerciseModel.exerciseList.add('push-ups');
      expect(exerciseModel.exerciseList, ['push-ups']);
    });

    test('removeExercise removes exercise and saves it', () {
      exerciseModel.exerciseList.add('Jumping Jacks');
      exerciseModel.exerciseList.removeAt(0);
      expect(exerciseModel.exerciseList, []);
    });

    test('startTimer runs and completes correctly', () async {
      exerciseModel.exerciseList.add('push-ups');
      exerciseModel.exerciseList.add('pull-ups');
      exerciseModel.timeInSec = 1;
      await exerciseModel.startTimer(mockReviewModel);
      expect(exerciseModel.timeInSec, 0);
      verify(mockAudioPlayer.play(Assets.reminderSound)).called(1);
      verify(mockReviewModel.exDailySessionDone = true).called(1);
    });

    test('startReminder runs multiple cycles correctly', () async {
      exerciseModel.exerciseList.add('push-ups');
      exerciseModel.exerciseList.add('pull-ups');
      exerciseModel.numOfCycles = 2;
      exerciseModel.timeInSec = 1;
      exerciseModel.startReminder(mockReviewModel);
      expect(exerciseModel.reminderIsActivated, false);
    });
  });
}
