import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/screens/profile/change_pw.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/profile_widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
          context: context,
          title: 'Profile',
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  AddProfileImg(),
                  Center(
                    child: MyText(
                      paddingTop: 12,
                      text: 'Robert Fox',
                      size: 18,
                      fontFamily: AppFonts.gilroyMedium,
                      paddingBottom: 20,
                    ),
                  ),
                  MyTextField2(
                    label: 'Full Name',
                    hint: 'Robert Fox',
                    hintColor: kwhite,
                    marginBottom: 24,
                    bordercolor: ksecondary,
                  ),
                  MyTextField2(
                    label: 'Email Address',
                    hint: 'robertfox@gmail.com',
                    marginBottom: 24,
                    hintColor: kwhite,
                    bordercolor: ksecondary,
                  ),
                  MyTextField2(
                    label: 'Password',
                    hint: '************',
                    hintColor: kwhite,
                    marginBottom: 24,
                    bordercolor: ksecondary,
                    suffixIcon: MyText(
                      text: 'change password',
                      size: 12,
                      color: klighblue,
                      decoration: TextDecoration.underline,
                    ),
                    suffixTap: () {
                      Get.to(() => ChangePw());
                    },
                  ),
                  MyButton(
                    mTop: 70,
                    buttonText: 'Update',
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
