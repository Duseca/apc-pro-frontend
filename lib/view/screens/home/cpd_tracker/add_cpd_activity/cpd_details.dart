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
      color: getfillcolor(context),
      borderColor: getSecondaryColor(context),
      vpad: 17,
      hpad: 17,
      mtop: 30,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Additional Details',
            size: 16,
            fontFamily: AppFonts.gilroyBold,
            paddingBottom: 20,
          ),
          MyText(
            text: 'Cost',
          size: 14,
            fontFamily: AppFonts.gilroySemiBold,
            paddingBottom: 10,
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: MyTextField2(
                  //label: 'Reflection Notes*',
                  hint: '0',
                  //   textAlign: TextAlign.center,

                  bordercolor: getSecondaryColor(context),
                ),
              ),
              Expanded(
                child: CustomDropDown(
                  // label: 'Reflection Notes*',
                  hint: 'GBP',
                  value: 'GBP',
                  items: [
                    'GBP',
                    'GBP 2',
                  ],
                  bgColor: getfillcolor(context),
                  bordercolor: getSecondaryColor(context), onChanged: (value) {},
                ),
              ),
            ],
          ),
          MyText(
            text: 'Status',
          size: 14,
            fontFamily: AppFonts.gilroySemiBold,
            paddingBottom: 10,
          ),
          CustomDropDown(
            hint: 'Completed',
            value: 'Completed',
            items: [
              'Completed',
              'InComplete',
            ],
            bgColor: getfillcolor(context),
            bordercolor: getSecondaryColor(context),
            onChanged: (value) {},
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              checkbox_row(
                title: 'Certificate Received',
              
                tSize: 10,
              ),
              SizedBox(width: 15),
              checkbox_row(
                title: 'Verification Required',
              
                tSize: 10,
              ),
            ],
          ),
          MyText(
            paddingTop: 10,
            text: 'Tags',
          size: 14,
            fontFamily: AppFonts.gilroySemiBold,
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
                    
                    bordercolor: getSecondaryColor(context)),
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
                          color: getSecondaryColor(context),
                        ),
                      ],
                    ),
                    marginBottom: 15,
                    bordercolor: getSecondaryColor(context)),
              ),
            ],
          ),
          MyText(
            text: 'Privacy & Sharing',
          size: 14,
            fontFamily: AppFonts.gilroyRegular,
            paddingBottom: 15,
          ),
          checkbox_row(
            title: 'Share with employer',
          
          ),
          SizedBox(
            height: 7,
          ),
          checkbox_row(
            title: 'Make public in community',
          
          ),
              SizedBox(
            height: 7,
          ),
          checkbox_row(
            title: 'Share on LinkedIn',
          
          ),
          MyButton(
            buttonText: 'Add',
            mTop: 25,
            mBottom: 10,
            outlineColor: getSecondaryColor(context),
            backgroundColor: ktransparent,
            fontColor: getSecondaryColor(context),
          )
        ],
      ),
    );
  }
}
