import 'package:cpd_project/config/headings.dart';
import 'package:cpd_project/widgets/review_page/transparent_image_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/review_model.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final revModel = Provider.of<ReviewModel>(context);

    return Container(
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
                  heading('How was your day?', mainHeading, Colors.white),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: TransparentImageButtonWidget(
                          imagePath: 'assets/sad_96.png',
                          onPressed: () => revModel.setChosenMood('sad'),
                          mood: 'sad',
                          reviewModel: revModel,
                        ),
                      ),
                      Flexible(
                        child: TransparentImageButtonWidget(
                          imagePath: 'assets/not_good_96.png',
                          onPressed: () => revModel.setChosenMood('not_good'),
                          mood: 'not_good',
                          reviewModel: revModel,
                        ),
                      ),
                      Flexible(
                        child: TransparentImageButtonWidget(
                          imagePath: 'assets/neutral_96.png',
                          onPressed: () => revModel.setChosenMood('neutral'),
                          mood: 'neutral',
                          reviewModel: revModel,
                        ),
                      ),
                      Flexible(
                        child: TransparentImageButtonWidget(
                          imagePath: 'assets/good_96.png',
                          onPressed: () => revModel.setChosenMood('good'),
                          mood: 'good',
                          reviewModel: revModel,
                        ),
                      ),
                      Flexible(
                        child: TransparentImageButtonWidget(
                          imagePath: 'assets/happy_96.png',
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
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Note',
              style: TextStyle(
                  fontSize: 24,
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
                hintText: 'E.g. today\'s highlight',
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
                revModel.saveReview(
                    revModel.chosenMood, revModel.textController.text);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurple[600]!),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
