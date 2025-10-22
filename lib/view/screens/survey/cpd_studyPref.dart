import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CpdStudypref extends StatelessWidget {
  const CpdStudypref({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SurveyController>();
    List cpd = [
      'Visual Learning (e.g., charts, infographics)',
      'Audio Learning (e.g., podcasts, recorded lectures)',
      'Reading/Writing (e.g., notes, articles)',
      'Hands-on Practice (learning by doing)',
      'Group Study (interactive learning with peers)',
      'Individual Study (solo focus)',
      'Mobile Learning (on-the-go study via phone)',
      'Desktop Learning (at a desk with a computer)'
    ];

    List learning = [
      'Self-paced',
      'Structured Timeline',
      'Interactive Content',
      'Written Guides',
      'Practice Exercises',
      'Structured Timeline',
      'Video Tutorials',
      'Live Sessions',
      'Practice Exercises',
      'Case Studies',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextField2(
          label: 'Current CPD Hours *',
          hint: 'Enter your total completed CPD hours so far.',
        ),
        MyText(
          paddingTop: 5,
          text: 'Study Preferences *',
          size: 16,
          weight: FontWeight.bold,
          paddingBottom: 5,
        ),
        MyText(
          text: 'How do you prefer to take in information?',
          size: 12,
          weight: FontWeight.w400,
          paddingBottom: 16,
        ),
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cpd.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: checkbox_row(title: cpd[index]),
            );
          },
        ),
        SizedBox(
          height: 25,
        ),
        MyTextField2(
          label: 'Weekly Study Time Commitment',
          hint: 'How many hours can you commit to studying each week?',
        ),
        MyText(
          paddingTop: 10,
          text: 'Learning Style',
          size: 16,
          weight: FontWeight.bold,
          paddingBottom: 5,
        ),
        MyText(
          text: 'How do you prefer to learn?',
          size: 12,
          weight: FontWeight.w400,
          paddingBottom: 16,
        ),
        GridView.builder(
          itemCount: learning.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 24),
          itemBuilder: (context, index) {
            return checkbox_row(
              title: learning[index],
            );
          },
        ),
        Row(
          spacing: 25,
          children: [
            Expanded(
              child: MyButton(
                mTop: 30,
                backgroundColor: klighblue,
                fontColor: ksecondary,
                buttonText: 'Back',
                onTap: () {
                  controller.previousStep();
                },
              ),
            ),
            Expanded(
              child: MyButton(
                mTop: 30,
                buttonText: 'Continue',
                onTap: () {
                  controller.nextStep();
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
