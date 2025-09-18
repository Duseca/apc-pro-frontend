import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/survey_controller.dart';

class SurveyMain extends StatelessWidget {
  const SurveyMain({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SurveyController>();

    return Scaffold(
      appBar: simpleAppBar(context: context, haveBackButton: false),
      backgroundColor: kbackground,
      body: Obx(() {
        final step = controller.stepsData[controller.currentStep.value];
        final String title = step['title'] as String;
        final String desc = step['Desc'] as String;
        final Widget bodyWidget = step['body'] as Widget;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: List.generate(
                  controller.stepsData.length,
                  (index) {
                    final bool isCompleted =
                        index < controller.currentStep.value;
                    final bool isActive = index == controller.currentStep.value;

                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(4),
                          backgroundColor: kgrey,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            isCompleted || isActive ? ksecondary : kgrey,
                          ),
                          value: isCompleted ? 1 : (isActive ? 1 : 0),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TwoTextedColumn(
                        text1: title,
                        text2: desc,
                        size2: 16,
                        size1: 22,
                        weight1: FontWeight.bold,
                      ),
                      const SizedBox(height: 20),
                      bodyWidget,
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
