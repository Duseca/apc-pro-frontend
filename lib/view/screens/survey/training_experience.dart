import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/toolTip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingExperience extends StatelessWidget {
  const TrainingExperience({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SurveyController>();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: checkbox_row(
                title: 'I have structured training agreement',
              ),
            ),
            TooltipIcon()
          ],
        ),
        SizedBox(
          height: 24,
        ),
        MyTextField(
          hint: 'Enter the name of your employer',
          label: 'Current Employer',
          marginBottom: 26,
        ),
        MyTextField(
          hint: 'Your current role or title',
          label: 'Job Title',
          marginBottom: 26,
        ),
        SimpleDropDown(
          hasInfo: false,
          label: "Years of experience",
          hint: "Select Years of experience",
          items: [
            "0-1 years",
            "1-2 years",
            "2-3 years",
            "3-5 years",
            'Select Years of experience'
          ],
          value: 'Select Years of experience',
          onChanged: (val) {},
        ),
        SizedBox(
          height: 25,
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
        )
      ],
    );
  }
}
