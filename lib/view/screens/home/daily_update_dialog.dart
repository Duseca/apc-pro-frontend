import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/bullet_points.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyUpdateDialog extends StatelessWidget {
  const DailyUpdateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return dialogBoxBody(
      innerVpad: 0,
      innerHpad: 0,
      tpad: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomeContainer(
            color: getfillcolor(context),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            widget: Row(
              children: [
                Expanded(
                    child: MyText(
                  text: 'Daily Update',
                  size: 18,
                  weight: FontWeight.bold,
                )),
                Bounce(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      Assets.imagesCross,
                      width: 12,
                      height: 12,
                      color: isDarkMode?kwhite:kblack,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      child: CustomeContainer(
                        color: getfillcolor(context),
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              paddingTop: 4,
                              text: 'Log new work experience',
                              size: 14,
                              fontFamily: AppFonts.gilroySemiBold,
                              paddingBottom: 5,
                            ),
                            MyText(
                              paddingTop: 4,
                              text: '1h',
                              size: 16,
                              fontFamily: AppFonts.gilroyBold,
                              paddingBottom: 5,
                            ),
                            MyText(
                              text: '17h this week',
                              size: 11,
                              fontFamily: AppFonts.gilroyMedium,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomeContainer(
                        color: getfillcolor(context),
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              paddingTop: 4,
                              text: 'Quiz Progress\n',
                              size: 14,
                              fontFamily: AppFonts.gilroySemiBold,
                              paddingBottom: 5,
                            ),
                            MyText(
                              paddingTop: 4,
                              text: '2',
                              size: 16,
                              fontFamily: AppFonts.gilroyBold,
                              paddingBottom: 5,
                            ),
                            MyText(
                              text: '2 day streak',
                              size: 11,
                              fontFamily: AppFonts.gilroyMedium,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                MyText(
                  text: 'Recent Progress',
                  size: 14,
                  fontFamily: AppFonts.gilroySemiBold,
                  paddingTop: 15,
                  paddingBottom: 12,
                ),
                checkbox_row(
                  title: 'Completed Module 3 Assessment',
                  textColor: getTertiary(context),
                ),
                SizedBox(
                  height: 10,
                ),
                checkbox_row(
                  title: 'Updated Case Study Section 2',
                  textColor: getTertiary(context),
                ),
                SizedBox(
                  height: 10,
                ),
                checkbox_row(
                  title: 'Logged 3 diary entries this week',
                  textColor: getTertiary(context),
                ),
                SizedBox(
                  height: 10,
                ),
                checkbox_row(
                  title: 'Next: Complete Technical Competency Review',
                  textColor: getTertiary(context),
                ),
                MyText(
                  paddingTop: 15,
                  text: 'Today’s Recommendations',
                  size: 14,
                  fontFamily: AppFonts.gilroySemiBold,
                  paddingBottom: 12,
                ),
                MyBullet(
                    color: getTertiary(context),
                    point:
                        'Focus on Ethics and Professional Standards this week - it’s your strongest area'),
                MyBullet(
                  point: 'Schedule 30 mins for diary reflection today',
                  color: getTertiary(context),
                ),
                MyBullet(
                  point:
                      "Review Contract Administration materials before tomorrow's quiz",
                  color: getTertiary(context),
                ),
                CustomeContainer(
                  mtop: 20,
                  radius: 8,
                  hpad: 14,
                  vpad: 12,
                  borderColor: getSecondaryColor(context),
                  color: getfillcolor(context),
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      row_widget(
                        icon: Assets.imagesBrain,
                        iconSize: 18,
                        title: 'Progress Insight',
                        fontFamily: AppFonts.gilroySemiBold,
                        iconColor: isDarkMode ? kwhite : null,
                        texSize: 14,
                      ),
                      MyText(
                        paddingTop: 4,
                        text:
                            "Your learning consistency is improving. Keep up the daily progress to maintain momentum and achieve your certification goals.",
                        size: 11,
                        color: getTertiary(context),
                        lineHeight: 1.4,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
