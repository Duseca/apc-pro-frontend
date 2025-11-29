import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/test_quiz/custom_quiz/quiz_reviewRes/quiz_result.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizReview extends StatelessWidget {
  const QuizReview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      'To control all communication channels',
      'To facilitate clear and timely information exchange',
      'To limit stakeholder access to project details',
      'To delegate all communication to team members'
    ];
    RxInt selectedOption = (-1).obs;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: simpleAppBar(context: context, title: ' Quiz Review', actions: [
          buttonContainer(
            vPadding: 1,
            hPadding: 5,
            radius: 8,
            text: 'Show Incorrect Only',
            bgColor: getfillcolor(context),
          )
        ]),
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
                    radius: 8,
                    vpad: 16,
                    hpad: 16,
                    color: getfillcolor(context),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: MyText(
                              text: 'Question 3 of 15',
                              size: 14,
                            )),
                            Row(
                              spacing: 8,
                              children: [
                                Bounce(
                                    child: Image.asset(
                                  isDarkMode
                                      ? Assets.imagesButtonleft
                                      : Assets.imagesButtonleftL,
                                  width: 32,
                                )),
                                Bounce(
                                    child: Image.asset(
                                  isDarkMode
                                      ? Assets.imagesButtonright
                                      : Assets.imagesButtonrightL,
                                  width: 32,
                                ))
                              ],
                            )
                          ],
                        ),
                        linearProgressIndicatorr(
                          height: 6,
                        )
                      ],
                    ),
                    mbott: 16,
                  ),
                  CustomeContainer(
                      radius: 8,
                      vpad: 16,
                      hpad: 16,
                      color: getfillcolor(context),
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: MyText(
                                  text: 'Question 3',
                                  fontFamily: AppFonts.gilroyBold,
                                  size: 18,
                                )),
                                buttonContainer(
                                  text: 'Correct',
                                  icon: Icons.check,
                                  iconSize: 16,
                                  radius: 8,
                                  vPadding: 6,
                                  bgColor: getfifth(context),
                                  fontFamily: AppFonts.gilroyMedium,
                                )
                              ],
                            ),
                            MyText(
                              paddingTop: 8,
                              text:
                                  'Which of the following best describes the role of a project manager in stakeholder communication?',
                              size: 14,
                              paddingBottom: 8,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: options.length,
                              itemBuilder: (context, index) {
                                return Obx(() {
                                  return GestureDetector(
                                    onTap: () {
                                      selectedOption.value = index;
                                    },
                                    child: quiz_opt_container(
                                      opt: options[index],
                                      isSelected: selectedOption.value == index,
                                    ),
                                  );
                                });
                              },
                            )
                          ])),
                  CustomeContainer(
                      mbott: 16,
                      mtop: 16,
                      radius: 8,
                      vpad: 16,
                      hpad: 16,
                      color: getfillcolor(context),
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TwoTextedColumn(
                                size1: 16,
                                size2: 14,
                                fontFamily: AppFonts.gilroyBold,
                                text1: 'Explanation',
                                text2:
                                    'Project managers play a crucial role in facilitating communication between stakeholders. They ensure information flows efficiently, clearly, and in a timely manner to all relevant parties. This includes regular updates, managing expectations, and ensuring all stakeholders have access to necessary project information.')
                          ])),
                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                          child: MyButton(
                        backgroundColor: getfillcolor(context),
                        fontColor: getSecondaryColor(context),
                        buttonText: 'Previous Question',
                        fontSize: 14,
                        fontFamily: AppFonts.gilroyMedium,
                      )),
                      Expanded(
                          child: MyButton(
                        buttonText: 'Next Question',
                        fontSize: 14,
                        fontFamily: AppFonts.gilroyMedium,
                      ))
                    ],
                  ),
                  MyText(
                    text: 'Back to Summary',
                    size: 14,
                    textAlign: TextAlign.center,
                    weight: FontWeight.w600,
                    paddingBottom: 15,
                    paddingTop: 15,
                    onTap: () {
                      Get.to(() => const QuizResult());
                    },
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            final isActive = index < 3;

                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: isActive
                                    ? getSecondaryColor(context)
                                    : getfifth(context),
                                child: MyText(
                                  text: '${index + 1}',
                                  size: 14,
                                  fontFamily: AppFonts.gilroyBold,
                                  color: isActive
                                      ? getsplashcolor(context)
                                      : getTertiary(context),
                                ),
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                    mbott: 30,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class quiz_opt_container extends StatelessWidget {
  final String? opt;
  final bool isSelected; // New parameter to check if the option is selected

  const quiz_opt_container({
    super.key,
    this.opt,
    required this.isSelected, // Passing the isSelected state
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      mbott: 12,
      color: getfifth(context), // Change color if selected
      borderColor: isSelected
          ? getSecondaryColor(context)
          : ktransparent, // Border color when selected
      vpad: 16,
      hpad: 14,
      widget: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Show check icon only when selected
          if (isSelected)
            Icon(
              Icons.check_circle,
              color: getSecondaryColor(context),
            ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: DiffTextsTxt(
                text1: 'A.  ',
                text2: opt ?? 'To control all communication channels',
                fontFamily: AppFonts.gilroyBold,
                fontFamily2: AppFonts.gilroyRegular,
                align: TextAlign.start,
                color1: getSecondaryColor(context)),
          )
        ],
      ),
    );
  }
}
