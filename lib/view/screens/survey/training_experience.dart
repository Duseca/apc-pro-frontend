import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/toolTip.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingExperience extends StatelessWidget {
  const TrainingExperience({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<SurveyController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: checkbox_row(
                title: 'I have structured training agreement',
              ),
            ),
            TooltipIcon()
          ],
        ),
        SizedBox(
          height: 24,
        ),
        TwoTextedColumn(
          text1: 'Current Employment',
          text2: 'Tell us about your current professional situation',
          size1: 14,
          size2: 12,
          fontFamily: AppFonts.gilroySemiBold,
          color2: getTertiary(context),
        ),
        SizedBox(
          height: 24,
        ),
        MyTextField2(
          hint: 'Enter the name of your employer',
          label: 'Current Employer',
          filledColor: getfillcolor(context),
        ),
        MyTextField2(
          hint: 'Your current role or title',
          label: 'Job Title',
          filledColor: getfillcolor(context),
        ),
        Row(
          spacing: 20,
          children: [
            Expanded(
              child: CustomDropDown(
                //  //hasInfo: false,
                label: "Years of experience",
                hint: "Select",
                items: [
                  "0-1 years",
                  "1-2 years",
                  "2-3 years",
                  "3-5 years",
                  'Select'
                ],
                value: 'Select',
                onChanged: (val) {},
              ),
            ),
            Expanded(
              child: CustomDropDown(
                //  //hasInfo: false,
                label: "Employment Type",
                hint: "Select",
                items: ["Full Time", "Part Time", "Mixed", 'Select'],
                value: 'Select',
                onChanged: (val) {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TwoTextedColumn(
          text1: 'Experience Level Assessment',
          text2:
              'Help us understand your current capabilities and areas for development',
          size1: 14,
          size2: 12,
          fontFamily: AppFonts.gilroySemiBold,
          color2: getTertiary(context),
        ),
        MyText(
          text: 'Overall Experience Level',
          fontFamily: AppFonts.gilroyMedium,
          size: 14,
          paddingTop: 5,
          paddingBottom: 10,
        ),
        training_container(),
         training_container(
          title: 'Intermediate',
          desc: 'Some experience but looking to advance skills',
         ),
          training_container(
              title: 'Experienced',
          desc: 'Established professional seeking specialization',
          ),
        SizedBox(
          height: 25,
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
        )
      ],
    );

  }
}

class training_container extends StatelessWidget {
  final String? title,desc;
  const training_container({
    super.key, this.title, this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      vpad: 11,
      hpad: 11,
      mbott: 8,
      color: getfillcolor(context),
      widget: Row(
        children: [
          CustomCheckBox(
            isActive: true,
            size: 15,
            circleIconsize: 15,
            onTap: () {
              // setState(() {
              //   isExpanded = !isExpanded;
              // });
            },
            iscircle: true,
            iconColor: getSecondaryColor(context),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text:title?? 'APC Candidate?',
                  fontFamily: AppFonts.gilroySemiBold,
                  size: 14,
                  paddingBottom: 3,
                ),
                MyText(
                  text:desc?? 'Working towards APC qualification',
                  size: 13,
                  color: Colors.grey,
                  paddingTop: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
