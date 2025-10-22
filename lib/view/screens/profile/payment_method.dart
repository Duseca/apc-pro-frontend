import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
          context: context,
          title: 'Payment Method',
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
                  CustomeContainer(
                    radius: 8,
                    color: kblackfill,
                    vpad: 28,
                    hpad: 14,
                    borderColor: Color(0xff4285F4),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextField2(
                          label: 'Email Address',
                          hint: 'robertfox@gmail.com',
                          marginBottom: 24,
                          hintColor: kwhite,
                          bordercolor: ksecondary,
                        ),
                        MyTextField2(
                          label: 'Card Information',
                          hint: '1234 1234 1234 1234',
                          marginBottom: 20,
                          hintColor: kwhite,
                          bordercolor: ksecondary,
                          suffixIcon: Row(
                            spacing: 3,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                Assets.imagesVisa,
                                width: 22,
                                height: 17,
                              ),
                              Image.asset(
                                Assets.imagesMaster,
                                width: 22,
                                height: 17,
                              ),
                              Image.asset(
                                Assets.imagesAmerican,
                                width: 22,
                                height: 17,
                              ),
                              Image.asset(
                                Assets.imagesDiscover,
                                width: 22,
                                height: 17,
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: MyTextField2(
                              hint: 'MM/YY',
                              hintColor: kwhite,
                              marginBottom: 24,
                              bordercolor: ksecondary,
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: MyTextField2(
                              hint: 'CVC',
                              hintColor: kwhite,
                              marginBottom: 24,
                              bordercolor: ksecondary,
                            )),
                          ],
                        ),
                        MyTextField2(
                          label: 'Account Title',
                          hint: 'Robert Fox',
                          hintColor: kwhite,
                          marginBottom: 24,
                          bordercolor: ksecondary,
                        ),
                        MyButton(
                          buttonText: 'Change Payment Method',
                        ),
                      ],
                    ),
                  ),
                  MyButton(
                    mTop: 20,
                    backgroundColor: kblackfill,
                    outlineColor: ksecondary,
                    fontColor: klighblue,
                    fontFamily: AppFonts.gilroyMedium,
                    fontSize: 15,
                    buttonText: 'Manage Payment Method',
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
