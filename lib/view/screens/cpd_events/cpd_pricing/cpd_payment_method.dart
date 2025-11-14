import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/cpd_events/cpd_pricing/payment_info.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CpdPaymentMethod extends StatelessWidget {
  const CpdPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final List basic = [
    'Instant processing'
    ];
    final List premium = [
      'Buyer protection included',
      'No need to enter card details',
     
    ];
    final List pro = [
      'Processing takes 1-3 business days',
      'Lower processing fees',
  
    ];
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
                        'Choose your preferred payment method to complete your job posting',
                    size: 14,
                    color: getSecondaryColor(context),
                    paddingTop: 12,
                    paddingBottom: 20,
                  ),
                  payment_method_card(
                    items: basic,
                    paymentMethod: 'Credit Card',
                    desc: 'Visa, Mastercard, American Express',
                    icon: Assets.imagesCreditcard,
                    iconColor: getSecondaryColor(context),
                  ),
                  payment_method_card(
                    items: premium,
                    paymentMethod: 'PayPal',
                    icon: Assets.imagesPaypal,
                    isSelected: true,
                  ),
                  payment_method_card(
                    items: pro,
                    paymentMethod: 'Bank Transfer',
                    icon: Assets.imagesBank,
                    iconColor: getSecondaryColor(context),
                  ),
                  CustomeContainer(
                    radius: 8,
                    vpad: 16,
                    hpad: 16,
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
                                text1: 'Secure Payment',
                                text2:
                                    'All transactions are encrypted and secure',
                                size1: 12,
                                size2: 14,
                            
                                fontFamily2: AppFonts.gilroyMedium,
                              ))
                            ])
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
              buttonText: 'Continue with PayPal ',
              icon: Icons.arrow_forward,
              iconPosition: IconPosition.right,
              imgColor: getsplashcolor(context),
              mBottom: 20,
              iconSize: 15,
              mhoriz: 16,
              mTop: 20,
              onTap: () {
                 Get.to(()=>PaymentInfo());
              },
            )
          ],
        ));
  }
}

class payment_method_card extends StatelessWidget {
  final String? paymentMethod, icon, desc;
  final bool? isSelected;
  final Color? iconColor;
  final List items;
  const payment_method_card({
    super.key,
    this.paymentMethod,
    this.icon,
    this.desc,
    this.isSelected = false,
    required this.items,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      mbott: 24,
      color: isSelected == true
          ? getSecondaryColor(context)
          : getfillcolor(context),
      borderColor: getfifth(context),
      vpad: 17,
      hpad: 17,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isSelected == true) ...{
            TagsWidget(
              'RECOMMENDED',
              bgColor: getTertiary(context),
              textColor: getSecondaryColor(context),
              borderColor: ktransparent,
            ),
            SizedBox(
              height: 10,
            )
          },
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Image.asset(
                icon ?? Assets.imagesPaypal,
                width: 20,
                color: iconColor,
              ),
              Expanded(
                child: TwoTextedColumn(
                  text1: paymentMethod ?? 'Basic',
                  text2: desc ?? 'Essential job posting',
                  size1: 16,
                  size2: 14,
                  fontFamily: AppFonts.gilroyBold,
                  color1: isSelected == true
                      ? getsplashcolor(context)
                      : getSecondaryColor(context),
                  color2: isSelected == true
                      ? getsplashcolor(context)
                      : getSecondaryColor(context),
                ),
              ),
              CustomCheckBox(
                isActive: isSelected == true ? true : false,
                onTap: () {},
                iscircle: true,
                size: 16,
                circleIconsize: 12,
                iconColor: isSelected == true
                    ? getsplashcolor(context)
                    : getSecondaryColor(context),
                borderColor: isSelected == true
                    ? getsplashcolor(context)
                    : getTertiary(context),
                bordercolor2:
                    isSelected == true ? getsplashcolor(context) : ktransparent,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: row_widget(
                  iconData: Icons.check_rounded,
                  iconColor: isSelected == true
                      ? getsplashcolor(context)
                      : getSecondaryColor(context),
                  title: items[index],
                  texSize: 11.8,
                  iconSize: 13,
                  textColor: isSelected == true
                      ? getsplashcolor(context)
                      : getSecondaryColor(context),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
