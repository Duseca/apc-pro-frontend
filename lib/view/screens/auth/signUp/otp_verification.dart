import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/screens/survey/survey_main.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: simpleAppBar(context: context, toolbarHeight: 60),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TwoTextedColumn(
              text1: 'Verify Your Email',
              text2:
                  "We've sent a verification code to your email address. Please enter the code below to verify your account.",
              size1: 16,
              size2: 14,
              fontFamily: AppFonts.gilroySemiBold,
              fontFamily2: AppFonts.gilroyMedium,
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    Assets.imagesCode,
                    width: 60,
                    height: 60,
                  ),
                ),
                MyText(
                  paddingTop: 20,
                  text: 'Verification Code',
                  size: 14,
                  color: getSecondaryColor(context),
                  fontFamily: AppFonts.gilroyBold,
                  paddingBottom: 10,
                ),
                MyPinCode(
                  onChanged: (value) {},
                  onCompleted: (value) {
                    print("Completed: $value");
                  },
                ),
                MyText(
                  paddingTop: 30,
                  text: 'Code expires in 05:00',
                  size: 12,
                  color: getTertiary(context),
                  fontFamily: AppFonts.gilroySemiBold,
                  textAlign: TextAlign.center,
                  paddingBottom: 20,
                ),
                MyButton(
                  onTap: () {
                    SuccessDialog.showSuccessDialog(
                        'Verification Complete!', context,
                        message: 'Your account has been successfully verified.',
                        ButtonText: 'Continue', ontap: () {
                      Get.to(() => SurveyMain());
                    },
                        image: isDarkMode
                            ? Assets.imagesDotpVerify
                            : Assets.imagesOtpverify,
                        isSvg: true);
                  },
                  buttonText: 'Verify Email',
                  mBottom: 15,
                ),
                MyText(
                  text: 'Didn’t receive the code',
                  size: 12,
                  color: getTertiary(context),
                  fontFamily: AppFonts.gilroySemiBold,
                  textAlign: TextAlign.center,
                  paddingBottom: 10,
                ),
                MyText(
                  text: 'Resend Email',
                  size: 12,
                  color: getSecondaryColor(context),
                  fontFamily: AppFonts.gilroyBold,
                  textAlign: TextAlign.center,
                  paddingBottom: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
