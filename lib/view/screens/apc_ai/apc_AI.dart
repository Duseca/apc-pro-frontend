import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/mesg_tiles.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApcAi extends StatelessWidget {
  const ApcAi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 19, horizontal: 19),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          color: kbackground,
          border: Border(top: BorderSide(color: ksecondary))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 19,
              ),
              MyText(
                text: 'AI Assistant',
                size: 22,
                fontFamily: AppFonts.gilroyBold,
              ),
              Bounce(
                onTap: () {
                  Get.back();
                },
                  child: Image.asset(
                Assets.imagesCross,
                width: 14,
              ))
            ],
          ),
          MyText(
            text: 'Quick Actions',
            size: 16,
            fontFamily: AppFonts.gilroyMedium,
            paddingTop: 14,
            paddingBottom: 14,
          ),
          Padding(
          padding: const EdgeInsets.only(right: 30),
            child: Row(
              spacing: 30,
              children: [
                Expanded(child: Ai_widget()),
                Expanded(
                  child: Ai_widget(
                    title: 'Diary Help',
                    icon: Assets.imagesDiary,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              spacing: 30,
              children: [
                Expanded(
                  child: Ai_widget(
                    title: 'Competencies',
                    icon: Assets.imagesTarget,
                  ),
                ),
                Expanded(
                  child: Ai_widget(
                    title: 'Tips',
                    icon: Assets.imagesBulb,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30,),
          MessageTile(
              isSentBy: false,
              message:
                  "Hi! I'm your APC Pro AI assistant. I'm here to help with your quantity surveying journey. How can I assist you today?"),
          SizedBox(
            height: 100,
          ),
          MyTextField(
            hint: 'Ask Apc Pro AI',
            hintColor: klighblue,
            bordercolor: ksecondary,
            filledColor: kbluefilled2,
            radius: 10,
            suffixIcon: Image.asset(
              Assets.imagesSend,
              width: 24,
            ),
          )
        ],
      ),
    );
  }
}

class Ai_widget extends StatelessWidget {
  final String? title, icon;
  final VoidCallback? ontap;
  const Ai_widget({
    super.key,
    this.title,
    this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: ontap,
      duration: Duration(milliseconds: 10),
      child: CustomeContainer(
        radius: 8,
        vpad: 8,
        hpad: 9,
        color: kblackfill,
        borderColor: Color(0xff4285F4),
        widget: row_widget(
          title: title ?? 'Study Plan',
          texSize: 12,
          fontFamily: AppFonts.gilroyMedium,
          icon: icon ?? Assets.imagesStudytool,
          iconColor: klighblue,
          iconSize: 18,
        ),
      ),
    );
  }
}
