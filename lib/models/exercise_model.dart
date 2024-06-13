import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:cpd_project/models/review_model.dart';
import 'package:cpd_project/models/timer_model.dart';
import 'package:flutter/material.dart';

import '../config/assets.dart';
import '../data/hive_service.dart';

class ExerciseModel extends TimerModel {
  String _userInput = '';
  String _randomExercise = 'Exercise';
  int? _numOfCycles;
  bool _reminderIsActivated = false;
  List<String> _exerciseList = [];
  final TextEditingController _textController = TextEditingController();
  final List<int> _durationList = const [1, 3, 5, 10, 15, 30, 45, 60, 90, 120];
  final List<int> _cyclesList = const [1, 2, 3, 4, 5];

  @override
  List<int> get durationList => _durationList;
  List<int> get cyclesList => _cyclesList;

  String get userInput => _userInput;
  String get randomExercise => _randomExercise;
  int? get numOfCycles => _numOfCycles;
  bool get reminderIsActivated => _reminderIsActivated;
  List<String> get exerciseList => _exerciseList;
  TextEditingController get textController => _textController;

  set userInput(String note) {
    if (note.isNotEmpty) {
      _userInput = note;
      notifyListeners();
    }
  }

  set numOfCycles(int? cycles) {
    if (cycles is int) {
      _numOfCycles = cycles;
      notifyListeners();
    }
  }

  set reminderIsActivated(bool switchState) {
    _reminderIsActivated = switchState;
    notifyListeners();
  }

  void generateRandomExercise() {
    _randomExercise = _exerciseList[Random().nextInt(_exerciseList.length)];
  }

  void addExercise(String exercise) {
    if (exercise.isNotEmpty) {
      _exerciseList.add(exercise);
      saveExercises();
      notifyListeners();
    }
  }

  void removeExercise(int index) {
    _exerciseList.removeAt(index);
    saveExercises();
    notifyListeners();
  }

  @override
  bool inputIsSet() {
    return time != null && _numOfCycles != null;
  }

  @override
  Future<void> startTimer(ReviewModel revModel, {bool reset = true}) async {
    final completer = Completer<void>();

    timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      // timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timeInSec > 0) {
        timeInSec--;
      } else {
        generateRandomExercise();
        // saveModelData();
        // dailySessionDone = true;
        audioPlayer.play(AssetSource(Assets.reminder_sound));
        revModel.exDailySessionDone = true;
        // context.read<ReviewModel>().exDailySessionDone = true;
        stopTimer(reset: reset);
        completer.complete(); // Signalisiert das Ende des Timers
      }
      notifyListeners();
    });

    return completer.future;
  }

  void startReminder(ReviewModel revModel) async {
    if (_numOfCycles != null) {
      for (int i = 0; i < _numOfCycles!; i++) {
        await startTimer(revModel);
      }
    }
    _reminderIsActivated = false;
  }

  // void loadModelData() async {
  //   streakCounter = await HiveService.getStreakCounter('exercise_streak');
  //   dailySessionDone = await HiveService.getDailySessionDone('exercise_done');
  //   notifyListeners();
  // }
  //
  // void saveModelData() async {
  //   if (!dailySessionDone) {
  //     streakCounter++;
  //     await HiveService.saveStreakCounter('exercise_streak', streakCounter);
  //     await HiveService.saveDailySessionDone('exercise_done', dailySessionDone);
  //   }
  // }

  void loadExercises() async {
    _exerciseList = await HiveService.getExerciseList();
    notifyListeners();
  }

  void saveExercises() async {
    await HiveService.saveExerciseList(_exerciseList);
  }
}
