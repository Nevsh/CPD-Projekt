import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
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
    );
  }
}
