import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class ResetPw extends StatefulWidget {
  const ResetPw({super.key});
  @override
  State<ResetPw> createState() => _ResetPwState();
}

class _ResetPwState extends State<ResetPw> {
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
              text1: 'Reset Password',
              text2: 'Create a new password for your Vacation Buddy account',
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
                  label: 'New Password',
                  hint: 'Enter your new password',
                  suffixIcon: Image.asset(
                    Assets.imagesEye,
                    width: 20,
                  ),
                ),
                MyTextField2(
                  label: 'Confirm New Password',
                  hint: 'Confirm your new password',
                  suffixIcon: Image.asset(
                    Assets.imagesEye,
                    width: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  onTap: () {
                    //Get.to(() => BottomNavBar());
                  },
                  buttonText: 'Reset Password',
                  mBottom: 15,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
