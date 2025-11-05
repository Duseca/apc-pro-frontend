import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/profile/subscription/billing.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    vpad: 28,
                    hpad: 14,
                    borderColor: getSecondaryColor(context),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextField2(
                          label: 'Email Address',
                          hint: 'robertfox@gmail.com',
                          marginBottom: 24,
                          bordercolor: getSecondaryColor(context),
                        ),
                        MyTextField2(
                          label: 'Card Information',
                          hint: '1234 1234 1234 1234',
                          marginBottom: 20,
                          bordercolor: getSecondaryColor(context),
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
                              marginBottom: 24,
                              bordercolor: getSecondaryColor(context),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: MyTextField2(
                              hint: 'CVC',
                              marginBottom: 24,
                              bordercolor: getSecondaryColor(context),
                            )),
                          ],
                        ),
                        MyTextField2(
                          label: 'Account Title',
                          hint: 'Robert Fox',
                          marginBottom: 24,
                          bordercolor: getSecondaryColor(context),
                        ),
                        MyButton(
                          buttonText: 'Change Payment Method',
                          backgroundColor: getfifth(context),
                          fontColor: getSecondaryColor(context),
                        ),
                      ],
                    ),
                  ),
                  MyButton(
                    mTop: 20,
                    backgroundColor: getfillcolor(context),
                    outlineColor: getSecondaryColor(context),
                    fontColor: getTertiary(context),
                    fontFamily: AppFonts.gilroyMedium,
                    fontSize: 15,
                    buttonText: 'Manage Payment Method',
                    onTap: () {
                      Get.to(() => Billing());
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
