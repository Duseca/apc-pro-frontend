
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:apc_pro/consts/app_colors.dart';



import 'my_text_widget.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    this.onTap,
    this.width,
    this.buttonText,
    this.height = 56,
    this.backgroundColor,
    this.fontColor,
    this.fontSize = 16,
    this.outlineColor = Colors.transparent,
    this.radius =12,
    this.svgIcon,
    this.isleft = false,
    this.hasgrad = false,
    this.mBottom = 0,
    this.mhoriz = 0,
    this.mTop=0,
    this.hpad=0,
    this.vpad=0,
    this.fontWeight = FontWeight.bold,
    this.icon,
    this.image,
    this.iconSize = 24,
    this.iconPosition = IconPosition.left,
    this.imgColor,
    this.cornerIcon = false,
    this.hasShadow,
    this.opacity,
    this.fontFamily
  });

  final String? buttonText;
  final VoidCallback? onTap;
  final double? height, width;
  final double radius;
  final double fontSize;
  final Color outlineColor;
  final Color? imgColor;
  bool? isleft, hasgrad, cornerIcon, hasShadow = false;

  final Color? backgroundColor, fontColor;
  final String? svgIcon;
  final IconData? icon;
  final String? image;
  final double iconSize;
  final double? opacity;
  final IconPosition iconPosition;
final String? fontFamily;
  final double mhoriz, mBottom,mTop,vpad,hpad;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [ShimmerEffect(duration: Duration(milliseconds: 300))],
      child: Bounce(
        duration: Duration(milliseconds: 200),
       onTap: onTap ?? () {},
        child: Opacity(
          opacity:opacity??1 ,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: hpad,vertical: vpad),
            margin: EdgeInsets.only(left: mhoriz, right: mhoriz, bottom: mBottom,top: mTop),
            height: height,
            width: width,
            decoration: hasgrad == true
                ? BoxDecoration(
                   // gradient: kbuttongrad,
                   color: ksecondary,
                    border: Border.all(color: outlineColor),
                    borderRadius: BorderRadius.circular(radius),
                    boxShadow: [
                      BoxShadow(
                        color: ksecondary.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 02),
                      ),
                    ],
                  )
                : BoxDecoration(
                    color: backgroundColor ?? ksecondary,
                    border: Border.all(color: outlineColor),
                    borderRadius: BorderRadius.circular(radius),
                    boxShadow: hasShadow == true
                        ? [
                                   BoxShadow(
                      color: kgrey.withOpacity(0.08),
                      spreadRadius: 0.5,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                          ]
                        : [],
                  ),
            child: Align(
              alignment: isleft == true ? Alignment.centerLeft : Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: cornerIcon == true
                    ? MainAxisAlignment.spaceBetween // ✅ Moves icon to corner
                    : (isleft == true
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center),
                children: [
                  if (icon != null && iconPosition == IconPosition.left)
                    Padding(
                      padding: EdgeInsets.only(
                          left: cornerIcon == true
                              ? 10.0
                              : 8.0), 
                      child: Icon(icon, color: fontColor, size: iconSize),
                    ),
                  if (image != null && iconPosition == IconPosition.left)
                    Padding(
                      padding:
                          EdgeInsets.only(left: cornerIcon == true ? 10.0 : 8.0),
                      child:
                          Image.asset(image!, height: iconSize, width: iconSize,color: imgColor,),
                    ),
                  if (buttonText != null)
                    MyText(
                      text: buttonText!,
                      size: fontSize,
                      color: fontColor ?? kwhite,
                      weight: fontWeight,
                      fontFamily: fontFamily,
                      paddingLeft: isleft == true ? 10 : 0,
                    ),
                  if (icon != null && iconPosition == IconPosition.right)
                    Padding(
                      padding: EdgeInsets.only(
                          right: cornerIcon == true
                              ? 10.0
                              : 8.0), // ✅ Adjust for corners
                      child: Icon(icon, color: fontColor, size: iconSize),
                    ),
                  if (image != null && iconPosition == IconPosition.right)
                    Padding(
                      padding:
                          EdgeInsets.only(right: cornerIcon == true ? 10.0 : 8.0),
                      child:
                          Image.asset(image!, height: iconSize, width: iconSize,color: imgColor,),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum IconPosition { left, right }



//

