

import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class home_deadline_widget extends StatelessWidget {
  const home_deadline_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      hpad: 14,
      borderColor: kblueBorder3,
      color: kblackfill,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TwoTextedColumn(
                  text1: 'CPD Review Due',
                  text2:
                      'Complete quarterly CPD hours assessment',
                  size1: 14,
                  size2: 11,
                  weight1: FontWeight.bold,
                  weight2: FontWeight.w500,
                ),
              ),
              MyText(
                text: '3 weeks',
                size: 12,
                color: kdarkSecondary,
                weight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: 'Progress: 14/20 Hours',
                size: 10,
                color: kwhite,
                weight: FontWeight.bold,
              ),
              MyText(
                text: 'Due: 14/04/24',
                size: 10,
                color: kwhite,
                weight: FontWeight.bold,
              ),
              MyText(
                text: 'Log 6 more hours',
                size: 10,
                color: kwhite,
                weight: FontWeight.bold,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class home_opts_container extends StatelessWidget {
  final String? icon, text;
  final VoidCallback? ontap;
  const home_opts_container({
    super.key,
    this.icon,
    this.text,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: 100),
      onTap: ontap,
      child: CustomeContainer(
        hpad: 12,
        borderColor: kblueBorder2,
        radius: 10,
        color: kblackfill,
        widget: Column(
          children: [
            Image.asset(
              icon ?? Assets.imagesDiary,
              width: 24,
              height: 24,
            ),
            MyText(
              text: text ?? 'APC Diary',
              size: 12,
              fontFamily: AppFonts.gilroyMedium,
              paddingTop: 10,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
