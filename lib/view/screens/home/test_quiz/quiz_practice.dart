import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizPractice extends StatelessWidget {
  const QuizPractice({super.key});

  @override
  Widget build(BuildContext context) {
    final List checkPoints = [
      'Compliance with RICS professional standards and ethical guidelines',
      'Minimum legal requirements without additional professional obligations',
      'Individual decision-making without consultation',
      'Cost minimization as the primary consideration'
    ];
    final List<String> quizTags = [
      'Ethics, Rules of Conduct and Professionalism',
      'Hard',
      '3pts',
    ];
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Quiz Practice', centerTitle: true),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 20,
              ),
              ExpandedRow(
                text1: 'Progress',
                text2: '10%',
                size1: 12,
                size2: 12,
                fontFamily2: AppFonts.gilroyMedium,
              ),
              SizedBox(
                height: 9,
              ),
              linearProgressIndicatorr(),
              CustomeContainer(
                radius: 10,
                borderColor: kblueBorder2,
                color: kblackfill,
                vpad: 17,
                hpad: 13,
                mbott: 20,
                mtop: 22,
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: 'Questions',
                      size: 14,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 10,
                    ),
                    NumberGrid()
                  ],
                ),
              ),
              Row(
                children: [
                  row_widget(
                    title: '12:12',
                    icon: Assets.imagesTimer,
                    iconSize: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  buttonContainer(
                    onTap: () {
                      SuccessDialog.showSuccessDialog('Quiz Paused', context,
                          message:
                              'Your progress has been saved. You can resume anytime',
                          image: Assets.imagesPause2,
                          hasSecbutton: true,
                          ButtonText: 'Resume Quiz ',
                          button2text: 'Exit Quiz',
                          bgColor: kbackground,
                          twoButtonsInColumn: true,
                          imgSize: 64);
                    },
                    text: 'Pause',
                    txtColor: Color(0xff03709F),
                    borderColor: Color(0xff03709F),
                    radius: 4,
                    vPadding: 3,
                    hPadding: 8,
                    bgColor: kbackground,
                  ),
                  Spacer(),
                  MyText(
                    text: 'Skip',
                    size: 14,
                    fontFamily: AppFonts.gilroyMedium,
                  )
                ],
              ),
              CustomeContainer(
                radius: 10,
                borderColor: kblueBorder2,
                color: kblackfill,
                vpad: 17,
                hpad: 13,
                mbott: 20,
                mtop: 12,
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: quizTags.map((tag) {
                        return TagsWidget(tag);
                      }).toList(),
                    ),
                    MyText(
                      paddingTop: 10,
                      text:
                          'Critically assess the long-term impacts of Ethics, Rules of Conduct and Professionalism strategies',
                      size: 16,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 10,
                    ),
                    ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: checkPoints.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: CustomeContainer(
                                radius: 10,
                                borderColor: kblueBorder2,
                                color: kblackfill,
                                vpad: 17,
                                hpad: 14,
                                mbott: 23,
                                widget: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CustomCheckBox(
                                            isActive: true,
                                            onTap: () {},
                                            iscircle: true,
                                            iconColor: kblueBorder2,
                                            borderColor: kblueBorder2,
                                            selectedColor: kbackground,
                                            unSelectedColor: kbackground,
                                            size: 13,
                                            circleIconsize: 10,
                                          ),
                                          Expanded(
                                            child: MyText(
                                              text: checkPoints[index],
                                              size: 11,
                                              fontFamily: AppFonts.gilroyMedium,
                                              paddingLeft: 8,
                                            ),
                                          )
                                        ],
                                      )
                                    ])));
                      },
                    ),
                  ],
                ),
              ),
              Row(
                spacing: 20,
                children: [
                  Expanded(
                      child: MyButton(
                    backgroundColor: klighblue,
                    fontColor: ksecondary,
                    buttonText: 'Back',
                    onTap: () {
                      Get.back();
                    },
                  )),
                  Expanded(
                      child: MyButton(
                    buttonText: 'Next',
                  ))
                ],
              )
            ],
          ))
        ]));
  }
}

class NumberGrid extends StatefulWidget {
  const NumberGrid({super.key});

  @override
  State<NumberGrid> createState() => _NumberGridState();
}

class _NumberGridState extends State<NumberGrid> {
  final RxInt selectedIndex = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 55,
      ),
      itemBuilder: (context, index) {
        return Obx(() {
          final number = index + 1;
          final isSelected = selectedIndex.value == index;
          return Bounce(
            onTap: () => selectedIndex.value = index,
            child: CustomeContainer(
              radius: 6,
              borderColor: kblueBorder4,
              color: isSelected ? ksecondary : Color(0xff477DCC),
              vpad: 10,
              hpad: 10,
              widget: Center(child: MyText(text: number.toString())),
            ),
          );
        });
      },
    );
  }
}
