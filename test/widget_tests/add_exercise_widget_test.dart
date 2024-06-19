import 'package:cpd_project/audio_player/audio_player_impl.dart';
import 'package:cpd_project/models/exercise_model.dart';
import 'package:cpd_project/widgets/exercise_page/add_exercise_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('AddExerciseWidget Tests', () {
    testWidgets('Add exercise button adds exercise to list',
        (WidgetTester tester) async {
      final exerciseModel =
          ExerciseModel(audioPlayer: AudioPlayerImpl()); // Mock or real model

      await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: exerciseModel,
          child: const MaterialApp(
            home: Scaffold(body: AddExerciseWidget()),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('E.g. push-ups'), findsOneWidget);
    });
  });
}
