import 'package:cpd_project/audio_player/audio_player_impl.dart';
import 'package:cpd_project/config/palette.dart';
import 'package:cpd_project/models/pomodoro_timer_model.dart';
import 'package:cpd_project/models/review_model.dart';
import 'package:cpd_project/pages/pomodoro_page.dart';
import 'package:cpd_project/widgets/app_bar/custom_app_bar.dart';
import 'package:cpd_project/widgets/timer/timer_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('PomodoroPage Widget Tests', () {
    testWidgets('PomodoroPage displays correctly', (WidgetTester tester) async {
      final pomModel = PomodoroTimerModel(audioPlayer: AudioPlayerImpl());
      final revModel = ReviewModel();

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<PomodoroTimerModel>.value(value: pomModel),
            ChangeNotifierProvider<ReviewModel>.value(value: revModel),
          ],
          child: const MaterialApp(
            home: PomodoroPage(),
          ),
        ),
      );

      final Scaffold scaffold = tester.widget(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Palette.pomPageBackgroundColor);

      expect(find.byType(CustomAppBar), findsOneWidget);

      expect(find.byType(TimerDropdown), findsOneWidget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      expect(find.byType(ElevatedButton), findsWidgets);

      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    });

    testWidgets('Dropdown changes value', (WidgetTester tester) async {
      final pomModel = PomodoroTimerModel(audioPlayer: AudioPlayerImpl());
      final reviewModel = ReviewModel();

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => pomModel),
            ChangeNotifierProvider(create: (_) => reviewModel),
          ],
          child: const MaterialApp(
            home: PomodoroPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(pomModel.time, equals(null));

      expect(find.text('Choose duration: work / break '), findsOneWidget);

      await tester.tap(find.byType(DropdownButton<int>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('25 / 5 min'));
      await tester.pumpAndSettle();

      expect(pomModel.time, equals(25));

      expect(find.text('Choose duration: work / break '), findsNothing);
      expect(find.text('25 / 5 min'), findsOneWidget);
    });
  });
}
