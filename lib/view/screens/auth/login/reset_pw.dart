import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
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
      backgroundColor: kbackground,
      appBar: simpleAppBar(
        context: context,
        title: 'Reset Password',
        centerTitle: true,
          size: 16,
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
                  text: 'Create a New Password',
                  size: 30,
                  weight: FontWeight.bold,
                  paddingBottom: 10,
                ),
                MyText(
                  paddingBottom: 20,
                  text:
                      "To set a new password, please enter it below. Make sure it's strong and memorable!",
                  color: kgrey,
                  size: 14,
                ),
                MyTextField(
                  label: 'New Password',
                ),
                MyTextField(
                  label: 'Confirm New Password',
                  // isOutline: true,
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
