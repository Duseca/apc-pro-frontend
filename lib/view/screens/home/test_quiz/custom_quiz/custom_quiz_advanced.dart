import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/switch_button.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_dropdown.dart';

class CustomQuizAdvanced extends StatelessWidget {
  const CustomQuizAdvanced({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Advanced Options',
          size: 15,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 12,
        ),
        TwoTextedSwitch(),
        SizedBox(
          height: 12,
        ),
        TwoTextedSwitch(
          text1: 'Randomize Options',
          text2: 'Shuffle answer choices',
        ),
        SizedBox(
          height: 12,
        ),
        TwoTextedSwitch(
          text1: 'Allow Review',
          text2: 'Let users review answers before submission',
        ),
            SizedBox(
          height: 20,
        ),
        CustomDropDown(
          label: 'Question Selection Method',
          hint: 'Random Selection',
          items: [
            'Random Selection',
            'Random Selection 2',
            'Random Selection 3',
            'Random Selection 4'
          ],
          bordercolor: ksecondary,
          bgColor: kblackfill,
          selectedValue: 'Random Selection',
          onChanged: (h) {},
        ),
            MyButton(
          buttonText: 'Save Quiz',
          mTop: 30,
        )
      ],
    );
  }
}

class TwoTextedSwitch extends StatelessWidget {
  final String? text1, text2;
  const TwoTextedSwitch({
    super.key,
    this.text1,
    this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TwoTextedColumn(
          text1: text1 ?? 'Randomize Questions',
          text2: text2 ?? 'Show questions in random order',
          size1: 14,
          size2: 11,
          fontFamily2: AppFonts.gilroyMedium,
          fontFamily: AppFonts.gilroyBold,
        )),
        SizedBox(
          width: 10,
        ),
        SwitchButton(
          scale: 0.6,
          isActive: true,
        ),
      ],
    );
  }
}
