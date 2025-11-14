import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/Navbar/bottom_navbar.dart';
import 'package:apc_pro/view/screens/cpd_events/add_cpd_event.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/bullet_points.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Payment Success',
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
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  Center(
                      child: Image.asset(
                    isDarkMode ? Assets.imagesSuccessd : Assets.imagesSuccessl,
                    width: 64,
                  )),
                  SizedBox(
                    height: 24,
                  ),
                  TwoTextedColumn(
                    text1: 'Payment Successful!',
                    text2:
                        'Your job posting has been successfully published and will be live for 30 days',
                    fontFamily2: AppFonts.gilroyMedium,
                    fontFamily: AppFonts.gilroyMedium,
                    size2: 14,
                    size1: 28,
                    align: TextAlign.center,
                    alignment: ColumnAlignment.center,
                    color2: getTertiary(context),
                  ),
                  CustomeContainer(
                    mtop: 16,
                    radius: 8,
                    vpad: 17,
                    hpad: 17,
                    borderColor: getfifth(context),
                    color: getfillcolor(context),
                    widget: Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Transaction Details',
                          paddingBottom: 8,
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                        ),
                        ExpandedRow(
                          text1: 'Transaction ID',
                          text2: '#TXN-2024-001234',
                          fontFamily2: AppFonts.gilroySemiBold,
                          size1: 14,
                          size2: 14,
                          color1: getTertiary(context),
                        ),
                        ExpandedRow(
                          text1: 'Date',
                          text2: 'Jan 15, 2024',
                          fontFamily2: AppFonts.gilroySemiBold,
                          size1: 14,
                          size2: 14,
                          color1: getTertiary(context),
                        ),
                        ExpandedRow(
                          text1: 'Job Posting (30 days)',
                          text2: '\$99.00',
                          fontFamily2: AppFonts.gilroySemiBold,
                          size1: 14,
                          size2: 14,
                          color1: getTertiary(context),
                        ),
                        ExpandedRow(
                          text1: 'Processing Fee',
                          text2: '\$2.99',
                          fontFamily2: AppFonts.gilroySemiBold,
                          size1: 14,
                          size2: 14,
                          color1: getTertiary(context),
                        ),
                        Divider(
                          color: getfifth(context),
                        ),
                        ExpandedRow(
                          text1: 'Total Paid',
                          text2: '\$101.99',
                          fontFamily2: AppFonts.gilroySemiBold,
                          fontFamily: AppFonts.gilroySemiBold,
                          size2: 15,
                          size1: 16,
                        ),
                      ],
                    ),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    radius: 8,
                    vpad: 17,
                    hpad: 17,
                    borderColor: getfifth(context),
                    color: getfillcolor(context),
                    widget: Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Event Details',
                          paddingBottom: 8,
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                        ),
                        TwoTextedColumn(
                          text1: 'Title',
                          text2: 'Advanced Risk Management Workshop',
                          fontFamily2: AppFonts.gilroySemiBold,
                          size1: 12,
                          size2: 14,
                          color1: getTertiary(context),
                        ),
                        TwoTextedColumn(
                          text1: 'Summary',
                          text2:
                              'A comprehensive workshop covering modern risk assessment methodologies and their practical applications in property and construction management.',
                          fontFamily2: AppFonts.gilroySemiBold,
                          size1: 12,
                          size2: 14,
                          color1: getTertiary(context),
                        ),
                        TwoTextedColumn(
                          text1: 'Location',
                          text2: 'RICS Training Centre, London',
                          fontFamily2: AppFonts.gilroySemiBold,
                          size1: 14,
                          size2: 14,
                          color1: getTertiary(context),
                        ),
                        MyBullet(
                          point: 'Live and accepting applications',
                          bulletIcon: Assets.imagesError,
                          iconSize: 10,
                          size: 14,
                          fontFamily: AppFonts.gilroySemiBold,
                        )
                      ],
                    ),
                    mbott: 16,
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
                                Assets.imagesEmail,
                                width: 17,
                                color: getTertiary(context),
                              ),
                              Expanded(
                                  child: TwoTextedColumn(
                                text1: 'Receipt sent to your email',
                                text2: 'john.smith@company.com',
                                size1: 14,
                                size2: 12,
                                color2: getTertiary(context),
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
              buttonText: 'Go to Dashboard ',
              mBottom: 12,
              image: Assets.imagesDashboard,
              imgColor: getsplashcolor(context),
              iconPosition: IconPosition.right,
              iconSize: 13,
              mhoriz: 20,
              onTap: () {
                Get.offAll(BottomNavBar(index: 1,));
              },
            ),
            MyButton(
              outlineColor: getSecondaryColor(context),
              fontColor: getSecondaryColor(context),
              backgroundColor: ktransparent,
              buttonText: 'Create Another Event ',
              image: Assets.imagesAdd,
              imgColor: getSecondaryColor(context),
              iconPosition: IconPosition.right,
              iconSize: 15,
              mhoriz: 20,
              mBottom: 20,
              onTap: () {
                Get.to(()=>AddCpdEvent());
              },
            )
          ],
        ));
  }
}
