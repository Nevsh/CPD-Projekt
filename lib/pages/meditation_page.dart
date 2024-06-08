import 'package:cpd_project/widgets/timer_wigets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meditation_timer_model.dart';
import '../widgets/timer_dropdown_widget.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MeditationTimerModel>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.teal[200],
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                  ],
                  value: value.time,
                  onChanged: value.timerSet,
                  hintText: 'Choose duration: ',
                  icon: const Icon(Icons.watch_later_outlined),
                ),
              ),
            ),
            createTimer(context, value, false),
            createButton(value, Colors.teal[600]),
          ],
        ),
      ),
    );
  }
}
