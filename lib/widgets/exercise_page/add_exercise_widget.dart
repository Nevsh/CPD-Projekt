import 'package:cpd_project/config/headings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/exercise_model.dart';

class AddExerciseWidget extends StatelessWidget {
  const AddExerciseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final exModel = Provider.of<ExerciseModel>(context);

    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(16),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: TextField(
                controller: exModel.textController,
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
                  hintText: 'E.g. push-ups',
                  hintStyle: TextStyle(color: Colors.blueGrey[300]),
                  suffixIcon: IconButton(
                    onPressed: () {
                      exModel.textController.clear();
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
                  exModel.addExercise(exModel.textController.text);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey[600]!),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            heading('Exercise List', subHeading1, Colors.blueGrey[600]),
            const SizedBox(height: 6),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                width: MediaQuery.of(context).size.width,
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  child: ListView.builder(
                    itemCount: exModel.exerciseList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black26),
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
      ),
    );
  }
}
