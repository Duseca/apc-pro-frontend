import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/survey_controller.dart';

class SurveyMain extends StatefulWidget {
  const SurveyMain({super.key});

  @override
  State<SurveyMain> createState() => _SurveyMainState();
}

class _SurveyMainState extends State<SurveyMain> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SurveyController>();

    return Scaffold(
      appBar: simpleAppBar(context: context, haveBackButton: false),
      body: Obx(() {
        final currentIndex = controller.currentStep.value;
        final step = controller.stepsData[currentIndex];
        final String title = step['title'] as String;
        final String desc = step['Desc'] as String;
        final Widget bodyWidget = step['body'] as Widget;
        final bool isLastStep = currentIndex == controller.stepsData.length - 1;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
  children: [
    Obx(() {
      final total = controller.stepsData.length;
      final current = controller.currentStep.value;

      return Row(
        children: List.generate(total, (index) {
          final isActive = index <= current; // show white for passed/current
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.white : getTertiary(context),
            ),
          );
        }),
      );
    }),
    const SizedBox(width: 10),
    MyText(
      text: controller.currentStep.value ==
              controller.stepsData.length - 1
          ? 'Review Profile'
          : '${controller.currentStep.value + 1} of ${controller.stepsData.length}',
      color: getTertiary(context),
      fontFamily: AppFonts.gilroySemiBold,
      size: 13,
    ),
  ],
),

                  
                  if (!isLastStep)
                    GestureDetector(
                      onTap: () {
                        // Optional: Skip to last step
                        controller.currentStep.value =
                            controller.stepsData.length - 1;
                        _pageController.jumpToPage(
                            controller.stepsData.length - 1);
                      },
                      child: MyText(
                        text: 'Skip',
                        color: getTertiary(context),
                        fontFamily: AppFonts.gilroyMedium,
                        size: 13,
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 20),

              // ===== Body Content =====
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TwoTextedColumn(
                        text1: title,
                        text2: desc,
                        size2: 12,
                        size1: 20,
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
