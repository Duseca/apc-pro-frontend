import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/screens/survey/training_experience.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CpdStudypref extends StatelessWidget {
  const CpdStudypref({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<SurveyController>();
    List cpd = [
      'Videos',
      'Articles & Documents',
      'Interactive Modules',
      'Webinars & Live Sessions',
    ];

    List learning = [
      'Visual Learning',
      'Audio Learning',
      'Reading',
      'Hands-on Practice',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TwoTextedColumn(
          text1: 'CPD Time Commitment',
          text2:
              'Tell us about your current CPD requirements and available study time',
          color2: getTertiary(context),
          size1: 12,
          size2: 12,
          fontFamily: AppFonts.gilroySemiBold,
        ),
        SizedBox(
          height: 15,
        ),
        MyTextField2(
          label: 'Current CPD Hours Completed',
          hint: 'e.g. 35 hours ',
        ),
        MyTextField2(
          label: 'Weekly Study Time Commitment',
          hint: 'How many hours can you commit to studying each week?',
        ),
        MyText(
          paddingTop: 5,
          text: 'Preferred Study Schedule',
          size: 14,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 5,
        ),
        training_container(
          title: 'Weekdays',
          desc: 'Monday to Friday during work hours or evenings',
        ),
        training_container(
          title: 'Weekends',
          desc: 'Saturday and Sunday for dedicated study time',
        ),
        training_container(
          title: 'Flexible',
          desc: 'Mixed schedule based on availability',
        ),
        MyText(
          paddingTop: 5,
          text: 'Study Preferences',
          size: 14,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 3,
        ),
        MyText(
          text: 'Share your learning style and content preferences',
          fontFamily: AppFonts.gilroyMedium,
          size: 12,
          color: getTertiary(context),
          paddingBottom: 10,
        ),
        MyText(
          text: 'Learning Style Preferences (Select all that apply)',
          size: 12,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 14,
        ),
        GridView.builder(
          itemCount: learning.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 42),
          itemBuilder: (context, index) {
            return CustomeContainer(
              color: getfillcolor(context),
              vpad: 10,
              hpad: 10,
              radius: 8,
              widget: checkbox_row(
                title: learning[index],
                tSize: 11,
              ),
            );
          },
        ),
        MyText(
          text: 'Preferred Content Formats (Select all that apply)',
          size: 12,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 15,
          paddingTop: 15,
        ),
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cpd.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: CustomeContainer(
                  color: getfillcolor(context),
                  vpad: 10,
                  hpad: 10,
                  radius: 8,
                  widget: checkbox_row(title: cpd[index])),
            );
          },
        ),
        MyText(
          paddingTop: 15,
          text: 'Study Pace Preference',
          size: 12,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 15,
        ),
        training_container(
          title: 'Self-paced',
          desc: 'Learn at your own speed and schedule',
        ),
        training_container(
          title: 'Structured',
          desc: 'Follow a guided timeline with milestones',
        ),
        training_container(
          title: 'Intensive',
          desc: 'Fast-track learning with concentrated sessions',
        ),
        MyText(
          paddingTop: 5,
          text: 'Support Needs',
          size: 14,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 5,
        ),
        MyText(
          text:
              'Tell us about your preferred learning support and collaboration style',
          fontFamily: AppFonts.gilroyMedium,
          size: 12,
          paddingTop: 5,
          paddingBottom: 15,
        ),
        MyText(
          text: 'Peer Collaboration Preferences',
          size: 12,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 14,
        ),
        training_container(
          title: 'Group Learning',
          desc: 'Enjoy collaborative learning and group discussions',
        ),
        training_container(
          title: 'Peer Learning',
          desc: 'Prefer one-on-one or small group interactions',
        ),
        training_container(
          title: 'Individual Learning',
          desc: 'Prefer to learn independently without collaboration',
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Bounce(
                onTap: () {
                  controller.previousStep();
                },
                child: Image.asset(
                  isDarkMode
                      ? Assets.imagesBackbutton
                      : Assets.imagesBackbutton2,
                  width: 48,
                  height: 45,
                )),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: MyButton(
                backgroundColor: getSecondaryColor(context).withOpacity(0.1),
                buttonText: 'Continue',
                fontColor: getTertiary(context),
                onTap: () {
                  controller.nextStep();
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
