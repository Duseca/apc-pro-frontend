import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutYou extends StatelessWidget {
  const AboutYou({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.find<SurveyController>();
    return Column(
      children: [
        Row(
          spacing: 20,
          children: [
            Expanded(
                child: MyTextField(
              label: 'First Name',
              hint: 'e.g., john',
              //isoptional: false,
              marginBottom: 27,
            )),
            Expanded(
                child: MyTextField(
              label: 'Last Name',
              hint: 'e.g., doe',
              //isoptional: false,
              marginBottom: 27,
            ))
          ],
        ),
       
        MyTextField(
          label: 'Email Address',
          marginBottom: 27,
        ),
        MyTextField(
          label: 'Phone Number',
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Assets.imagesInfo,
              width: 13,
            ),
            Expanded(
                child: MyText(
              text:
                  'We respect your privacy. Your details are safe and will only be used to personalise your experience',
              size: 12,
              paddingLeft: 4,
            ))
          ],
        ),
        MyButton(
          mTop: 30,
          buttonText: 'Continue',
          onTap: () {
            controller.nextStep();
          },
        )
      ],
    );
  }
}
