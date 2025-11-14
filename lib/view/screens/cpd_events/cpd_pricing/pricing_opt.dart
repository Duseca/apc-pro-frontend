import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/cpd_events/cpd_pricing/cpd_payment_method.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PricingOpt extends StatelessWidget {
  const PricingOpt({super.key});

  @override
  Widget build(BuildContext context) {
    final List basic = [
      'Job posted for 30 days',
      'Appears in search results',
      'Email notifications'
    ];
    final List premium = [
      'Everything in Basic',
      'Featured listing badge',
      'Priority in search results',
      'Applicant tracking system'
    ];
    final List pro = [
      'Everything in Premium',
      'Social media promotion',
      'Advanced analytics dashboard',
      'Dedicated account support'
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
                        'Select a job posting package that fits your hiring needs',
                    size: 14,
                    color: getSecondaryColor(context),
                    paddingTop: 12,
                    paddingBottom: 20,
                  ),
                  pricing_opt_card(
                    items: basic,
                  ),
                  pricing_opt_card(
                    items: premium,
                    pricingOpt: 'Premium',
                    price: '\$199',
                    buttonText: 'Select Premium',
                    isPopular: true,
                  ),
                  pricing_opt_card(
                    items: pro,
                    pricingOpt: 'Pro',
                    price: '\$299',
                    buttonText: 'Select Pro',
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
                                Assets.imagesInfo,
                                width: 17,
                                color: getSecondaryColor(context),
                              ),
                              Expanded(
                                  child: TwoTextedColumn(
                                text1: 'Need help choosing?',
                                text2:
                                    'Premium package gets 3x more applications on average',
                                size1: 12,
                                size2: 14,
                              
                                fontFamily: AppFonts.gilroyMedium,
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
              buttonText: 'Continue ',
              icon: Icons.arrow_forward,
              iconPosition: IconPosition.right,
              imgColor: getsplashcolor(context),
              mBottom: 20,
              iconSize: 15,
              mhoriz: 16,
              onTap: () {
               Get.to(()=>CpdPaymentMethod());
              },
            )
          ],
        ));
  }
}

class pricing_opt_card extends StatelessWidget {
  final String? pricingOpt, price, desc, buttonText;
  final bool? isPopular;
  final List items;
  const pricing_opt_card({
    super.key,
    this.pricingOpt,
    this.price,
    this.desc,
    this.buttonText,
    this.isPopular = false,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      mbott: 24,
      color: isPopular == true
          ? getSecondaryColor(context)
          : getfillcolor(context),
      borderColor: getfifth(context),
      vpad: 17,
      hpad: 17,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPopular == true) ...{
            TagsWidget(
              'MOST POPULAR',
              bgColor: getTertiary(context),
              textColor: getSecondaryColor(context),
              borderColor: ktransparent,
            ),
            SizedBox(
              height: 10,
            )
          },
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TwoTextedColumn(
                text1: pricingOpt ?? 'Basic',
                text2: desc ?? 'Essential job posting',
                size1: 16,
                size2: 14,
                fontFamily: AppFonts.gilroyBold,
                color1: isPopular == true
                    ? getsplashcolor(context)
                    : getSecondaryColor(context),
                color2: isPopular == true
                    ? getsplashcolor(context)
                    : getSecondaryColor(context),
              ),
              TwoTextedColumn(
                text1: price ?? '\$99',
                text2: '30 days',
                size1: 22,
                size2: 12,
                color2: getTertiary(context),
                fontFamily: AppFonts.gilroyBold,
                color1: isPopular == true
                    ? getsplashcolor(context)
                    : getSecondaryColor(context),
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
                  iconColor: isPopular == true
                      ? getsplashcolor(context)
                      : getSecondaryColor(context),
                  title: items[index],
                  texSize: 11.8,
                  iconSize: 13,
                  textColor: isPopular == true
                      ? getsplashcolor(context)
                      : getSecondaryColor(context),
                ),
              );
            },
          ),
          MyButton(
            mTop: 15,
            buttonText: buttonText ?? 'Select Basic',
            outlineColor: getTertiary(context),
            backgroundColor:
                isPopular == true ? getsplashcolor(context) : ktransparent,
            fontColor: getSecondaryColor(context),
            icon: isPopular == true ? Icons.star_rounded : null,
            imgColor: getSecondaryColor(context),
            iconPosition: IconPosition.right,
          )
        ],
      ),
    );
  }
}
