import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/auth/Signup/Signup.dart';
import 'package:apc_pro/view/screens/auth/login/login.dart';
import 'package:apc_pro/view/screens/auth/signUp/otp_verification.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackground,
      appBar: simpleAppBar(
        context: context,
        title: 'Sign Up',
          size: 16,
        leadingIcon: Assets.imagesBackIcon,
        contentColor: ksecondary,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(
            color: kgrey.withOpacity(0.5),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                  text: 'Signup',
                  size: 30,
                  weight: FontWeight.bold,
                  paddingBottom: 10,
                ),
                MyText(
                  paddingBottom: 20,
                  text: 'Create your account to discover the app effortlessly',
                  color: kgrey,
                  size: 14,
                ),
                MyTextField(
                  label: 'Name',
                ),
                MyTextField(
                  label: 'Email Address',
                ),
                MyTextField(
                  label: 'New Password',
                  // isOutline: true,
                ),
                MyTextField(
                  label: 'Repeat Password',
                  // isOutline: true,
                ),
                Row(
                  children: [
                    CustomCheckBox(
                      isActive: true,
                      onTap: () {},
                    ),
                    MyText(
                      text: 'I agree to the Terms and Conditions.',
                      size: 12,
                      color: kgrey,
                      paddingLeft: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  onTap: () {
                  Get.to(() => OtpVerification());
                  },
                  buttonText: 'Sign Up',
                  mBottom: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: kborder,
                    )),
                    MyText(
                      text: '   or continue with   ',
                      color: kgrey,
                      size: 14,
                    ),
                    Expanded(
                        child: Divider(
                      color: kborder,
                    ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: LoginOptions(
                            icon: Assets.imagesGoogle, ontap: () {})),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: LoginOptions(
                            icon: Assets.imagesApple, ontap: () {})),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: LoginOptions(
                            icon: Assets.imagesFacebook, ontap: () {}))
                  ],
                ),
              ],
            ),
          ),
          DiffTextsTxt(
            text1: 'Already have an account? ',
            text2: 'Login',
            align: TextAlign.center,
            size2: 14,
            size: 14,
            color2: kwhite,
            color1: kgrey,
            weight2: FontWeight.w500,
            ontap: () {},
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
