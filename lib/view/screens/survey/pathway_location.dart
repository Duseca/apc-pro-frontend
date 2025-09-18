import 'dart:developer';

import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PathwayLocation extends StatelessWidget {
  const PathwayLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SurveyController>();

    return Column(
      children: [
        CustomDropdown2(
          label: "RICS Pathway",
          hint: "Select your RICS pathway",
          items: ["Pathway 1", "Pathway 2", "Pathway 3"],
          value: null,
          onChanged: (val) {},
          onInfoTap: () {},
        ),
        SizedBox(height: 24,),
              CustomDropdown2(
          label: "Region",
          hint: "Select your region",
          items: ["Region 1", "Region 2", "Region 3"],
          value: null,
          onChanged: (val) {},
          onInfoTap: () {},
        ),
         SizedBox(height: 24,),
              CustomDropdown2(
          label: "Country",
          hint: "Select your country",
          items: ["Country 1", "Country 2", "Country 3"],
          value: null,
          onChanged: (val) {},
          onInfoTap: () {},
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
