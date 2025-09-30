import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class apc_competency_widget extends StatelessWidget {
  const apc_competency_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
        mbott: 20,
        radius: 10,
        hpad: 15,
        color: kblackfill,
        borderColor: kblueBorder3,
        widget: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ExpandedRow(
            text1: 'Competency Progress',
            text2: 'View Details',
            size1: 14,
            size2: 12,
            weight1: FontWeight.bold,
            weight2: FontWeight.bold,
            color2: ksecondary,
            isExpanded: true,
            fontFamily: AppFonts.gilroySemiBold,
            fontFamily2: AppFonts.gilroySemiBold,
            ontap2: () {},
          ),
          MyText(
            text: 'Building Surveying and Technology',
            size: 13,
            fontFamily: AppFonts.gilroyMedium,
            paddingTop: 18,
            paddingBottom: 10,
          ),
          MyText(
            text: '2.0 days  2 entries  Avg lvl 3.5  Last : 20 feb 2025',
            size: 13,
            fontFamily: AppFonts.gilroyMedium,
            paddingBottom: 10,
          ),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(20),
            color: kblueBorder2,
            minHeight: 12,
            value: 0.3,
            valueColor: AlwaysStoppedAnimation(kblueBorder2),
            backgroundColor: kblueBorder2.withOpacity(0.49),
          ),
          MyText(
            text: 'Building Defects',
            size: 13,
            fontFamily: AppFonts.gilroyMedium,
            paddingTop: 18,
            paddingBottom: 10,
          ),
          MyText(
            text: '2.0 days  2 entries  Avg lvl 3.5  Last : 20 feb 2025',
            size: 13,
            fontFamily: AppFonts.gilroyMedium,
            paddingBottom: 10,
          ),
          linearProgressIndicatorr(),
        ]));
  }
}

class newEntry_container extends StatelessWidget {
  final String? title, desc, icon;
  final VoidCallback? ontap;
  final Color? borderColor,iconColor;
  final String? suffixIcon;
  final bool? hasPrefix;
  final double? mbott;
  const newEntry_container({
    super.key,
    this.title,
    this.desc,
    this.icon,
    this.ontap, this.borderColor, this.suffixIcon, this.hasPrefix=true, this.mbott, this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: ontap,
      child: CustomeContainer(
          mbott:mbott?? 20,
          hpad: 15,
          color: kblackfill,
          radius: 8,
          borderColor:borderColor?? kblueBorder3,
          widget:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                if(hasPrefix==true)...{
                Image.asset(
                  icon ?? Assets.imagesNewentry,
                  width: 24,
                  height: 24,
                  color: iconColor,
                ),
                SizedBox(
                  width: 18,
                ),
                },
                Expanded(
                  child: TwoTextedColumn(
                    text1: title ?? 'New Entry',
                    text2: desc ?? 'Log new work experience',
                    size1: 14,
                    size2: 11,
                    fontFamily: AppFonts.gilroyBold,
                    fontFamily2: AppFonts.gilroyMedium,
                  ),
                ),

                if(suffixIcon!=null)
                Image.asset(suffixIcon??Assets.imagesExport,width: 20,height: 20,)
              ],
            )
          ])),
    );
  }
}

class apc_competencyLevel_widget extends StatelessWidget {
  const apc_competencyLevel_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
        mbott: 20,
        radius: 10,
        hpad: 14,
        color: kblackfill,
        borderColor: kblueBorder3,
        widget: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ExpandedRow(
            text1: 'Competency Level Distribution',
            text2: '',
            size1: 14,
            size2: 0,
            weight1: FontWeight.bold,
            weight2: FontWeight.bold,
            color2: ksecondary,
            isExpanded: true,
            fontFamily: AppFonts.gilroySemiBold,
            fontFamily2: AppFonts.gilroySemiBold,
            ontap2: () {},
          ),
          lvl_row(),
          lvl_row(
            title: 'Application of Knowledge',
            lvl: 'lvl 2',
            days: '1.5 days\n75%',
          ),
          lvl_row(
            title: 'Reasoned Advice & Expertise',
            lvl: 'lvl 3',
            days: '0 days\n0%',
          ),
        ]));
  }
}

class lvl_row extends StatelessWidget {
  final String? lvl, title, days;
  final double? value;
  const lvl_row({
    super.key,
    this.lvl,
    this.title,
    this.days,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            buttonContainer(
              borderColor: ksecondary,
              radius: 50,
              text: lvl ?? 'lvl 1',
              bgColor: kblackfill,
              vPadding: 1,
              hPadding: 12,
            ),
            Expanded(
              child: MyText(
                paddingLeft: 4,
                text: title ?? 'Knowledge & Understanding',
                size: 12,
                fontFamily: AppFonts.gilroyMedium,
              ),
            ),
            MyText(
              text: days ?? '0.5 days\n25%',
              size: 11,
              fontFamily: AppFonts.gilroyMedium,
              paddingTop: 18,
              paddingBottom: 10,
              textAlign: TextAlign.end,
            ),
          ],
        ),
        linearProgressIndicatorr(
          value: value,
        ),
      ],
    );
  }
}

//
class recent_activity_row extends StatelessWidget {
  final String? title, desc, lvl, date;
  const recent_activity_row({
    super.key,
    this.title,
    this.desc,
    this.lvl,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          Assets.imagesNewentry,
          width: 24,
          height: 24,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: TwoTextedColumn(
            text1: title ?? 'Building Surveying and Technology',
            text2: desc ?? 'Conducted detailed survey of Victorian',
            size1: 14,
            size2: 11,
            fontFamily: AppFonts.gilroyBold,
            fontFamily2: AppFonts.gilroyMedium,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          children: [
            buttonContainer(
              borderColor: ksecondary,
              radius: 50,
              text: lvl ?? 'lvl 2',
              bgColor: kblackfill,
              vPadding: 1,
              hPadding: 12,
            ),
            MyText(
              text: date ?? '25 mar 2025',
              size: 10,
              fontFamily: AppFonts.gilroyMedium,
              paddingTop: 8,
            )
          ],
        )
      ],
    );
  }
}
