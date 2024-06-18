import 'package:cpd_project/config/headings.dart';
import 'package:cpd_project/widgets/input_and_submit/input_field.dart';
import 'package:cpd_project/widgets/input_and_submit/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/palette.dart';
import '../../models/exercise_model.dart';

class AddExerciseWidget extends StatelessWidget {
  const AddExerciseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final exModel = Provider.of<ExerciseModel>(context);
    final scrollController = ScrollController();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Palette.exSubContainer1Color,
        borderRadius: BorderRadius.circular(16),
      ),
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputField(
            controller: exModel.textController,
            hintText: 'E.g. push-ups',
            hintColor: Palette.exTextFieldHintColor,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: SubmitButton(
              color: Palette.exButtonColor,
              text: 'Add',
              action: () {
                exModel.addExercise(
                  exModel.textController.text,
                );
              },
            ),
          ),
          const SizedBox(height: 6),
          heading('Exercise List', subHeading1, Palette.exSubHeadingColor),
          const SizedBox(height: 6),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Palette.exListBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              width: MediaQuery.of(context).size.width,
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                controller: scrollController,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: exModel.exerciseList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Palette.exListDividerColor),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            exModel.exerciseList[index],
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: exModel.reminderIsActivated == false
                                ? () {
                                    exModel.removeExercise(index);
                                  }
                                : null,
                            icon: exModel.reminderIsActivated == false
                                ? const Icon(Icons.clear_rounded)
                                : const Opacity(
                                    opacity: 0.6,
                                    child: Icon(Icons.clear_rounded)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
