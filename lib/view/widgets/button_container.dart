import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';

import 'my_text_widget.dart';

class buttonContainer extends StatelessWidget {
  final Color? bgColor;
  final String? text;
  final IconData? icon;
  final VoidCallback? onTap;
  final Color? txtColor;
  final Color? iconColor;
  final double? hPadding;
  final double? vPadding, mhor, mvert;
  final Color? borderColor;
  final double? radius;
  final String? imagePath;
  final double? iconSize;
  final double? imageSize;
  final double? heigth, lpad;
  final double? textsize, borderWidth;
  final bool? iscenter, isspacebetween, hasGrad;
  final bool? iconOnRight, useCustomFont;
  final FontWeight? weight;
  final String? fontFamily;
  // New parameter

  const buttonContainer({
    super.key,
    this.bgColor,
    this.text,
    this.icon,
    this.onTap,
    this.txtColor,
    this.iconColor,
    this.hPadding,
    this.borderColor,
    this.radius,
    this.vPadding,
    this.imagePath,
    this.iconSize,
    this.imageSize,
    this.heigth,
    this.textsize,
    this.lpad,
    this.iscenter = true,
    this.iconOnRight = false,
    this.weight,
    this.isspacebetween,
    this.useCustomFont,
    this.mhor,
    this.mvert,
    this.hasGrad = false,
    this.borderWidth,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap ?? () {},
      duration: Duration(milliseconds: 200),
      child: Container(
        height: heigth,
        margin:
            EdgeInsets.symmetric(horizontal: mhor ?? 0, vertical: mvert ?? 0),
        padding: EdgeInsets.symmetric(
          horizontal: hPadding ?? 10,
          vertical: vPadding ?? 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 20),
          // gradient: hasGrad==true?kbuttongrad:null,
          color: hasGrad == false ? bgColor ?? const Color(0xffF3EBF6) : null,
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 1),
        ),
        child: Row(
          mainAxisAlignment: iscenter == true
              ? MainAxisAlignment.center
              : (isspacebetween == true
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start),
          children: [
            if (iconOnRight == false)
              ..._buildIconOrImage(), // Add icon/image on the left if iconOnRight is false
            if (text != null)
              MyText(
                text: text!,
                color: txtColor ?? getSecondaryColor(context),
                size: textsize ?? 13,
                weight: weight ?? FontWeight.w600,
                fontFamily: fontFamily,
                paddingLeft:
                    (icon != null || imagePath != null) ? lpad ?? 3 : 0,
              ),
            if (iconOnRight == true)
              ..._buildIconOrImage(), // Add icon/image on the right if iconOnRight is true
          ],
        ),
      ),
    );
  }

  // Helper method to build icon or image widgets
  List<Widget> _buildIconOrImage() {
    return [
      if (imagePath != null)
        Image.asset(
          imagePath!,
          fit: BoxFit.contain,
          width: imageSize ?? 18,
          height: imageSize ?? 18,
          color: iconColor ?? null,
        )
      else if (icon != null)
        Icon(
          icon!,
          size: iconSize ?? 18,
          color: iconColor ?? null,
        ),
    ];
  }
}
