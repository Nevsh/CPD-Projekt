import 'package:cpd_project/widgets/streak_overview_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/exercise_model.dart';
import '../models/meditation_timer_model.dart';
import '../models/pomodoro_timer_model.dart';
import '../models/review_model.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final medModel = Provider.of<MeditationTimerModel>(context);
    final pomModel = Provider.of<PomodoroTimerModel>(context);
    final exModel = Provider.of<ExerciseModel>(context);

    final String formattedDate =
        DateFormat("dd.MM.yyyy").format(DateTime.now());

    return Consumer<ReviewModel>(
      builder: (context, revModel, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 24),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Review",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[800]),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(16),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black12,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Center(
                                child: Text(
                                  "How was your day?",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: TransparentImageButton(
                                    imagePath: "assets/sad_96.png",
                                    onPressed: () =>
                                        revModel.setChosenMood("sad"),
                                    mood: "sad",
                                    reviewModel: revModel,
                                  ),
                                ),
                                Flexible(
                                  child: TransparentImageButton(
                                    imagePath: "assets/not_good_96.png",
                                    onPressed: () =>
                                        revModel.setChosenMood("not_good"),
                                    mood: "not_good",
                                    reviewModel: revModel,
                                  ),
                                ),
                                Flexible(
                                  child: TransparentImageButton(
                                    imagePath: "assets/neutral_96.png",
                                    onPressed: () =>
                                        revModel.setChosenMood("neutral"),
                                    mood: "neutral",
                                    reviewModel: revModel,
                                  ),
                                ),
                                Flexible(
                                  child: TransparentImageButton(
                                    imagePath: "assets/good_96.png",
                                    onPressed: () =>
                                        revModel.setChosenMood("good"),
                                    mood: "good",
                                    reviewModel: revModel,
                                  ),
                                ),
                                Flexible(
                                  child: TransparentImageButton(
                                    imagePath: "assets/happy_96.png",
                                    onPressed: () =>
                                        revModel.setChosenMood("happy"),
                                    mood: "happy",
                                    reviewModel: revModel,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Note",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: TextField(
                        controller: revModel.textController,
                        style: const TextStyle(fontSize: 18),
                        maxLength: 20,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          // border: ,
                          hintText: "E.g. today's highlight",
                          hintStyle: TextStyle(color: Colors.deepPurple[300]),
                          suffixIcon: IconButton(
                            onPressed: () {
                              revModel.textController.clear();
                            },
                            icon: const Icon(Icons.clear_rounded),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          revModel.userNote = revModel.textController.text;
                          revModel.savedMood = revModel.mood;
                          if (revModel.mood != "empty") {
                            revModel.setDailySessionDone();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple[600]!),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Today",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[800]),
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Completed",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple),
                            ),
                          ),
                          Text(formattedDate),
                        ],
                      ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              createIcon(context, "assets/meditation_80.png",
                                  medModel.dailySessionDone),
                              createIcon(context, "assets/pomodoro_80.png",
                                  pomModel.dailySessionDone),
                              createIcon(context, "assets/exercise_80.png",
                                  exModel.dailySessionDone),
                              createIcon(context, "assets/review_80.png",
                                  revModel.dailySessionDone),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Review",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Note",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      Text(
                                        revModel.userNote,
                                        style: const TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Image.asset(
                                  "assets/${revModel.savedMood}_96.png",
                                  // height: 60,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransparentImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final String mood;
  final ReviewModel reviewModel;

  const TransparentImageButton({
    super.key,
    required this.imagePath,
    required this.onPressed,
    required this.mood,
    required this.reviewModel,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        maximumSize: Size(MediaQuery.of(context).size.width / 6,
            MediaQuery.of(context).size.width / 6),
        padding: EdgeInsets.zero, // Removes default padding
        backgroundColor: Colors.transparent, // Makes button transparent
        // primary: Colors.transparent, // Ensures no overlay color
      ),
      onPressed: onPressed,
      child: reviewModel.mood == mood
          ? Image.asset(imagePath)
          : Opacity(
              opacity: 0.6,
              child: Image.asset(imagePath),
            ),
    );
  }
}
