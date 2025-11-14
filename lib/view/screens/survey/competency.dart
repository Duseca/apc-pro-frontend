import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Competency extends StatelessWidget {
  const Competency({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<SurveyController>();
    List competency = [
      'Ethics, Rules of Conduct and Professionalism',
      'Client Care',
      'Communication and Negotiation',
      'Health and Safety',
      'Accounting Principles and Procedures',
      'Business Planning',
      'Conflict Avoidance, Management and Dispute Resolution Procedures',
      'Data Management',
      'Sustainability',
      'Teamworking',
    ];
    List technicalCore = [
      'Cost Reporting and Cost Control',
      'Procurement and Tendering',
      'Contract Practice',
      'Quantification and Costing of Construction Works',
      'Commercial Management of Construction',
    ];
    List techOpt = [
      'Construction Technology and Environmental Services',
      'Legal/Regulatory Compliance',
      'Project Financial Control and Reporting',
      'Risk Management',
      'Value Management',
      'Insurance',
      'Capital Allowances for Tax Purposes',
      'Life Cycle Costing',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Mandatory Competencies',
          size: 14,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 5,
        ),
        MyText(
          text: 'These competencies are required for all candidates:',
          size: 12,
          weight: FontWeight.w400,
          paddingBottom: 10,
        ),
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: competency.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: checkbox_row(title: competency[index])
                //  MyBullet(
                //   point: competency[index],
                // ),
                );
          },
        ),
        SizedBox(
          height: 22,
        ),
        Row(
          children: [
            MyText(
              text: 'Technical Core Competencies',
              size: 16,
              weight: FontWeight.bold,
            ),
            SizedBox(
              width: 30,
            ),
            Image.asset(
              Assets.imagesQuestionmark,
              width: 18,
              height: 18,
              color: isDarkMode ? kwhite : kblack,
            )
          ],
        ),
        MyText(
          paddingTop: 5,
          text: 'These competencies are required for all candidates:',
          size: 12,
          weight: FontWeight.w400,
          paddingBottom: 10,
        ),
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: technicalCore.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: checkbox_row(title: technicalCore[index]),
            );
          },
        ),
        SizedBox(
          height: 22,
        ),
        MyText(
          text: 'Technical Optional Competencies',
          size: 16,
          weight: FontWeight.bold,
          paddingBottom: 5,
        ),
        MyText(
          text: 'Select 3 core competencies for your pathway:',
          size: 12,
          weight: FontWeight.w400,
          paddingBottom: 10,
        ),
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: techOpt.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: checkbox_row(title: techOpt[index]),
            );
          },
        ),
        SizedBox(
          height: 15,
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

class checkbox_row extends StatelessWidget {
  final String? title,text2,fontFamily;
  final bool? isActive, hasSecText;
  final Color? cBorder, cbg,textColor;
  final double? radius;
  final double? tSize;
  const checkbox_row({
    super.key,
    this.title,
    this.isActive,
    this.hasSecText = false,
    this.cBorder,
    this.cbg,
    this.radius,
    this.tSize, this.textColor, this.text2, this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCheckBox(
          isActive: isActive ?? false,
          onTap: () {},
          radius: radius ?? 2.5,
          selectedColor: cbg ,
          bordercolor2: cBorder ,
          borderColor: cBorder,
          size: 15,
          circleIconsize: 12,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: MyText(
            text: title ?? '',
            paddingLeft: 6,
            paddingRight: hasSecText == true ? 10 : 0,
            size: tSize,
            color: textColor,fontFamily: fontFamily,
          ),
        ),
        if (hasSecText == true)
        MyText(text:text2?? '(22 Questions)',size: 12,color: getTertiary(context),)
      ],
    );
  }
}
