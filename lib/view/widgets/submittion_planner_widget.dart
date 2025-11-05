


import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:flutter/material.dart';

class active_task_container extends StatelessWidget {
  final String? text1, text2, time;
  const active_task_container({
    super.key,
    this.text1,
    this.text2,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      mbott: 12,
      radius: 8,
      color: getfillcolor(context),
      vpad: 17,
      hpad: 17,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: TwoTextedColumn(
                text1: text1 ?? '',
                text2: text2 ?? '',
                size1: 14,
                size2: 12,
                fontFamily: AppFonts.gilroySemiBold,
                fontFamily2: AppFonts.gilroyMedium,
              )),
              buttonContainer(
                text: 'ACTIVE',
                textsize: 11,
                vPadding: 4,
                hPadding: 10,
                txtColor: kgreen,
                imagePath: Assets.imagesError,
                iconColor: kgreen,
                imageSize: 10,
                bgColor: kgreen.withOpacity(0.1),
                radius: 4,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              row_widget(
                icon: Assets.imagesClock,
                iconSize: 14,
                title: time ?? '1h 23m elapsed',
                iconColor: getTertiary(context),
                texSize: 11,
                fontFamily: AppFonts.gilroyMedium,
              ),
              Row(
                spacing: 5,
                children: [
                  buttonContainer(
                    text: 'Resume',
                    textsize: 11,
                    vPadding: 6,
                    hPadding: 10,
                    txtColor: getSecondaryColor(context),
                    borderColor: getSecondaryColor(context),
                    bgColor: ktransparent,
                    radius: 8,
                  ),
                  buttonContainer(
                    text: 'Stop',
                    textsize: 11,
                    vPadding: 6,
                    hPadding: 10,
                    txtColor: getSecondaryColor(context),
                    bgColor: getfifth(context),
                    radius: 8,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
