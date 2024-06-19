import 'package:cpd_project/audio_player/audio_player_impl.dart';
import 'package:cpd_project/config/palette.dart';
import 'package:cpd_project/models/meditation_timer_model.dart';
import 'package:cpd_project/models/review_model.dart';
import 'package:cpd_project/pages/meditation_page.dart';
import 'package:cpd_project/widgets/app_bar/custom_app_bar.dart';
import 'package:cpd_project/widgets/timer/timer_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('MeditationPage Widget Tests', () {
    testWidgets('MeditationPage displays correctly',
        (WidgetTester tester) async {
      final medModel = MeditationTimerModel(audioPlayer: AudioPlayerImpl());
      final revModel = ReviewModel();

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<MeditationTimerModel>.value(value: medModel),
            ChangeNotifierProvider<ReviewModel>.value(value: revModel),
          ],
          child: const MaterialApp(
            home: MeditationPage(),
          ),
        ),
      );

      final Scaffold scaffold = tester.widget(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Palette.medPageBackgroundColor);

      expect(find.byType(CustomAppBar), findsOneWidget);

      expect(find.byType(TimerDropdown), findsOneWidget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      expect(find.byType(ElevatedButton), findsWidgets);

      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    });

    testWidgets('TimerDropdown changes value', (WidgetTester tester) async {
      final medModel = MeditationTimerModel(audioPlayer: AudioPlayerImpl());
      final revModel = ReviewModel();

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<MeditationTimerModel>.value(value: medModel),
            ChangeNotifierProvider<ReviewModel>.value(value: revModel),
          ],
          child: const MaterialApp(
            home: MeditationPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(medModel.time, equals(null));

      expect(find.text('Choose duration: '), findsOneWidget);

      await tester.tap(find.byType(DropdownButton<int>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('5 min'));
      await tester.pumpAndSettle();

      expect(medModel.time, equals(5));

      expect(find.text('Choose duration: '), findsNothing);
      expect(find.text('5 min'), findsOneWidget);
    });
  });
}
