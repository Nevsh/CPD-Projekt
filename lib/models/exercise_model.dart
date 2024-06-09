import 'dart:async';
import 'dart:math';

import 'package:cpd_project/models/timer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class ExerciseModel extends TimerModel {
  String _userInput = '';
  String _randomExercise = 'Exercise';
  int? _numOfCycles;
  bool _reminderIsActivated = false;
  final List<String> _exerciseList = [];
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
      notifyListeners();
    }
  }

  void removeExercise(int index) {
    _exerciseList.removeAt(index);
    notifyListeners();
  }

  @override
  bool inputIsSet() {
    return time != null && _numOfCycles != null;
  }

  @override
  Future<void> startTimer({bool reset = true}) async {
    final completer = Completer<void>();

    timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      if (timeInSec > 0) {
        timeInSec--;
      } else {
        generateRandomExercise();
        dailySessionDone = true;
        FlutterRingtonePlayer().playNotification();
        stopTimer(reset: reset);
        completer.complete(); // Signalisiert das Ende des Timers
      }
      notifyListeners();
    });

    return completer.future;
  }

  void startReminder() async {
    if (_numOfCycles != null) {
      for (int i = 0; i < _numOfCycles!; i++) {
        await startTimer();
      }
    }
    _reminderIsActivated = false;
  }
}
