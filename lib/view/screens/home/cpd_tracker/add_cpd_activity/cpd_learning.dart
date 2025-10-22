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
    return CustomeContainer(
      radius: 10,
      color: kblackfill,
      borderColor: kblueBorder4,
      vpad: 17,
      hpad: 17,
      mtop: 30,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Learning Outcomes & Competencies',
            size: 12,
            fontFamily: AppFonts.gilroyBold,
            paddingBottom: 20,
          ),
          MyTextField2(
            label: 'Learning Outcomes*',
            hint: 'Describe what you learned or achieved from this activity',
            marginBottom: 25,
            bordercolor: ksecondary,
          ),
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
                  cBorder: ksecondary,
                  cbg: kblackfill,
                  radius: 3.5,
                ),
              );
            },
          ),
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
                  cBorder: ksecondary,
                  cbg: kblackfill,
                  radius: 3.5,
                ),
              );
            },
          ),
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
                  cBorder: ksecondary,
                  cbg: kblackfill,
                  radius: 3.5,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
