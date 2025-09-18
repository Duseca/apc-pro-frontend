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
    return dialogBoxBody(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  row_widget(
                    iconSize: 15,
                    icon: Assets.imagesClock,
                    title: 'Log new work experience',
                    texSize: 11,
                    fontFamily: AppFonts.gilroyMedium,
                  ),
                  MyText(
                    paddingTop: 4,
                    text: '1h',
                    size: 16,
                    weight: FontWeight.bold,
                    paddingBottom: 5,
                  ),
                  MyText(
                    text: '17h this week',
                    size: 11,
                    fontFamily: AppFonts.gilroyMedium,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  row_widget(
                    iconSize: 15,
                    icon: Assets.imagesClock,
                    title: 'Quiz Progress',
                    texSize: 11,
                    fontFamily: AppFonts.gilroyMedium,
                  ),
                  MyText(
                    paddingTop: 4,
                    text: '2',
                    size: 16,
                    weight: FontWeight.bold,
                    paddingBottom: 5,
                  ),
                  MyText(
                    text: '2 day streak',
                    size: 11,
                    fontFamily: AppFonts.gilroyMedium,
                  )
                ],
              )
            ],
          ),
          MyText(
            text: 'Recent Progress',
            size: 18,
            weight: FontWeight.bold,
            paddingTop: 9,
            paddingBottom: 12,
          ),
          checkbox_row(
            title: 'Completed Module 3 Assessment',
          ),
          SizedBox(
            height: 10,
          ),
          checkbox_row(
            title: 'Updated Case Study Section 2',
          ),
          SizedBox(
            height: 10,
          ),
          checkbox_row(
            title: 'Logged 3 diary entries this week',
          ),
          MyText(
            text: 'Next: Complete Technical Competency Review',
            size: 12,
            paddingBottom: 10,
            paddingTop: 10,
          ),
          MyText(
            text: 'Today’s Recommendations',
            size: 18,
            weight: FontWeight.bold,
            paddingBottom: 12,
          ),
          MyBullet(
              point:
                  'Focus on Ethics and Professional Standards this week - it’s your strongest area'),
          MyBullet(point: 'Schedule 30 mins for diary reflection today'),
          MyBullet(
              point:
                  "Review Contract Administration materials before tomorrow's quiz"),
          CustomeContainer(
            mtop: 20,
            radius: 8,
            hpad: 14,
            vpad: 12,
            borderColor: kblueBorder2,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                row_widget(
                  icon: Assets.imagesBulb,
                  iconSize: 18,
                  title: 'Insight',
                  weight: FontWeight.bold,
                  texSize: 14,
                ),
                MyText(
                  paddingTop: 4,
                  text:
                      "You're making excellent progress, Your consistent study streak of 2 days shows real dedication. Keep focusing on your quantity surveying competencies - you're 75% complete with your APC journey",
                  size: 11,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
