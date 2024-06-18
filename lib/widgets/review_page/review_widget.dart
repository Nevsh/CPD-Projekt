import 'package:cpd_project/config/assets.dart';
import 'package:cpd_project/config/headings.dart';
import 'package:cpd_project/widgets/input_and_submit/input_field.dart';
import 'package:cpd_project/widgets/input_and_submit/submit_button.dart';
import 'package:cpd_project/widgets/review_page/transparent_image_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/palette.dart';
import '../../models/review_model.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final revModel = Provider.of<ReviewModel>(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Palette.revSubContainer1Color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Palette.revSubContainer2Color,
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                heading(
                  'How was your day?',
                  mainHeading,
                  Palette.revMoodHeadingColor,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: TransparentImageButtonWidget(
                        imagePath: Assets.sadImg,
                        onPressed: () => revModel.setChosenMood('sad'),
                        mood: 'sad',
                        reviewModel: revModel,
                      ),
                    ),
                    Flexible(
                      child: TransparentImageButtonWidget(
                        imagePath: Assets.notGoodImg,
                        onPressed: () => revModel.setChosenMood('not_good'),
                        mood: 'not_good',
                        reviewModel: revModel,
                      ),
                    ),
                    Flexible(
                      child: TransparentImageButtonWidget(
                        imagePath: Assets.neutralImg,
                        onPressed: () => revModel.setChosenMood('neutral'),
                        mood: 'neutral',
                        reviewModel: revModel,
                      ),
                    ),
                    Flexible(
                      child: TransparentImageButtonWidget(
                        imagePath: Assets.goodImg,
                        onPressed: () => revModel.setChosenMood('good'),
                        mood: 'good',
                        reviewModel: revModel,
                      ),
                    ),
                    Flexible(
                      child: TransparentImageButtonWidget(
                        imagePath: Assets.happyImg,
                        onPressed: () => revModel.setChosenMood('happy'),
                        mood: 'happy',
                        reviewModel: revModel,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          heading('Note', subHeading1, Palette.revSubHeading1Color),
          InputField(
            controller: revModel.textController,
            hintText: 'E.g. today\'s highlight',
            hintColor: Palette.revTextFieldHintColor,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: SubmitButton(
              color: Palette.revButtonColor,
              text: 'Save',
              action: () {
                revModel.saveReview(
                  revModel.chosenMood,
                  revModel.textController.text,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
