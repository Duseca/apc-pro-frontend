import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/screens/home/test_quiz/custom_quiz/custom_quiz_advanced.dart';
import 'package:apc_pro/view/screens/home/test_quiz/custom_quiz/custom_quiz_competency.dart';
import 'package:apc_pro/view/screens/home/test_quiz/custom_quiz/custom_quiz_settings.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/range_slider.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCustomQuiz extends StatelessWidget {
  const CreateCustomQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = [
      "Basic",
      'Competencies',
      'Settings',
      'Advanced'
    ];
    final List<Widget> tabContents = [
      CustomQuizBasic(),
      CustomQuizCompetency(),
      CustomQuizSettings(),
      CustomQuizAdvanced()
    ];

    final RxInt currentIndex = 0.obs;
    return Scaffold(
        backgroundColor: kbackground,
        appBar: simpleAppBar(
            context: context, title: 'Create Custom Quiz', centerTitle: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomeContainer(
                      radius: 20,
                      borderColor: kblueBorder2,
                      color: kblackfill,
                      vpad: 11,
                      hpad: 12,
                      mbott: 20,
                      mtop: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Column(
                                children: [
                                  TabsWidget(
                                    height: 43,
                                    margin: 2,
                                    bgColor: ktransparent,
                                    textSize: 11,
                                    items: _tabs,
                                    currentindex: currentIndex.value,
                                    ontap: (p0) {
                                      currentIndex.value = p0;
                                    },
                                  ),
                                  tabContents[currentIndex.value],
                                  SizedBox(height: 20,)
                                ],
                              ),
                            ),
                          ]))
                ],
              ),
            ),
          ],
        ));
  }
}

class CustomQuizBasic extends StatelessWidget {
  const CustomQuizBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Quiz Details',
          size: 16,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 20,
        ),
        MyTextField(
          label: 'Quiz Name*',
          hint: 'Enter quiz name',
          marginBottom: 22,
          bordercolor: ksecondary,
        ),
        MyTextField(
          label: 'Description',
          hint: 'Describe the purpose and focus of this quiz',
          maxLines: 3,
          bordercolor: ksecondary,
        ),
        MyText(
          text: 'Number of questions',
          size: 12,
          fontFamily: AppFonts.gilroyMedium,
          paddingBottom: 9,
        ),
        QuestionSilder(),
        MyText(
          paddingTop: 20,
          text: 'Time Limit (mins)',
          size: 12,
          fontFamily: AppFonts.gilroyMedium,
          paddingBottom: 9,
        ),
        QuestionSilder(),
        MyButton(
          buttonText: 'Continue',
          mTop: 40,
        ),
      ],
    );
  }
}
