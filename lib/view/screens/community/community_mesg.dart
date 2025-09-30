import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class CommunityMesg extends StatelessWidget {
  const CommunityMesg({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Messages',
          size: 22,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 25,
        ),
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: mesg_tile(),
            );
          },
        ),
      ],
    );
  }
}

class mesg_tile extends StatelessWidget {
  final String? title, desc, time, icon;
  final VoidCallback? ontap;
  final bool? hasTime;
  final Color? borderColor;
  const mesg_tile({
    super.key,
    this.title,
    this.desc,
    this.time,
    this.icon,
    this.ontap,
    this.hasTime = true, this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: ontap,
      child: CustomeContainer(
          radius: 8,
          vpad: 10,
          hpad: 14,
          borderColor:borderColor?? ksecondary,
          color: kblackfill,
          widget:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonImageView(
                  imagePath: icon ?? Assets.imagesS,
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TwoTextedColumn(
                    text1: title ?? 'Alex Johnson',
                    text2: desc ?? 'Thanks for the case study help!',
                    size1: 14,
                    size2: 11,
                    fontFamily: AppFonts.gilroyBold,
                    fontFamily2: AppFonts.gilroyMedium,
                  ),
                ),
                if (hasTime == true) ...{
                  SizedBox(
                    width: 5,
                  ),
                  row_widget(
                    title: time ?? '2 mins ago',
                    icon: Assets.imagesClock,
                    iconSize: 16,
                    iconColor: klighblue,
                    texSize: 11,
                  )
                }
              ],
            )
          ])),
    );
  }
}
