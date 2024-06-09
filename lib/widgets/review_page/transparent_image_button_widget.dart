import 'package:flutter/material.dart';

import '../../models/review_model.dart';

class TransparentImageButtonWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final String mood;
  final ReviewModel reviewModel;

  const TransparentImageButtonWidget({
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
        maximumSize: Size(
          MediaQuery.of(context).size.width / 6,
          MediaQuery.of(context).size.width / 6,
        ),
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
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
