import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/profile/subscription/subscription.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/profile_widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionInfo extends StatelessWidget {
  const SubscriptionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final List planFeatures = [
      'Unlimited quiz attempts',
      'All learning materials access',
      'Priority support',
      'Progress tracking & analytics',
      'Certificate downloads'
    ];

    return Scaffold(
        appBar: simpleAppBar(
          context: context,
          title: 'Subscription & Billing',
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
                  CustomeContainer(
                      radius: 8,
                      color: getfillcolor(context),
                      vpad: 16,
                      hpad: 16,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: MyText(
                                  text: 'APC Pro Annual',
                                  size: 17,
                                  fontFamily: AppFonts.gilroyBold,
                                )),
                                row_widget(
                                  title: 'Active',
                                  icon: Assets.imagesError,
                                  iconColor: getSecondaryColor(context),
                                  iconSize: 10,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TwoTextedColumn(
                              text1: 'Renews on March 15, 2026',
                              text2: '\$199/year',
                              size1: 14,
                              size2: 17,
                              fontFamily2: AppFonts.gilroyBold,
                              color1: getTertiary(context),
                            )
                          ])),
                  MyText(
                    paddingTop: 16,
                    text: 'Plan Features',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 16,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.separated(
                          separatorBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8, top: 8),
                            );
                          },
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: planFeatures.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Icon(Icons.check_rounded,
                                    color: getSecondaryColor(context),
                                    size: 16),
                                Expanded(
                                    child: MyText(
                                  text: planFeatures[index],
                                  size: 14,
                                  paddingLeft: 8,
                                )),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    mbott: 16,
                  ),
                  MyText(
                    paddingTop: 16,
                    text: 'Billing Information',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 16,
                  ),
                  CustomeContainer(
                      radius: 8,
                      color: getfillcolor(context),
                      vpad: 16,
                      hpad: 16,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            row_widget(
                              title: 'Visa ending in 4567',
                              icon: Assets.imagesCards,
                              texSize: 16,
                              fontFamily: AppFonts.gilroyMedium,
                              iconColor: getSecondaryColor(context),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: 8),
                              child: Divider(
                                color: getfifth(context),
                              ),
                            ),
                            MyButton(
                              backgroundColor: getfifth(context),
                              fontColor: getSecondaryColor(context),
                              buttonText: 'Update Payment Method',
                              mBottom: 12,
                            ),
                            MyButton(
                              backgroundColor: getfifth(context),
                              fontColor: getSecondaryColor(context),
                              buttonText: 'Update Billing Address',
                              mBottom: 20,
                            )
                          ])),
                  MyText(
                    paddingTop: 16,
                    text: 'Billing History',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 16,
                  ),
                  CustomeContainer(
                      radius: 8,
                      color: getfillcolor(context),
                      vpad: 16,
                      hpad: 16,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            previous_exports_widget(
                              hasTrash: false,
                              text1: 'March 15, 2025',
                              text2: '\$199.00',
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: 8),
                              child: Divider(
                                color: getfifth(context),
                              ),
                            ),
                            previous_exports_widget(
                              hasTrash: false,
                              text1: 'March 15, 2025',
                              text2: '\$199.00',
                            ),
                            Padding(
                              padding:
                                 EdgeInsets.symmetric(vertical: 8),
                              child: Divider(
                                color: getfifth(context),
                              ),
                            ),
                            MyText(
                              text: 'View All Invoices',
                              color: getSecondaryColor(context),
                              size: 16,
                              fontFamily: AppFonts.gilroySemiBold,
                            )
                          ])),
                  MyText(
                    paddingTop: 16,
                    text: 'Plan Management',
                    fontFamily: AppFonts.gilroyBold,
                    size: 16,
                    paddingBottom: 16,
                  ),
                  MyButton(
                    buttonText: 'Change Plan',
                    mBottom: 16,
                    onTap: () {
                      Get.to(() => Subscription());
                    },
                  ),
                  MyButton(
                    buttonText: 'Plan Management',
                    backgroundColor: getfillcolor(context),
                    fontColor: getSecondaryColor(context),
                    mBottom: 16,
                  ),
                  MyText(
                    text: 'Payment Settings',
                    fontFamily: AppFonts.gilroyBold,
                    size: 16,
                    paddingBottom: 16,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          notification_pref_row(title: 'Auto-renewal'),
                          Divider(
                            color: getfifth(context),
                          ),
                          notification_pref_row(
                            title: 'Payment failure notifications',
                          ),
                          notification_pref_row(
                            title: 'Currency',
                            hasSwitch: false,
                            isDefault: true,
                            defaultText: 'USB',
                          )
                        ]),
                    mbott: 16,
                  ),
                  MyText(
                    text: 'Support',
                    fontFamily: AppFonts.gilroyBold,
                    size: 16,
                    paddingBottom: 16,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          expanded_icon_row(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Divider(
                              color: getfifth(context),
                            ),
                          ),
                          expanded_icon_row(
                            text: 'Refund Policy',
                            icon: Assets.imagesDownload3,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Divider(
                              color: getfifth(context),
                            ),
                          ),
                          expanded_icon_row(
                            text: 'Terms of Service',
                            icon: Assets.imagesDownload3,
                          ),
                        ]),
                    mbott: 16,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class expanded_icon_row extends StatelessWidget {
  final String? text;
  final String? icon;
  final double? textSize,iconSize;
  final Color? textcolor,iconColor;
  final String? fontFamily;
  const expanded_icon_row({
    super.key,
    this.text,
    this.icon, this.textSize, this.iconSize, this.textcolor, this.iconColor, this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: MyText(
          text: text ?? 'Request Data Export',
          size:textSize?? 14,
          fontFamily:fontFamily?? AppFonts.gilroySemiBold,
          color: textcolor,
        ),
      ),
      Image.asset(
        icon ?? Assets.imagesForward,
        width:iconSize?? 16,
        color:iconColor?? getSecondaryColor(context),
      )
    ]);
  }
}

// ignore: camel_case_types
class previous_exports_widget extends StatelessWidget {
  final String? text1, text2;
  final bool? hasTrash;
  const previous_exports_widget({
    super.key,
    this.text1,
    this.text2,
    this.hasTrash = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TwoTextedColumn(
          text1: text1 ?? 'Data Export - Oct 15, 2025',
          text2: text2 ?? 'JSON • 2.3 MB • Expires in 18 hours',
          size1: 14,
          size2: 12,
          fontFamily: AppFonts.gilroyBold,
          fontFamily2: AppFonts.gilroyMedium,
          color2: getTertiary(context),
        )),
        SizedBox(
          width: 15,
        ),
        Image.asset(
          Assets.imagesDownload,
          width: 16,
          color: getSecondaryColor(context),
        ),
        if (hasTrash == true) ...{
          SizedBox(
            width: 15,
          ),
          Image.asset(Assets.imagesTrash,
              width: 16, color: getSecondaryColor(context)),
        },
      ],
    );
  }
}
