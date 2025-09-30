import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class ChangePw extends StatelessWidget {
  const ChangePw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackground,
        appBar: simpleAppBar(
          context: context,
          title: 'Password Change',
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  MyTextField(
                    label: 'New Password',
                    hint: '************',
                    hintColor: kwhite,
                    marginBottom: 24,
                    bordercolor: ksecondary,
                  ),
                  MyTextField(
                    label: 'Confirm Password',
                    hint: '************',
                    hintColor: kwhite,
                    marginBottom: 24,
                    bordercolor: ksecondary,
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
