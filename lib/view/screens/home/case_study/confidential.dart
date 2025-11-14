import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/switch_button.dart';
import 'package:flutter/material.dart';

class Confidential extends StatelessWidget {
  const Confidential({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomeContainer(
          radius: 8,
          color: getfillcolor(context),
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Confidentiality Settings',
                size: 16,
                fontFamily: AppFonts.gilroyBold,
                paddingBottom: 15,
              ),
             CustomDropDown(
                label: 'Confidentiality level',
                hint: 'Confidential- Contains sensitive information',
                items: ['Confidential- Contains sensitive information', 'others'],
                value: 'Confidential- Contains sensitive information',
                onChanged: (t) {},
                bgColor: getfifth(context),
                hintColor: getTertiary(context),
                bordercolor: getSecondaryColor(context),
               // hasInfo: false,
              ),
          
              MyTextField2(
                label: 'Reason for confidentiality (optional)',
                hint: 'Explain why this project requires confidential treatment....',
                marginBottom: 0,
                maxLines: 2,
        
                filledColor: getfifth(context),
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               
                  Expanded(
                      child: MyText(
                    text: 'Client consent obtained for APC use *',
                    size: 12,
                    paddingRight: 4,
                    fontFamily: AppFonts.gilroySemiBold,
                  )),
                     SwitchButton(
                    scale: 0.8,
                  ),
                ],
              ),
              CustomeContainer(
                radius: 10,
                vpad: 17,
                hpad: 17,
                borderColor: kblueBorder,
                widget: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Assets.imagesDanger,
                      width: 18,
                      color: getSecondaryColor(context)
                    ),
                    Expanded(
                      child: MyText(
                        size: 12,
                        text:
                            'You must obtain written consent from your client before using confidential project information in your APC submission.',
                        fontFamily: AppFonts.gilroyRegular,
                        color: getTertiary(context),
                        paddingLeft: 15,
                      ),
                    ),
                  ],
                ),
                mbott: 19,
              ),
          
            ],
          ),
          mbott: 16,
        ),
            TwoTextedColumn(
            text1: 'Auto - Generated Confidentiality Statement ',
            text2:
                'This case study relates to [PROJECT TITLE] and contains information relating to [CLIENT NAME]. The information presented has been anonymized where necessary to protect commercial sensitivity while maintaining the integrity of the professional experience described. Written consent has been obtained from [CLIENT NAME] for the use of this project information for APC assessment purposes. All parties involved have agreed to the inclusion of this case study in my APC submission. The project details, methodologies, and outcomes described are accurate and reflect my direct involvement and responsibilities as outlined in this document. This statement will be automatically included in your case study export. You can customize it if needed.',
            size1: 16,
            size2: 12,
            fontFamily2: AppFonts.gilroyRegular,
            fontFamily: AppFonts.gilroyBold,
            lineHeight: 1.7,
            maxLines: 20,
          )
      ],
    );
  }
}
