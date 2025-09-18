import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/auth/login/login.dart';
import 'package:apc_pro/view/screens/auth/login/reset_pw.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
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
    return Scaffold(
      backgroundColor: kbackground,
      appBar: simpleAppBar(
        context: context,
          size: 16,
        title: 'Forgot Password',
        centerTitle: true,
          leadingIcon: Assets.imagesBackIcon,
        contentColor: ksecondary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(
            color: kgrey.withOpacity(0.5),
          ),
          Expanded(
            child: Center(
              // centers content vertically
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min, // ensures no extra space
                  children: [
                    Row(
                      children: [
                        CommonImageView(
                          imagePath: Assets.imagesLogo1,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    MyText(
                      paddingTop: 10,
                      text: 'Reset Your Password',
                      size: 30,
                      weight: FontWeight.bold,
                      paddingBottom: 10,
                    ),
                    MyText(
                      paddingBottom: 20,
                      text:
                          'Forgot your password? No worries! Enter your email below to receive a reset link.',
                      color: kgrey,
                      size: 14,
                    ),
                    MyTextField(
                      label: 'Email Address',
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                      onTap: () {
                        SuccessDialog.showSuccessDialog('Check Your Email',
                            image: Assets.imagesVerifymailsvg,
                            isSvg: true,
                            imgSize: 120, ontap: () {
                          Get.back();
                          Get.to(() => ResetPw());
                        },
                            message:
                                'Password reset link has been sent on your email address.',
                            ButtonText: 'Reset Password');
                      },
                      buttonText: 'Send Password Reset Link',
                      mBottom: 15,
                    ),
                    const SizedBox(height: 20),
                    DiffTextsTxt(
                      text1: 'Remember your password? ',
                      text2: 'Login',
                      align: TextAlign.center,
                      size2: 14,
                      size: 14,
                      color2: ksecondary,
                      color1: kgrey,
                      weight2: FontWeight.w500,
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
          ),
        ],
      ),
    );
  }
}
