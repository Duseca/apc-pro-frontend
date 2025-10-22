import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class CpdBasicinfo extends StatelessWidget {
  const CpdBasicinfo({super.key});

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
          row_widget(
            title: 'Activity Information',
            icon: Assets.imagesQuiz,
            iconSize: 16,
            fontFamily: AppFonts.gilroyBold,
            rpad: 10,
          ),
          SizedBox(
            height: 20,
          ),
          MyTextField2(
            label: 'Activity Title*',
            hint: 'e.g., RICS Professional Ethics Course',
            marginBottom: 25,
            bordercolor: ksecondary,
          ),
          MyTextField2(
            label: 'Provider*',
            hint: 'e.g., RICS , University Name',
            marginBottom: 25,
            bordercolor: ksecondary,
          ),
          MyTextField2(
            label: 'Description*',
            hint: 'Provide a detailed description of the activity.....',
            marginBottom: 25,
            bordercolor: ksecondary,
            maxLines: 2,
          ),
          SimpleDropDown(
              label: 'Category*',
              hint: 'Formal Learning',
              items: ['Formal Learning', 'Formal Learning 2'],
              value: 'Formal Learning',
              hasInfo: false,
              borderColor: kblueBorder4,
              hintColor: kwhite,
              onChanged: (w) {}),
          SizedBox(
            height: 25,
          ),
          SimpleDropDown(
              label: 'SubCategory*',
              hint: 'Structured Course',
              items: ['Structured Course', 'Structured Course 2'],
              value: 'Structured Course',
              hasInfo: false,
              borderColor: kblueBorder4,
              hintColor: kwhite,
              onChanged: (w) {}),
          SizedBox(
            height: 25,
          ),
          MyTextField2(
            label: 'Duration (hours)*',
            hint: '1',
            bordercolor: kblueBorder4,
            hintColor: kwhite,
            marginBottom: 25,
          ),
          MyTextField2(
            label: 'Activity Date*',
            hint: 'Structured Course',
            bordercolor: kblueBorder4,
            hintColor: kwhite,
            marginBottom: 25,
            suffixIcon: Image.asset(
              Assets.imagesQuiz,
              width: 18,
            ),
          )
        ],
      ),
    );
  }
}
