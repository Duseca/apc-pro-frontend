import 'dart:async';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/screens/survey/survey_main.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/auth/login/login.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/pinput.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});
  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackground,
      appBar: simpleAppBar(
        context: context,
        title: 'Account Verification',
        centerTitle: true,
          size: 16,
          leadingIcon: Assets.imagesBackIcon,
        contentColor: ksecondary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(color: kgrey),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                Row(
                  children: [
                    CommonImageView(
                      imagePath: Assets.imagesLogo1,
                      height: 30,
                      fit: BoxFit.contain,
                      //  color: kBlack2Color,
                    ),
                  ],
                ),
                MyText(
                  paddingTop: 10,
                  text: 'OTP Verification',
                  size: 30,
                  weight: FontWeight.bold,
                  paddingBottom: 10,
                ),
                MyText(
                  paddingBottom: 20,
                  text: 'Enter OTP sent to your email to verify yout account.',
                  color: kgrey,
                  size: 14,
                ),
                MyPinCode(
                  onChanged: (value) {},
                  onCompleted: (value) {
                    print("Completed: $value");
                  },
                ),
                SizedBox(
                  height: 80,
                ),
                DiffTextsTxt(
                  text1: '00:58 ',
                  text2: 'Resend',
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  onTap: () {
                    SuccessDialog.showSuccessDialog('Verification Complete!',
                        message: 'Your account has been successfully verified.',
                        ButtonText: 'Continue', ontap: () {
                         Get.to(() => SurveyMain());
                    }, image: Assets.imagesOtpverify, isSvg: true);
                  },
                  buttonText: 'Confirm',
                  mBottom: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
