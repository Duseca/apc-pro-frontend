import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/screens/home/test_quiz/custom_quiz/custom_quiz_competency.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class CpdLearning extends StatelessWidget {
  const CpdLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Learning Outcomes & Competencies',
          size: 16,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 20,
        ),
        MyTextField2(
          label: 'Learning Outcomes*',
          hint: 'Describe what you learned or achieved from this activity',
          filledColor: getfillcolor(context),
          bordercolor: ktransparent,
        ),
        CustomeContainer(
          radius: 8,
          mbott: 15,
          color: getfillcolor(context),
          vpad: 12,
          hpad: 14,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Relevant Competencies*',
                size: 12,
                fontFamily: AppFonts.gilroyBold,
                paddingBottom: 5,
              ),
              MyText(
                text: 'Mandatory Competencies',
                size: 12,
                fontFamily: AppFonts.gilroyBold,
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 15),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: selectComp.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: checkbox_row(
                      title: selectComp[index],
                      cBorder: getSecondaryColor(context),
                      cbg: getSecondaryColor(context),
                      radius: 3.5,
                      isActive: false,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        CustomeContainer(
          mbott: 15,
          radius: 8,
          color: getfillcolor(context),
          vpad: 12,
          hpad: 14,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Technical Core Competencies',
                size: 12,
                fontFamily: AppFonts.gilroyBold,
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: techCore.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: checkbox_row(
                      title: techCore[index],
                      cBorder: getSecondaryColor(context),
                      cbg: getSecondaryColor(context),
                      radius: 3.5,
                      isActive: false,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        CustomeContainer(
          radius: 8,
          color: getfillcolor(context),
          vpad: 12,
          hpad: 14,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Technical Optional Competencies',
                size: 12,
                fontFamily: AppFonts.gilroyBold,
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: techOpt.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: checkbox_row(
                      title: techOpt[index],
                      cBorder: getSecondaryColor(context),
                      cbg: getSecondaryColor(context),
                      radius: 3.5,
                      isActive: false,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
