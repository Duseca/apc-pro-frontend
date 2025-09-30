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
        SimpleDropDown(
          label: "RICS Pathway",
          hint: "Select your RICS pathway",
          items: ["Pathway 1", "Pathway 2", "Pathway 3","Select your RICS pathway"],
          value: 'Select your RICS pathway',
          onChanged: (val) {},
          hasInfo: true,
      
        ),
        SizedBox(height: 24,),
              SimpleDropDown(
          label: "Region",
          hint: "Select your region",
          items: ["Region 1", "Region 2", "Region 3","Select your region"],
          value: 'Select your region',
          onChanged: (val) {},
       
        ),
         SizedBox(height: 24,),
              SimpleDropDown(
          label: "Country",
          hint: "Select your country",
          items: ["Country 1", "Country 2", "Country 3","Select your country"],
          value: "Select your country",
          onChanged: (val) {},
           hasInfo: true,
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
