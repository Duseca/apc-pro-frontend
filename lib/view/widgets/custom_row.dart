
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';




class row_widget extends StatelessWidget {
  final String? icon, title;
  final Color? textColor, iconColor;
  final double? texSize, iconSize,lpad,rpad;
  final FontWeight? weight;
  final IconData? iconData;
  final VoidCallback? onTap;
  final bool isIconRight;
  final Widget? customWidget;
  final String? fontFamily;
final int? maxLines;
  const row_widget({
    super.key,
    this.icon,
    this.title,
    this.textColor,
    this.texSize,
    this.iconData,
    this.iconColor,
    this.weight,
    this.iconSize,
    this.onTap,
    this.isIconRight = false,
    this.customWidget, this.lpad, this.rpad, this.maxLines, this.fontFamily, 
  });

  @override
  Widget build(BuildContext context) {
    final Widget iconWidget = icon != null
        ? Bounce(
            onTap: onTap ?? () {},
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              icon!,
              width: iconSize ?? 24,
              height: iconSize ?? 24,
              color: iconColor,
            ),
          )
        : iconData != null
            ? Icon(
                iconData,
                color: iconColor ?? textColor,
                size: iconSize ?? 24,
              )
            : customWidget ?? const SizedBox.shrink();

    final Widget textWidget = MyText(
      text: title ?? '',
      color: textColor ?? kwhite,
      size: texSize ?? 14,
      paddingLeft: isIconRight ? 0 :lpad?? 5,
      paddingRight: isIconRight ?rpad?? 5 : 0,
      weight: weight ?? FontWeight.w400,
      onTap: onTap,
      maxLines: maxLines??1,
      fontFamily: fontFamily,
      textOverflow: TextOverflow.ellipsis,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: isIconRight
          ? [textWidget, iconWidget]
          : [iconWidget, textWidget],
    );
  }
}
