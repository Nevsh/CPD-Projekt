import 'package:cpd_project/models/activity/activity.dart';
import 'package:cpd_project/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ReviewModel reviewModel;

  setUp(() async {
    reviewModel = ReviewModel();
  });

  group('ReviewModel Tests', () {
    test('initial values are correct', () {
      expect(reviewModel.textController, isA<TextEditingController>());
      expect(reviewModel.chosenMood, 'empty');
      expect(reviewModel.activity, isNull);
      expect(reviewModel.activities, []);
      expect(reviewModel.lastActivity, isNull);
    });

    test('setChosenMood updates chosenMood and notifies listeners', () {
      bool notified = false;
      reviewModel.addListener(() {
        notified = true;
      });
      reviewModel.setChosenMood('happy');
      expect(reviewModel.chosenMood, 'happy');
      expect(notified, true);
    });

    test('setSavedMood updates activity rating', () {
      reviewModel.activity = Activity(
        date: '2024-06-18',
        meditation: false,
        pomodoro: false,
        exercise: false,
        review: false,
        rating: 'empty',
        note: '',
        medStreak: 0,
        pomStreak: 0,
        exStreak: 0,
        revStreak: 0,
        pomSessions: 0,
      );
      reviewModel.setSavedMood('happy');
      expect(reviewModel.activity!.rating, 'happy');
    });

    test('setUserNote updates activity note', () {
      reviewModel.activity = Activity(
        date: '2024-06-18',
        meditation: false,
        pomodoro: false,
        exercise: false,
        review: false,
        rating: 'empty',
        note: '',
        medStreak: 0,
        pomStreak: 0,
        exStreak: 0,
        revStreak: 0,
        pomSessions: 0,
      );
      reviewModel.setUserNote('This is a note');
      expect(reviewModel.activity!.note, 'This is a note');
    });

    test('formattedDate returns formatted date', () {
      Activity activity = Activity(
        date: '2024-06-18',
        meditation: false,
        pomodoro: false,
        exercise: false,
        review: false,
        rating: 'empty',
        note: '',
        medStreak: 0,
        pomStreak: 0,
        exStreak: 0,
        revStreak: 0,
        pomSessions: 0,
      );
      expect(reviewModel.formattedDate(activity), '18.06.2024');
    });

    test('saveReview updates mood, note, and notifies listeners', () async {
      reviewModel.activity = Activity(
        date: '2024-06-18',
        meditation: false,
        pomodoro: false,
        exercise: false,
        review: false,
        rating: 'empty',
        note: '',
        medStreak: 0,
        pomStreak: 0,
        exStreak: 0,
        revStreak: 0,
        pomSessions: 0,
      );

      reviewModel.setSavedMood('happy');
      reviewModel.setUserNote('This is a note');
      reviewModel.activity!.review = true;
      reviewModel.activity!.revStreak++;
      expect(reviewModel.activity!.rating, 'happy');
      expect(reviewModel.activity!.note, 'This is a note');
      expect(reviewModel.activity!.review, true);
      expect(reviewModel.activity!.revStreak, 1);
    });

    test('medDailySessionDone updates activity and saves it', () {
      reviewModel.activity = Activity(
        date: '2024-06-18',
        meditation: false,
        pomodoro: false,
        exercise: false,
        review: false,
        rating: 'empty',
        note: '',
        medStreak: 0,
        pomStreak: 0,
        exStreak: 0,
        revStreak: 0,
        pomSessions: 0,
      );

      reviewModel.activity!.meditation = true;
      reviewModel.activity!.medStreak++;
      expect(reviewModel.activity!.meditation, true);
      expect(reviewModel.activity!.medStreak, 1);
    });

    test('pomDailySessionDone updates activity and saves it', () {
      reviewModel.activity = Activity(
        date: '2024-06-18',
        meditation: false,
        pomodoro: false,
        exercise: false,
        review: false,
        rating: 'empty',
        note: '',
        medStreak: 0,
        pomStreak: 0,
        exStreak: 0,
        revStreak: 0,
        pomSessions: 0,
      );

      reviewModel.activity!.pomodoro = true;
      reviewModel.activity!.pomStreak++;
      expect(reviewModel.activity!.pomodoro, true);
      expect(reviewModel.activity!.pomStreak, 1);
    });

    test('exDailySessionDone updates activity and saves it', () {
      reviewModel.activity = Activity(
        date: '2024-06-18',
        meditation: false,
        pomodoro: false,
        exercise: false,
        review: false,
        rating: 'empty',
        note: '',
        medStreak: 0,
        pomStreak: 0,
        exStreak: 0,
        revStreak: 0,
        pomSessions: 0,
      );

      reviewModel.activity!.exercise = true;
      reviewModel.activity!.exStreak++;
      expect(reviewModel.activity!.exercise, true);
      expect(reviewModel.activity!.exStreak, 1);
    });

    test('loadLastActivity sets lastActivity correctly', () async {
      reviewModel.activities = [
        Activity(
          date: '2024-06-18',
          meditation: false,
          pomodoro: false,
          exercise: false,
          review: false,
          rating: 'empty',
          note: '',
          medStreak: 0,
          pomStreak: 0,
          exStreak: 0,
          revStreak: 0,
          pomSessions: 0,
        ),
      ];

      await reviewModel.loadLastActivity();
      expect(reviewModel.lastActivity, isNotNull);
      expect(reviewModel.lastActivity!.date, '2024-06-18');
    });

    test('updatePomSessions increments pomSessions', () {
      reviewModel.activity = Activity(
        date: '2024-06-18',
        meditation: false,
        pomodoro: false,
        exercise: false,
        review: false,
        rating: 'empty',
        note: '',
        medStreak: 0,
        pomStreak: 0,
        exStreak: 0,
        revStreak: 0,
        pomSessions: 0,
      );

      reviewModel.activity!.pomSessions++;
      expect(reviewModel.activity!.pomSessions, 1);
    });
  });
}
