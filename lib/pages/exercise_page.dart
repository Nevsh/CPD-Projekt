import 'package:cpd_project/widgets/timer_dropdown_widget.dart';
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
        backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(
          scrolledUnderElevation: 0,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Add Exercise",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
                ),
              ),
              Flexible(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            // border: ,
                            hintText: "E.g. push-ups",
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
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey[600]!),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Exercise List",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[600]),
                      ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        exModel.exerciseList[index],
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          exModel.removeExercise(index);
                                        },
                                        icon: const Icon(Icons.clear_rounded),
                                      ),
                                    ],
                                  ),
                                  // dense: true,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "Random Exercise",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(16),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reminder",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[600]),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                left: 3,
                                right: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                exModel.formatTime(exModel.timeInSec),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Switch(
                              // activeColor: Colors.red,
                              activeTrackColor: Colors.green,
                              inactiveTrackColor: Colors.grey[600],
                              inactiveThumbColor: exModel.inputIsSet()
                                  ? Colors.white
                                  : Colors.grey,
                              value: exModel.reminderIsActivated,
                              onChanged: !exModel.inputIsSet() ||
                                      exModel.exerciseList.isEmpty
                                  ? null
                                  : (switchState) {
                                      exModel.reminderIsActivated = switchState;
                                      if (exModel.reminderIsActivated) {
                                        // exModel.startTimer();
                                        exModel.startReminder();
                                      } else {
                                        exModel.stopTimer();
                                      }
                                    },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Expanded(
                          child: TimerDropdown(
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text('1 min'),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text('3 min'),
                              ),
                              DropdownMenuItem(
                                value: 5,
                                child: Text('5 min'),
                              ),
                              DropdownMenuItem(
                                value: 10,
                                child: Text('10 min'),
                              ),
                              DropdownMenuItem(
                                value: 15,
                                child: Text('15 min'),
                              ),
                              DropdownMenuItem(
                                value: 30,
                                child: Text('30 min'),
                              ),
                              DropdownMenuItem(
                                value: 45,
                                child: Text('45 min'),
                              ),
                              DropdownMenuItem(
                                value: 60,
                                child: Text('60 min'),
                              ),
                              DropdownMenuItem(
                                value: 90,
                                child: Text('90 min'),
                              ),
                              DropdownMenuItem(
                                value: 120,
                                child: Text('120 min'),
                              ),
                            ],
                            value: exModel.time,
                            onChanged: exModel.timerSet,
                            hintText: "Duration: ",
                            icon: const Icon(Icons.watch_later_outlined),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TimerDropdown(
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text('1 cycle'),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text('2 cycles'),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text('3 cycles'),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text('4 cycles'),
                              ),
                              DropdownMenuItem(
                                value: 5,
                                child: Text('5 cycles'),
                              ),
                            ],
                            value: exModel.numOfCycles,
                            onChanged: (int? cycles) {
                              exModel.numOfCycles = cycles;
                            },
                            hintText: "Cycles: ",
                            icon: const Icon(Icons.refresh_rounded),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height / 12,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          exModel.randomExercise,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
