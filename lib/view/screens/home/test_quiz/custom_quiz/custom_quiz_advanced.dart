import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/screens/home/test_quiz/custom_quiz/quiz_reviewRes/quiz_review.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_dropdown.dart';

class CustomQuizAdvanced extends StatelessWidget {
  const CustomQuizAdvanced({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      borderColor: getSecondaryColor(context),
      color: getfillcolor(context),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Advanced Options',
            size: 15,
            fontFamily: AppFonts.gilroyBold,
            paddingBottom: 12,
          ),
          TwoTextedSwitch(),
          SizedBox(
            height: 12,
          ),
          TwoTextedSwitch(
            text1: 'Randomize Options',
            text2: 'Shuffle answer choices',
          ),
          SizedBox(
            height: 12,
          ),
          TwoTextedSwitch(
            text1: 'Allow Review',
            text2: 'Let users review answers before submission',
          ),
          SizedBox(
            height: 20,
          ),
          CustomDropDown(
            label: 'Question Selection Method',
            hint: 'Random Selection',
            items: [
              'Random Selection',
              'Adaptive (AI-powered)',
              'Weighted by difficulty',
              'Sequential Order',
            ],
            bgColor: getfifth(context),
            value: 'Random Selection',
            onChanged: (h) {},
          ),
          MyButton(
            buttonText: 'Save Quiz',
            onTap: () {
              Get.to(QuizReview());
            },
            mTop: 40,
            outlineColor: getSecondaryColor(context),
            backgroundColor: ktransparent,
            fontColor: getSecondaryColor(context),
          ),
        ],
      ),
    );
  }
}

class TwoTextedSwitch extends StatelessWidget {
  final String? text1, text2;
  const TwoTextedSwitch({
    super.key,
    this.text1,
    this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TwoTextedColumn(
          text1: text1 ?? 'Randomize Questions',
          text2: text2 ?? 'Show questions in random order',
          size1: 14,
          size2: 11,
          fontFamily2: AppFonts.gilroyMedium,
          fontFamily: AppFonts.gilroyBold,
          color2: getTertiary(context),
        )),
        SizedBox(
          width: 10,
        ),
        SwitchButton(
          scale: 0.8,
          isActive: true,
        ),
      ],
    );
  }
}
