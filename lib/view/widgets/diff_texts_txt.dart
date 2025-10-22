import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/texts.dart';

class DiffTextsTxt extends StatelessWidget {
  final String? text1, text2, text3, text4;
  final VoidCallback? ontap;
  final double? size, size2, letterSpacing;
  final TextAlign? align;
  final FontWeight? weight1, weight2;
  final Color? color1, color2, color3, color4;
  final String? fontFamily, fontFamily2;
  const DiffTextsTxt({
    super.key,
    this.text1,
    this.text2,
    this.ontap,
    this.size,
    this.size2,
    this.weight1,
    this.weight2,
    this.align,
    this.color1,
    this.color2,
    this.letterSpacing,
    this.text3,
    this.text4,
    this.color3,
    this.color4,
    this.fontFamily,
    this.fontFamily2,
  });

  @override
  Widget build(BuildContext context) {
    return Texts(
      align: align,
      children: [
        TextSpan(
          children: [
            TextSpan(
              text: text1 ?? 'Already have an Account? ',
              style: TextStyle(
                  color: color1 ?? kgrey,
                  fontSize: size ?? 14,
                  fontWeight: weight1 ?? FontWeight.w400,
                  fontFamily: fontFamily ?? AppFonts.gilroyRegular,
                  letterSpacing: 0.5),
            ),
            TextSpan(
              text: text2 ?? 'Login',
              recognizer: TapGestureRecognizer()..onTap = ontap,
              style: TextStyle(
                  // shadows: [Shadow(color: ksecondary, offset: Offset(0, -2))],
                  color: color2 ?? ksecondary,
                  //decoration: TextDecoration.underline,
                  fontSize: size2 ?? 14,
                  fontWeight: weight2 ?? FontWeight.w600,
                  //decorationColor: ksecondary,
                  decorationThickness: 1,
                  decorationStyle: TextDecorationStyle.solid,
                  fontFamily: fontFamily2 ?? AppFonts.gilroyMedium,
                  letterSpacing: letterSpacing ?? 0.5
                  // height: 1.4, // Adjusts spacing between text and underline
                  ),
            ),
            if (text3 != null || text4 != null)
              TextSpan(
                text: text3 ?? 'Already have an Account? ',
                style: TextStyle(
                    color: color3 ?? kwhite,
                    fontSize: size2 ?? 14,
                    fontWeight: weight2 ?? FontWeight.w400,
                    fontFamily: fontFamily2 ?? AppFonts.gilroyBold,
                    letterSpacing: letterSpacing ?? 0.5),
              ),
            if (text4 != null)
              TextSpan(
                text: text4 ?? 'Already have an Account? ',
                style: TextStyle(
                    color: color4 ?? kwhite,
                    fontSize: size2 ?? 14,
                    fontFamily: fontFamily2 ?? AppFonts.gilroyMedium,
                    letterSpacing: letterSpacing ?? 0.5),
              ),
          ],
        ),
      ],
    );
  }
}
