import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Contact Support', centerTitle: true),
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
                    label: 'Write your message',
                    hint: 'write your message here',
                    hintColor: kwhite,
                    maxLines: 4,
                    marginBottom: 24,
                    bordercolor: ksecondary,
                  ),
                  MyButton(
                    mTop: 55,
                    buttonText: 'Send',
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
