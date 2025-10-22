import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/screens/auth/signUp/otp_verification.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
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
      appBar: simpleAppBar(context: context, toolbarHeight: 60),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TwoTextedColumn(
              text1: 'Create Account',
              text2:
                  'Enter your email address to create your Vacation Buddy account',
              size1: 16,
              size2: 14,
              fontFamily: AppFonts.gilroySemiBold,
              fontFamily2: AppFonts.gilroyMedium,
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 20,
                ),
                MyTextField2(
                  label: 'Email Address',
                  hint: 'Enter your email',
                ),
                MyTextField2(
                  label: 'Password',
                  hint: 'Create a password',
                  // isOutline: true,
                ),
                MyTextField2(
                  label: 'Confirm Password',
                  hint: 'Confirm your password',
                  // isOutline: true,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCheckBox(
                      size: 18,
                      isActive: false,
                      onTap: () {},
                    ),
                    Expanded(
                      child: DiffTextsTxt(
                        text1: 'I agree to the ',
                        text2: 'Terms of Service ',
                        text3: 'and ',
                        text4: 'Privacy Policy',
                        align: TextAlign.center,
                        size2: 12,
                        size: 12,
                        color2: getSecondaryColor(context),
                        color1: getTertiary(context),
                        color4: getSecondaryColor(context),
                        color3: getTertiary(context),
                        fontFamily2: AppFonts.gilroyMedium,
                        fontFamily: AppFonts.gilroyMedium,
                        ontap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MyButton(
            onTap: () {
              Get.to(() => OtpVerification());
            },
            buttonText: 'Create Account',
            mBottom: 25,
            mhoriz: 20,
          ),
          DiffTextsTxt(
            text1: 'Already have an account? ',
            text2: 'Sign In',
            align: TextAlign.center,
            size2: 14,
            size: 14,
            color2: getSecondaryColor(context),
            color1: getTertiary(context),
            ontap: () {},
            fontFamily2: AppFonts.gilroyMedium,
            fontFamily: AppFonts.gilroyMedium,
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
