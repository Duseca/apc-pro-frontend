import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/switch_button.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class AddProfileImg extends StatelessWidget {
  const AddProfileImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CommonImageView(
                url: dummyImage,
                radius: 100,
                width: 76,
                height: 76,
              ),
              Positioned(
                  bottom: 0,
                  right: 5,
                  child: Bounce(
                      child: Image.asset(
                    isDarkMode ? Assets.imagesDcamera : Assets.imagesLcamera,
                    width: 22,
                  )))
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildDrawerItem(String title, BuildContext context,
    {Color? contentColor,
    bool? hasIcon = false,
    bool? hasShadow = false,
    hasSwitch = false,
    String? icon}) {
  return Row(
    children: [
      if (icon != null)
        Image.asset(
          icon,
          width: 20,
          height: 20,
          color: contentColor ?? getSecondaryColor(context),
        ),
      Expanded(
        child: MyText(
            paddingLeft: icon != null ? 8 : 0,
            text: title,
            size: 14,
            fontFamily: AppFonts.gilroyMedium,
            color: contentColor ?? getSecondaryColor(context)),
      ),
      if (hasSwitch == true)
        SwitchButton2(
          isActive: true,
          onChanged: (value) {},
          //  scale: 0.4,
        ),
      if (hasIcon == true)
        Image.asset(Assets.imagesArrowright2,
            width: 15, height: 15, color: contentColor ?? getTertiary(context))
    ],
  );
}

class notification_pref_row extends StatelessWidget {
  final String? title, desc;
  final bool? value, hasSwitch,isDefault;
  final String? fontFamily;
  const notification_pref_row({
    super.key,
    this.title,
    this.desc,
    this.value,
    this.hasSwitch = true, this.isDefault=false, this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (desc != null)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: title ?? 'Push Notifications',
                  size: 16,
                  fontFamily:fontFamily?? AppFonts.gilroyBold,
                ),
                MyText(
                  text: desc ?? 'System notifications enabled',
                  size: 14,
                  fontFamily: AppFonts.gilroyRegular,
                  color: getTertiary(context),
                )
              ],
            ),
          ),
        if (desc == null)
          Expanded(
            child: MyText(
              text: title ?? 'Push Notifications',
              size: 16,
              fontFamily: AppFonts.gilroyMedium,
            ),
          ),
        if (hasSwitch == true)
          CustomSwitch(
            initialValue: value ?? true,
            onChanged: (bool value) {},
          ),
        if (hasSwitch == false)...{
       if(isDefault==true)
          MyText(
            text: 'Default',
            color: getTertiary(context),
            paddingRight: 8,
          ),
        Image.asset(
          Assets.imagesArrowright2,
          width: 12,
          height: 12,
          color: getSecondaryColor(context).withOpacity(0.3),
        )
        }
      ],
    );
  }
}
