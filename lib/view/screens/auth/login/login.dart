import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/Navbar/bottom_navbar.dart';
import 'package:apc_pro/view/screens/auth/signUp/SignUp_socials.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'forget_pw.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: simpleAppBar(
          toolbarHeight: 80,
          context: context,
          title2: TwoTextedColumn(
            text1: 'Welcome Back!',
            text2: 'Sign in to continue',
            size1: 24,
            size2: 13.5,
            align: TextAlign.center,
            alignment: ColumnAlignment.center,
            fontFamily: AppFonts.gilroyBold,
            fontFamily2: AppFonts.gilroySemiBold,
          ),
          centerTitle: true,
          hasNonTextedTitle: true,
          haveBackButton: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                MyTextField2(
                  label: 'Email or Phone',
                  hint: 'Enter your email or phone number',
                ),
                MyTextField2(
                  label: 'Password',
                  hint: 'Enter your password',
                  // isOutline: true,
                ),
                MyText(
                  textAlign: TextAlign.end,
                  text: 'Forgot Password?',
                  color: getSecondaryColor(context),
                  size: 14,
                  fontFamily: AppFonts.gilroySemiBold,
                  lineHeight: 20 / 14,
                  onTap: () {
                    Get.to(() => ForgetPw());
                  },
                  paddingBottom: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  onTap: () {
                    Get.to(() => BottomNavBar());
                  },
                  buttonText: 'Sign In',
                  mBottom: 25,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 1.1,
                      color: getSecondaryColor(context),
                    )),
                    MyText(
                      text: '  Or   ',
                      color: getSecondaryColor(context),
                      size: 14,
                      fontFamily: AppFonts.gilroySemiBold,
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 1.1,
                      color: getSecondaryColor(context),
                    ))
                  ],
                ),
                SizedBox(height: 25),
                LoginOptions(
                    icon: isDarkMode
                        ? Assets.imagesDfacebook
                        : Assets.imagesFacebook,
                    ontap: () {}),
                SizedBox(
                  height: 10,
                ),
                LoginOptions(
                  icon: isDarkMode ? Assets.imagesDapple : Assets.imagesApple,
                  ontap: () {},
                  text: 'Continue with Apple',
                ),
                SizedBox(
                  height: 10,
                ),
                LoginOptions(
                  icon: isDarkMode ? Assets.imagesDgoogle : Assets.imagesGoogle,
                  ontap: () {},
                  text: 'Continue with Google',
                ),
              ],
            ),
          ),
          DiffTextsTxt(
            text1: 'Don’t have an account? ',
            text2: 'Signup',
            align: TextAlign.center,
            size2: 14,
            size: 14,
            color2: getSecondaryColor(context),
            color1: getTertiary(context),
            fontFamily2: AppFonts.gilroySemiBold,
            fontFamily: AppFonts.gilroySemiBold,
            ontap: () {
              Get.to(() => SignupSocials());
            },
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

class LoginOptions extends StatelessWidget {
  final String? icon;
  final VoidCallback ontap;
  final String? text;
  const LoginOptions({
    super.key,
    this.icon,
    required this.ontap,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: ontap, // don't forget to add ontap here
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
        decoration: BoxDecoration(
          color: ktransparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: getSecondaryColor(context)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // centers horizontally
          mainAxisSize: MainAxisSize.min, // avoids extra space
          crossAxisAlignment: CrossAxisAlignment.center, // centers vertically
          children: [
            if (icon != null)
              CommonImageView(
                imagePath: icon,
                width: 21,
                height: 21,
                fit: BoxFit.contain,
              ),
            const SizedBox(width: 8),
            MyText(
              text: text ?? 'Continue with Facebook',
              size: 14,
              fontFamily: AppFonts.gilroySemiBold,
              color: getSecondaryColor(context),
            ),
          ],
        ),
      ),
    );
  }
}
