import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/auth/signUp/signUp.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
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
    return Scaffold(
      backgroundColor: kbackground,
      appBar: simpleAppBar(
        context: context,
        title: 'Login',
        size: 16,
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
                  text: 'Login',
                  size: 30,
                  weight: FontWeight.bold,
                  paddingBottom: 10,
                ),
                MyText(
                  paddingBottom: 20,
                  text:
                      'Log in to access your personalized APC study tools and track your progress toward chartership.',
                  color: kgrey,
                  size: 14,
                ),
                MyTextField(
                  label: 'Email Address',
                ),
                MyTextField(
                  label: 'Password',
                  // isOutline: true,
                ),
                MyText(
                  textAlign: TextAlign.end,
                  text: 'Forget Password?',
                  color: kred,
                  size: 14,
                  weight: FontWeight.normal,
                  onTap: () {
                Get.to(() => ForgetPw());
                  },
                  paddingBottom: 10,
                ),
                Row(
                  children: [
                    CustomCheckBox(
                      isActive: true,
                      onTap: () {},
                    ),
                    MyText(
                      text: 'Remember Me',
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
                    //Get.to(() => BottomNavBar());
                  },
                  buttonText: 'Login',
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
            text1: 'Don’t have an account? ',
            text2: 'Signup',
            align: TextAlign.center,
            size2: 14,
            size: 14,
            color2: kwhite,
            color1: kgrey,
            weight2: FontWeight.w500,
            ontap: () {
                 Get.to(() => Signup());
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
  final String icon;
  final VoidCallback ontap;
  const LoginOptions({
    super.key,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 15),
        decoration: BoxDecoration(
            color: ktransparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: kborder)),
        child: Center(
            child: CommonImageView(
          imagePath: icon,
          width: 21,
          height: 21,
          fit: BoxFit.contain,
        )),
      ),
    );
  }
}
