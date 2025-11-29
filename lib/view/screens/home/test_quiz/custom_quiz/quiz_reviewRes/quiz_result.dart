import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizResult extends StatelessWidget {
  const QuizResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
          context: context, title: 'Quiz Results', centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            children: [
              Center(
                child: row_widget(
                  title: 'Completed',
                  texSize: 14,
                  icon: Assets.imagesTick,
                  iconColor: getSecondaryColor(context),
                  textColor: getSecondaryColor(context),
                  iconSize: 17,
                ),
              ),
              CustomeContainer(
                mtop: 25,
                color: getfillcolor(context),
                radius: 8,
                widget: Column(
                  children: [
                    TwoTextedColumn(
                      text1: 'APC Professional Ethics Assessment',
                      text2: 'Completed on Oct 16, 2025 at 2:30 PM',
                      size1: 18,
                      size2: 14,
                      fontFamily: AppFonts.gilroyBold,
                      color2: getTertiary(context),
                      align: TextAlign.center,
                      alignment: ColumnAlignment.center,
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TwoTextedColumn(
                      text1: '12/15',
                      text2: '80%',
                      size1: 30,
                      size2: 22,
                      fontFamily: AppFonts.gilroyBold,
                      fontFamily2: AppFonts.gilroyBold,
                      align: TextAlign.center,
                      alignment: ColumnAlignment.center,
                      maxLines: 4,
                    ),
                    MyText(
                      text: 'Time taken: 8 minutes 32 seconds',
                      color: getTertiary(context),
                      weight: FontWeight.w600,
                      paddingBottom: 12,
                      paddingTop: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomeContainer(
                          color: getfifth(context),
                          radius: 50,
                          vpad: 4,
                          hpad: 8,
                          widget: row_widget(
                            title: 'Passed',
                            texSize: 14,
                            icon: Assets.imagesTick,
                            iconColor: getSecondaryColor(context),
                            textColor: getSecondaryColor(context),
                            iconSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                mbott: 16,
              ),
              CustomeContainer(
                radius: 8,
                color: getfillcolor(context),
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: 'Topic Performance',
                      size: 18,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 15,
                    ),
                    ExpandedRow(
                      text1: 'Professional Ethics',
                      text2: '4/5 (80%)',
                      color1: getSecondaryColor(context),
                      color2: getSecondaryColor(context),
                      fontFamily2: AppFonts.gilroyBold,
                      fontFamily: AppFonts.gilroyBold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    linearProgressIndicatorr(
                      height: 6,
                      value: 0.67,
                      bgColor: getfifth(context),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ExpandedRow(
                      text1: 'Communication Standards',
                      text2: '5/5 (100%)',
                      color1: getSecondaryColor(context),
                      color2: getSecondaryColor(context),
                      fontFamily2: AppFonts.gilroyBold,
                      fontFamily: AppFonts.gilroyBold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    linearProgressIndicatorr(
                      height: 6,
                      value: 0.67,
                      bgColor: getfifth(context),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ExpandedRow(
                      text1: 'Stakeholder Management',
                      text2: '3/5 (60%)',
                      color1: getSecondaryColor(context),
                      color2: getSecondaryColor(context),
                      fontFamily2: AppFonts.gilroyBold,
                      fontFamily: AppFonts.gilroyBold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    linearProgressIndicatorr(
                      height: 6,
                      value: 0.67,
                      bgColor: getfifth(context),
                    ),
                  ],
                ),
                mbott: 16,
              ),
              CustomeContainer(
                radius: 8,
                color: getfillcolor(context),
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: 'Question Summary',
                      size: 18,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TwoTextedColumn(
                          text1: '15',
                          text2: 'Total Questions',
                          size1: 22,
                          size2: 11.5,
                          fontFamily: AppFonts.gilroyBold,
                          color2: getTertiary(context),
                          alignment: ColumnAlignment.center,
                          align: TextAlign.center,
                        ),
                        TwoTextedColumn(
                          text1: '12',
                          text2: 'Correct',
                          size1: 22,
                          size2: 11.5,
                          fontFamily: AppFonts.gilroyBold,
                          color2: getTertiary(context),
                          alignment: ColumnAlignment.center,
                          align: TextAlign.center,
                        ),
                        TwoTextedColumn(
                          text1: '3',
                          text2: 'Incorrect',
                          size1: 22,
                          color1: kred,
                          size2: 11.5,
                          fontFamily: AppFonts.gilroyBold,
                          color2: getTertiary(context),
                          alignment: ColumnAlignment.center,
                          align: TextAlign.center,
                        )
                      ],
                    )
                  ],
                ),
                mbott: 16,
              ),
              MyButton(
                buttonText: 'Review All Questions',
                mBottom: 12,
              ),
              MyButton(
                buttonText: 'Review Incorrect Only',
                backgroundColor: getfillcolor(context),
                fontColor: getSecondaryColor(context),
                mBottom: 12,
              ),
              MyButton(
                buttonText: 'Retake Quiz',
                backgroundColor: getfillcolor(context),
                fontColor: getSecondaryColor(context),
                mBottom: 12,
              ),
              Center(
                child: row_widget(
                  title: 'Share to LinkedIn',
                  icon: Assets.imagesLinkedin,
                  iconSize: 16,
                  fontFamily: AppFonts.gilroySemiBold,
                  iconColor: getSecondaryColor(context),
                ),
              ),
              CustomeContainer(
                mbott: 12,
                radius: 8,
                color: getfillcolor(context),
                widget: MyText(
                  text:
                      'v"I just completed the APC Professional Ethics Assessment with an 80% score!"',
                  fontStyle: FontStyle.italic,
                ),
              ),
              MyButton(
                mTop: 12,
                buttonText: 'Back to Learning Path',
                backgroundColor: getfillcolor(context),
                fontColor: getSecondaryColor(context),
                mBottom: 12,
              ),
              MyText(
                text: 'View Similar Quizzes',
                size: 16,
                weight: FontWeight.w500,
                textAlign: TextAlign.center,
              )
            ],
          ))
        ],
      ),
    );
  }
}
