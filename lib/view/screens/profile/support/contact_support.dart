import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Bounce(
          child: CustomeContainer(
            radius: 8,
            borderColor: getSecondaryColor(context),
            widget: Row(
              children: [
                Image.asset(
                  Assets.imagesHeadset,
                  width: 20,
                  color: getSecondaryColor(context),
                ),
                Expanded(
                    child: MyText(
                  text: 'Customer Service',
                  size: 16,
                  fontFamily: AppFonts.gilroyBold,
                  paddingLeft: 8,
                ))
              ],
            ),
            mbott: 20,
          ),
        ),
        Bounce(
          child: CustomeContainer(
            radius: 8,
            borderColor: getSecondaryColor(context),
            widget: Row(
              children: [
                Image.asset(
                  Assets.imagesGlobe,
                  width: 20,
                  color: getSecondaryColor(context),
                ),
                Expanded(
                    child: MyText(
                  text: 'Website',
                  size: 16,
                  fontFamily: AppFonts.gilroyBold,
                  paddingLeft: 8,
                ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
