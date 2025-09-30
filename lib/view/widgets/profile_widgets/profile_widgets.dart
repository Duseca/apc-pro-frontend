import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
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
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ksecondary,
                        blurRadius: 12,
                        spreadRadius: 2,
                        offset: Offset(0, 0),
                      ),
                    ],
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: kblueBorder2, width: 2)),
                child: CommonImageView(
                  url: dummyImage,
                  radius: 100,
                  width: 76,
                  height: 76,
                ),
              ),
              Positioned(
                  bottom: 3,
                  right: 5,
                  child: Bounce(
                      child: Image.asset(
                    Assets.imagesCamera,
                    width: 22,
                  )))
            ],
          ),
        ],
      ),
    );
  }
}

class profile_iinfo_widget extends StatelessWidget {
  final String? title, desc, icon;
  const profile_iinfo_widget({
    super.key,
    this.title,
    this.desc,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row_widget(
          title: title ?? 'Pathway',
          icon: icon ?? Assets.imagesNewbook,
          iconColor: Color(0xff94BFFF),
          iconSize: 16,
          texSize: 14,
          fontFamily: AppFonts.gilroyBold,
        ),
        MyText(
          color: Color(0xff94BFFF),
          paddingTop: 5,
          text: desc ?? 'Project Management',
          size: 12,
          fontFamily: AppFonts.gilroyRegular,
        ),
      ],
    );
  }
}

Widget buildDrawerItem(String title, String icon,
    {Color? contentColor, bool? hasIcon = false, bool? hasShadow = false,hasSwitch=false}) {
  return CustomeContainer(
    mbott: 22,
    borderColor: ksecondary,
    color: kblackfill,
    hasShadow: hasShadow ?? false,
    vpad: 15,
    hpad: 20,
    radius: 10,
    widget: Row(
      children: [
        Image.asset(
          icon,
          width: 20,
          height: 20,
          color: contentColor ?? klighblue,
        ),
        Expanded(
          child: MyText(
              paddingLeft: 8,
              text: title,
              size: 16,
              fontFamily: AppFonts.gilroyMedium,
              color: contentColor ?? klighblue),
        ),
        if(hasSwitch==true)
        SwitchButton2(
          isActive: true,
          onChanged: (value) {},
          //  scale: 0.4,
        ),
        if (hasIcon == true)
          Image.asset(
            Assets.imagesArrowdown2,
            width: 24,
            height: 24,
            color: contentColor ?? klighblue,
          )
      ],
    ),
  );
}
