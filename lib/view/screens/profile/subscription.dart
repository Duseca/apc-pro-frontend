import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/profile/payment_method.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackground,
        appBar: simpleAppBar(
          context: context,
          title: 'Subscription and billing',
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
                    vpad: 20,
                    hpad: 14,
                    borderColor: Color(0xff4285F4),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        row_widget(
                          title: 'APC Pro',
                          textColor: kwhite,
                          iconColor: Color(0xff4285F4),
                          texSize: 14,
                          icon: Assets.imagesCalendar,
                          iconSize: 21,
                          fontFamily: AppFonts.gilroyBold,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ExpandedRow(
                          text1: 'Status',
                          text2: 'Active',
                          size1: 16,
                          size2: 16,
                          fontFamily2: AppFonts.gilroyMedium,
                          fontFamily: AppFonts.gilroyMedium,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ExpandedRow(
                          text1: 'Renewal Date',
                          text2: '12/09/2025',
                          size1: 16,
                          size2: 16,
                          fontFamily2: AppFonts.gilroyMedium,
                          fontFamily: AppFonts.gilroyMedium,
                        ),
                        MyButton(
                          mTop: 38,
                          buttonText: 'Upgrade Plan',
                          mBottom: 20,
                        ),
                        MyButton(
                          backgroundColor: klighblue,
                          outlineColor: ksecondary,
                          fontColor: ksecondary,
                          buttonText: 'Cancel Subscription',
                        )
                      ],
                    ),
                  ),
                  MyButton(
                    mTop: 40,
                    backgroundColor: kblackfill,
                    outlineColor: ksecondary,
                    fontColor: klighblue,
                    fontFamily: AppFonts.gilroyMedium,
                    fontSize: 15,
                    onTap: () {
                        Get.to(()=>PaymentMethod());
                    },
                    buttonText: 'Manage Payment Method',
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
