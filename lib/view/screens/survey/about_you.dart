import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutYou extends StatelessWidget {
  const AboutYou({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<SurveyController>();
    return Column(
      children: [
        MyTextField2(
          label: 'First Name',
          hint: 'e.g., john',
          //isoptional: false,
          marginBottom: 27,
        ),
        MyTextField2(
          label: 'Last Name',
          hint: 'e.g., doe',
          //isoptional: false,
          marginBottom: 27,
        ),
        MyTextField2(
          label: 'Email Address',
          marginBottom: 27,
        ),
        MyTextField2(
          label: 'Phone Number',
        ),
        SizedBox(
          height: 25,
        ),
        CustomeContainer(
          color: getfillcolor(context).withOpacity(0.5),
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text:
                    'We use your information to create and personalize your profile. Your privacy is important to us and we follow strict data protection guidelines.',
                size: 12,
                color: getTertiary(context),
                paddingBottom: 8,
              ),
              row_widget(
                title: 'Read full privacy policy',
                lpad: 0,
                texSize: 12,
                icon: Assets.imagesArrow,
                iconSize: 12,
                isIconRight: true,
              )
            ],
          ),
          mbott: 15,
        ),
        Row(
          children: [
 
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
