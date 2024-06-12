import 'package:cpd_project/config/headings.dart';
import 'package:cpd_project/widgets/app_bar/custom_app_bar.dart';
import 'package:cpd_project/widgets/exercise_page/add_exercise_widget.dart';
import 'package:cpd_project/widgets/exercise_page/random_exercise_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/exercise_model.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseModel>(
      builder: (context, exModel, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.indigo[300],
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading('Add Exercise', mainHeading, Colors.indigo[800]),
              const SizedBox(height: 10),
              const AddExerciseWidget(),
              const SizedBox(height: 10),
              heading('Random Exercise', mainHeading, Colors.indigo[800]),
              const SizedBox(height: 10),
              const RandomExerciseWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
