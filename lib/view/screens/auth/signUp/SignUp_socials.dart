import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/auth/login/login.dart';
import 'package:apc_pro/view/screens/auth/signUp/signUp.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/or_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupSocials extends StatefulWidget {
  const SignupSocials({super.key});
  @override
  State<SignupSocials> createState() => _SignupSocialsState();
}

class _SignupSocialsState extends State<SignupSocials> {
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
              text1: 'Sign Up with Social',
              text2:
                  'Choose your preferred social platform to get started quickly',
              size1: 18,
              size2: 12,
              fontFamily: AppFonts.gilroySemiBold,
              fontFamily2: AppFonts.gilroyMedium,
              align: TextAlign.center,
              alignment: ColumnAlignment.center,
              color2: getTertiary(context),
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
                LoginOptions(
                  ontap: () {
                    Get.to(()=>Signup());
                  },
                  text: 'Sign up with Email',
                ),
                SizedBox(
                  height: 12,
                ),
                LoginOptions(
                  ontap: () {},
                  text: 'Sign up with Phone',
                ),
                SizedBox(
                  height: 10,
                ),
                or_row(
                  title: 'or',
                ),
                SizedBox(
                  height: 10,
                ),
                LoginOptions(
                  icon: isDarkMode ? Assets.imagesDapple : Assets.imagesApple,
                  ontap: () {},
                  text: 'Continue with Apple',
                ),
                SizedBox(
                  height: 12,
                ),
                LoginOptions(
                  icon: isDarkMode ? Assets.imagesDgoogle : Assets.imagesGoogle,
                  ontap: () {},
                  text: 'Continue with Google',
                ),
                SizedBox(
                  height: 40,
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
          ),
        ],
      ),
    );
  }
}
