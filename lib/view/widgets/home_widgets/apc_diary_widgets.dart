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
        color: getfillcolor(context),
        widget: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ExpandedRow(
            text1: 'Competency Progress',
            text2: 'View Details',
            size1: 14,
            size2: 12,
            weight1: FontWeight.bold,
            weight2: FontWeight.bold,
            isExpanded: true,
            fontFamily: AppFonts.gilroySemiBold,
            fontFamily2: AppFonts.gilroySemiBold,
            ontap2: () {},
          ),
          MyText(
            text: 'Building Surveying and Technology',
            size: 13,
            fontFamily: AppFonts.gilroyBold,
            paddingTop: 18,
            paddingBottom: 10,
          ),
          MyText(
            text: '2.0 days   2 entries   Avg M3.5   Last : 20 feb 2025',
            size: 13,
            fontFamily: AppFonts.gilroyMedium,
            paddingBottom: 10,
            color: getTertiary(context),
          ),
          linearProgressIndicatorr(
            height: 8,
            value: 0.5,
            bgColor: getsplashcolor(context),
          ),
          MyText(
            text: 'Building Defects',
            size: 13,
            fontFamily: AppFonts.gilroyBold,
            paddingTop: 18,
            paddingBottom: 10,
          ),
          MyText(
            text: '2.0 days   2 entries   Avg M3.5   Last : 20 feb 2025',
            size: 13,
            fontFamily: AppFonts.gilroyMedium,
            paddingBottom: 10,
            color: getTertiary(context),
          ),
          linearProgressIndicatorr(
            height: 8,
            value: 0.5,
            bgColor: getsplashcolor(context),
          ),
        ]));
  }
}

class newEntry_container extends StatelessWidget {
  final String? title, desc, icon, text3;
  final VoidCallback? ontap;
  final Color? borderColor, iconColor, bgColor;
  final String? suffixIcon;
  final bool? hasPrefix;
  final double? mbott, iconSize;
  const newEntry_container({
    super.key,
    this.title,
    this.desc,
    this.icon,
    this.text3,
    this.ontap,
    this.borderColor,
    this.suffixIcon,
    this.hasPrefix = true,
    this.mbott,
    this.iconColor,
    this.bgColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: ontap,
      child: CustomeContainer(
          mbott: mbott ?? 12,
          hpad: 15,
          color: bgColor ?? getfillcolor(context),
          radius: 8,
          borderColor: borderColor,
          widget:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                if (hasPrefix == true) ...{
                  Image.asset(
                    icon ?? Assets.imagesNewentry,
                    width: iconSize ?? 40,
                    height: iconSize ?? 40,
                    color: iconColor,
                  ),
                  SizedBox(
                    width: 18,
                  ),
                },
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TwoTextedColumn(
                        text1: title ?? 'New Entry',
                        text2: desc ?? 'Log new work experience',
                        size1: 14,
                        size2: 11,
                        fontFamily: AppFonts.gilroyBold,
                        fontFamily2: AppFonts.gilroyMedium,
                        color2: getTertiary(context),
                      ),
                      if (text3 != null)
                        MyText(
                          text: text3!,
                          size: 11,
                          fontFamily: AppFonts.gilroyMedium,
                          paddingTop: 6,
                          color: getSecondaryColor(context),
                        )
                    ],
                  ),
                ),
                if (suffixIcon != null || hasPrefix == false)
                  Image.asset(
                    suffixIcon ?? Assets.imagesExport,
                    width: 20,
                    height: 20,
                    color: iconColor,
                  )
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
        color: getfillcolor(context),
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
            lvl: 'M2',
            days: '1.5 days\n75%',
          ),
          lvl_row(
            title: 'Reasoned Advice & Expertise',
            lvl: 'M3',
            days: '0 days\n0%',
            value: 0,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        children: [
          Row(
            children: [
              buttonContainer(
                radius: 50,
                text: lvl ?? 'M1',
                bgColor: getsplashcolor(context),
                txtColor: getSecondaryColor(context),
                vPadding: 10,
                hPadding: 10,
                fontFamily: AppFonts.gilroySemiBold,
              ),
              Expanded(
                child: MyText(
                  paddingLeft: 4,
                  text: title ?? 'Knowledge & Understanding',
                  size: 13,
                  fontFamily: AppFonts.gilroyMedium,
                ),
              ),
              MyText(
                text: days ?? '0.5 days\n25%',
                size: 12,
                fontFamily: AppFonts.gilroyMedium,
                paddingTop: 18,
                paddingBottom: 10,
                textAlign: TextAlign.end,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: linearProgressIndicatorr(
                  height: 8,
                  value: value,
                  bgColor: getsplashcolor(context),
                ),
              ),
            ],
          ),
        ],
      ),
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
          width: 40,
          height: 40,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: TwoTextedColumn(
            text1: title ?? 'Building Surveying and Technology',
            text2: desc ?? 'Conducted detailed survey of Victorian',
            size1: 14,
            size2: 12,
            fontFamily: AppFonts.gilroyBold,
            fontFamily2: AppFonts.gilroyMedium,
            color2: getTertiary(context),
            maxLines: 4,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          children: [
            buttonContainer(
              radius: 50,
              text: lvl ?? 'M2',
              bgColor: getsplashcolor(context),
              vPadding: 1,
              txtColor: getSecondaryColor(context),
              hPadding: 10,
            ),
            MyText(
              text: date ?? '25 mar 2025',
              size: 12,
              fontFamily: AppFonts.gilroyMedium,
              paddingTop: 8,
              color: getTertiary(context),
            )
          ],
        )
      ],
    );
  }
}
