import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/cpd_events/cpd_pricing/payment_success.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/my_text_widget.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Payment Method',
            centerTitle: true,
            actions: [
              Bounce(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    Assets.imagesCross,
                    width: 15,
                    color: getSecondaryColor(context),
                  )),
              SizedBox(
                width: 15,
              )
            ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              color: getfillcolor(context),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  MyText(
                    text:
                        'Enter your card information and billing address to complete your job posting payment',
                    size: 14,
                    color: getSecondaryColor(context),
                    paddingTop: 12,
                    paddingBottom: 20,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 17,
                    borderColor: getfifth(context),
                    hpad: 17,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        row_widget(
                          title: 'Card Information',
                          texSize: 15.6,
                          fontFamily: AppFonts.gilroySemiBold,
                          icon: Assets.imagesCreditcard,
                          iconColor: getSecondaryColor(context),
                          iconSize: 21,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        MyTextField2(
                          hint: '1234 5678 9012 3456',
                          label: 'Card Number',
                          bordercolor: ktransparent,
                          filledColor: getfifth(context),
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            Expanded(
                                child: MyTextField2(
                              hint: 'MM/YY',
                              label: 'Expiry Date',
                              bordercolor: ktransparent,
                              filledColor: getfifth(context),
                            )),
                            Expanded(
                                child: MyTextField2(
                              hint: '123',
                              label: 'CVC',
                              bordercolor: ktransparent,
                              filledColor: getfifth(context),
                            ))
                          ],
                        ),
                        MyTextField2(
                          hint: 'John Smith',
                          label: 'Cardholder Name',
                          bordercolor: ktransparent,
                          filledColor: getfifth(context),
                        ),
                        checkbox_row(
                          title: 'Save card for future payments',
                        )
                      ],
                    ),
                    mbott: 24,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 17,
                    borderColor: getfifth(context),
                    hpad: 17,
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          row_widget(
                            title: 'Billing Address',
                            texSize: 15.6,
                            fontFamily: AppFonts.gilroySemiBold,
                            icon: Assets.imagesLocation,
                            iconColor: getSecondaryColor(context),
                            iconSize: 20,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomDropDown(
                              label: 'Country/Region',
                              hint: 'Select country',
                              items: ['Select country', 'London'],
                              value: 'Select country',
                              bgColor: getfifth(context),
                              onChanged: (s) {}),
                          MyTextField2(
                            hint: '123 Main Street',
                            label: 'Address Line 1',
                            bordercolor: ktransparent,
                            filledColor: getfifth(context),
                          ),
                          MyTextField2(
                            hint: 'Apartment, suite, etc.',
                            label: 'Address Line 2 (Optional)',
                            bordercolor: ktransparent,
                            filledColor: getfifth(context),
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                  child: MyTextField2(
                                hint: 'New York',
                                label: 'City',
                                bordercolor: ktransparent,
                                filledColor: getfifth(context),
                              )),
                              Expanded(
                                  child: MyTextField2(
                                hint: 'NY',
                                label: 'State',
                                bordercolor: ktransparent,
                                filledColor: getfifth(context),
                              )),
                              Expanded(
                                  child: MyTextField2(
                                hint: '10001',
                                label: 'ZIP Code',
                                bordercolor: ktransparent,
                                filledColor: getfifth(context),
                              ))
                            ],
                          ),
                        ]),
                    mbott: 24,
                  ),
                  CustomeContainer(
                    radius: 8,
                    vpad: 17,
                    hpad: 17,
                    borderColor: getfifth(context),
                    color: getfillcolor(context),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                              Image.asset(
                                Assets.imagesSecurity2,
                                width: 17,
                                color: getSecondaryColor(context),
                              ),
                              Expanded(
                                  child: TwoTextedColumn(
                                text1: '256-bit SSL Encryption',
                                text2:
                                    'Your payment information is secure and encrypted',
                                size1: 12,
                                size2: 14,
                                fontFamily2: AppFonts.gilroyMedium,
                              ))
                            ])
                      ],
                    ),
                    mbott: 24,
                  ),
                  CustomeContainer(
                    radius: 8,
                    vpad: 17,
                    hpad: 17,
                    borderColor: getfifth(context),
                    color: getfillcolor(context),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextField2(
                          hint: '000000',
                          label: 'Enter Promo Code',
                          align: TextAlign.center,
                          bordercolor: ktransparent,
                          filledColor: getfifth(context),
                        )
                      ],
                    ),
                    mbott: 24,
                  ),
                  CustomeContainer(
                    radius: 8,
                    vpad: 17,
                    hpad: 17,
                    borderColor: getfifth(context),
                    color: getfillcolor(context),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Order Summary',
                          paddingBottom: 16,
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                        ),
                        ExpandedRow(
                          text1: 'Job Posting (30 days)',
                          text2: '\$99.00',
                          fontFamily2: AppFonts.gilroyMedium,
                          size1: 14,
                          size2: 14,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        ExpandedRow(
                          text1: 'Processing Fee',
                          text2: '\$2.99',
                          fontFamily2: AppFonts.gilroyMedium,
                          size1: 14,
                          size2: 14,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: getfifth(context),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ExpandedRow(
                          text1: 'Total',
                          text2: '\$101.99',
                          fontFamily2: AppFonts.gilroyMedium,
                          fontFamily: AppFonts.gilroyMedium,
                          size2: 14,
                          size1: 14,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
                   Divider(
              color: getfifth(context),
            ),
            MyButton(
              buttonText: 'Continue Payment ',
              icon: Icons.arrow_forward,
              iconPosition: IconPosition.right,
              imgColor: getsplashcolor(context),
              mBottom: 25,
              iconSize: 15,
              mhoriz: 16,
              onTap: () {
                 Get.to(()=>PaymentSuccess());
              },
            )
          ],
        ));
  }
}
