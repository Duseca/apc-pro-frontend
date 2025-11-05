


import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';





// ignore: must_be_immutable
class MyText extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String text;
  final String? fontFamily;
  final TextAlign? textAlign;
  final TextDecoration decoration;
  final FontWeight? weight;
  final TextOverflow? textOverflow;
  final Color? color;
  final FontStyle? fontStyle;
  final VoidCallback? onTap;
  List<Shadow>? shadow;
  final int? maxLines;
  final double? size;
  final double? lineHeight;
  final double? paddingTop;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;
  final double? letterSpacing;
final Color? bgColor;
  MyText({
    Key? key,
    required this.text,
    this.size,
    this.lineHeight,
    this.maxLines = 100,
    this.decoration = TextDecoration.none,
    this.color,
    this.letterSpacing,
    this.weight = FontWeight.w400,
    this.textAlign,
    this.textOverflow,
    this.fontFamily,
    this.paddingTop = 0,
    this.paddingRight = 0,
    this.paddingLeft = 0,
    this.paddingBottom = 0,
    this.onTap,
    this.shadow,
    this.fontStyle, this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop!,
        left: paddingLeft!,
        right: paddingRight!,
        bottom: paddingBottom!,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          "$text",
          style: TextStyle(
            shadows: shadow,
            fontSize: size ?? 12,
            color: color ??getSecondaryColor(context),
            fontWeight: weight,
            decoration: decoration,
            decorationColor:color??getSecondaryColor(context),
            decorationThickness: 1,
            fontFamily: fontFamily ??AppFonts.gilroyRegular,
            height: lineHeight,
            fontStyle: fontStyle,
            backgroundColor:bgColor ,
            letterSpacing: letterSpacing??0.8,
          ),
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: textOverflow,
        ),
      ),
    );
  }
}


class UnderlineText extends StatelessWidget {
  final String? title;
  final VoidCallback? ontap;
  const UnderlineText({super.key, this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Bounce(
     onTap: ontap,
      child: Text(
                   title?? 'Get Help',
                    style: TextStyle(
                        shadows: [Shadow(color: ksecondary, offset: Offset(0, -2))],
                        color: ktransparent,
                        decoration: TextDecoration.underline,
                        decorationColor: ksecondary,
                        decorationThickness: 1,
                        decorationStyle: TextDecorationStyle.solid,
                        fontFamily: AppFonts.gilroyBold,
                        //fontFamily: AppFonts.gilroyMedium,
                        fontSize: 14),
                  ),
    );
  }
}