import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class CpdDetails extends StatelessWidget {
  const CpdDetails({super.key});

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
            text: 'Additional Details',
            size: 12,
            fontFamily: AppFonts.gilroyBold,
            paddingBottom: 20,
          ),
          MyText(
            text: 'Cost',
            size: 12,
            fontFamily: AppFonts.gilroyRegular,
            paddingBottom: 10,
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: MyTextField2(
                  // label: 'Reflection Notes*',
                  hint: '0',
                  //   textAlign: TextAlign.center,

                  bordercolor: kblueBorder4,
                ),
              ),
              Expanded(
                child: CustomDropDown(
                  // label: 'Reflection Notes*',
                  hint: 'GBP',
                  selectedValue: 'GBP',
                  items: [
                    'GBP',
                    'GBP 2',
                  ],
                  bgColor: kblackfill,
                  bordercolor: kblueBorder4, onChanged: (value) {},
                ),
              ),
            ],
          ),
          MyText(
            text: 'Status',
            size: 12,
            fontFamily: AppFonts.gilroyRegular,
            paddingBottom: 10,
          ),
          CustomDropDown(
            hint: 'Completed',
            selectedValue: 'Completed',
            items: [
              'Completed',
              'InComplete',
            ],
            bgColor: kblackfill,
            bordercolor: kblueBorder4,
            onChanged: (value) {},
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              checkbox_row(
                title: 'Certificate Received',
                cBorder: ksecondary,
                tSize: 10,
              ),
              SizedBox(width: 15),
              checkbox_row(
                title: 'Verification Required',
                cBorder: ksecondary,
                tSize: 10,
              ),
            ],
          ),
          MyText(
            paddingTop: 10,
            text: 'Tags',
            size: 12,
            fontFamily: AppFonts.gilroyRegular,
            paddingBottom: 10,
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                flex: 3,
                child: MyTextField2(
                    hint: 'Add a tag....',
                    marginBottom: 15,
                    hintColor: kwhite,
                    bordercolor: kblueBorder4),
              ),
              Expanded(
                flex: 1,
                child: MyTextField2(
                    //readOnly: true,
                    prefixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.imagesAdd,
                          width: 25,
                          color: ksecondary,
                        ),
                      ],
                    ),
                    marginBottom: 15,
                    bordercolor: kblueBorder4),
              ),
            ],
          ),
          MyText(
            text: 'Privacy & Sharing',
            size: 12,
            fontFamily: AppFonts.gilroyRegular,
            paddingBottom: 10,
          ),
          checkbox_row(
            title: 'Share with employer',
            cBorder: ksecondary,
          ),
          SizedBox(
            height: 7,
          ),
          checkbox_row(
            title: 'Make public in community',
            cBorder: ksecondary,
          ),
          MyButton(
            buttonText: 'Add',
            mTop: 25,
            mBottom: 10,
          )
        ],
      ),
    );
  }
}
