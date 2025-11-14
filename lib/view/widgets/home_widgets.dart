import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
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
 vpad: 15,
      color: getfillcolor(context),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TwoTextedColumn(
                  text1: 'CPD Review Due',
                  text2: '14/20 Hours',
                  size1: 14,
                  size2: 11,
                  fontFamily: AppFonts.gilroyBold,
                  fontFamily2: AppFonts.gilroyMedium,
                  mBottom: 8,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyText(
                    text: '14/04/24',
                    size: 12,
                    color: getTertiary(context),
                    weight: FontWeight.bold,
                    paddingBottom: 8,
                  ),
                  MyText(
                    text: '70%',
                    size: 12,
                    color:getSecondaryColor(context)
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 3,),
          linearProgressIndicatorr(
            height: 7,
            value: 0.8,
          ),
          MyText(
            text: '4 items remaining',
            size: 12,
            color: getTertiary(context),
            weight: FontWeight.bold,
            paddingTop: 7,
          ),
        ],
      ),
    );
  }
}

class home_opts_container extends StatelessWidget {
  final String? icon, text;
  final VoidCallback? ontap;
  final Color? iconColor;
  const home_opts_container({
    super.key,
    this.icon,
    this.text,
    this.ontap, this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: 100),
      onTap: ontap,
      child: CustomeContainer(
        hpad: 12,
       
        radius: 10,
        color: getfillcolor(context),
        widget: Column(
          children: [
            Image.asset(
              icon ?? Assets.imagesDiary,
              width: 24,
              height: 24,
              color: iconColor,
            ),
            MyText(
              text: text ?? 'APC Diary',
              size: 11,
              fontFamily: AppFonts.gilroySemiBold,
              paddingTop: 8,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class circular_indicator_stack extends StatelessWidget {
  final String? percent, title;
  const circular_indicator_stack({
    super.key,
    this.percent,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                backgroundColor: getfillcolor(context),
                strokeCap: StrokeCap.round,
                value: 0.5,
                valueColor:
                    AlwaysStoppedAnimation<Color>(getSecondaryColor(context)),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: percent ?? '10%',
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 80,
          child: MyText(
            text: title ?? 'Diary',
            size: 12,
            fontFamily: AppFonts.gilroyMedium,
            paddingTop: 10,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
