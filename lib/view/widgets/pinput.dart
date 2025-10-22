import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';

import 'package:pinput/pinput.dart';

class MyPinCode extends StatefulWidget {
  final Function(String) onChanged;
  final Function(String) onCompleted;
  final Color? color, fillcolor, borderColor;
  final double? width, heigth, margin, fontsize;
  final bool? showPlaceholder;
  final int? fieldCount;
  const MyPinCode(
      {super.key,
      required this.onChanged,
      required this.onCompleted,
      this.color,
      this.width,
      this.heigth,
      this.fieldCount,
      this.margin,
      this.fillcolor,
      this.borderColor,
      this.showPlaceholder = false,
      this.fontsize});

  @override
  State<MyPinCode> createState() => _MyPinCodeState();
}

class _MyPinCodeState extends State<MyPinCode> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: widget.width ?? 51,
      height: widget.heigth ?? 51,
      margin: EdgeInsets.all(widget.margin ?? 0),
      textStyle: TextStyle(
        fontSize: widget.fontsize ?? 22,
        color: widget.color ?? kwhite,
        fontFamily: AppFonts.gilroyMedium,
        //fontFamily: AppFonts.gilroyBold
      ),
      decoration: BoxDecoration(
        color: widget.fillcolor ?? getfillcolor(context),
        // border: Border.all(color: ksecondary),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: widget.fillcolor ?? ktransparent,
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(
        //   color: widget.borderColor ?? ksecondary,
        // ),
      ),
    );

    return Pinput(
      length: widget.fieldCount ?? 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: widget.fillcolor ?? ktransparent,
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(
          //   color: widget.borderColor ?? ksecondary,
          // ),
        ),
      ),
      preFilledWidget: widget.showPlaceholder == true
          ? Text(
              '-',
              style: TextStyle(
                  fontSize: 20,
                  color: widget.color?.withOpacity(0.5) ?? kblack,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.gilroyBold),
            )
          : null,
      onChanged: widget.onChanged,
      onCompleted: widget.onCompleted,
    );
  }
}
