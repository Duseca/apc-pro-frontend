import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/auth/login/login.dart';
import 'package:apc_pro/view/screens/auth/login/reset_pw.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPw extends StatefulWidget {
  const ForgetPw({super.key});
  @override
  State<ForgetPw> createState() => _ForgetPwState();
}

class _ForgetPwState extends State<ForgetPw> {
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
              text1: 'Forgot Password?',
              text2:
                  'Enter your email address or phone number to receive a password reset link.',
              size1: 16,
              size2: 14,
              fontFamily: AppFonts.gilroySemiBold,
              fontFamily2: AppFonts.gilroyMedium,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField2(
                    label: 'Enter your email or phone number',
                    hint: 'Enter your email or phone number',
                  ),
                  const SizedBox(height: 20),
                  MyButton(
                    onTap: () {
                      SuccessDialog.showSuccessDialog(
                          'Check Your Email', context,
                          image: isDarkMode
                              ? Assets.imagesDverifymailsvg
                              : Assets.imagesVerifymailsvg,
                          isSvg: true,
                          imgSize: 120, ontap: () {
                        Get.back();
                        Get.to(() => ResetPw());
                      },
                          message:
                              'Password reset link has been sent on your email address.',
                          ButtonText: 'Reset Password');
                    },
                    buttonText: 'Send Reset Link',
                    height: 46,
                    mBottom: 15,
                  ),
                  const SizedBox(height: 20),
                  DiffTextsTxt(
                    text1: 'Remember your password? ',
                    text2: 'Sign In',
                    align: TextAlign.center,
                    size2: 14,
                    size: 14,
                    color2: getSecondaryColor(context),
                    color1: getTertiary(context),
                    fontFamily2: AppFonts.gilroySemiBold,
                    fontFamily: AppFonts.gilroySemiBold,
                    ontap: () {
                      Get.to(() => Login());
                    },
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
