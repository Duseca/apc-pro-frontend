import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';

import 'my_text_widget.dart';

class ExpandedRow extends StatelessWidget {
  final String text1;
  final String text2;
  final Color? color1;
  final Color? color2;
  final FontWeight? weight1;
  final FontWeight? weight2;
  final double? size1;
  final bool? isExpanded;
  final double? size2;
  final String? fontFamily, fontFamily2;
  final VoidCallback? ontap1, ontap2;
  final TextDecoration? decoration1, decoration2;
  const ExpandedRow({
    super.key,
    required this.text1,
    required this.text2,
    this.color1,
    this.color2,
    this.weight1,
    this.weight2,
    this.size1,
    this.size2,
    this.ontap2,
    this.ontap1,
    this.decoration1,
    this.decoration2,
    this.isExpanded = false,
    this.fontFamily,
    this.fontFamily2,
  });

  @override
  Widget build(BuildContext context) {
    return isExpanded == true
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: MyText(
                  text: text1, //'\$39.69',
                  size: size1 ?? 12.5,
                  color: color1 ?? getSecondaryColor(context),
                  weight: weight1 ?? FontWeight.w500,
                  onTap: ontap1,
                  fontFamily: fontFamily,
                  decoration: decoration1 ?? TextDecoration.none,
                ),
              ),
              Expanded(
                child: MyText(
                  text: text2, //'Free Now Booking Fee',
                  size: size2 ?? 12.5,
                  color: color2 ?? getSecondaryColor(context),
                  weight: weight2 ?? FontWeight.w500,
                  onTap: ontap2,
                  fontFamily: fontFamily2,
                  decoration: decoration2 ?? TextDecoration.none,
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: text1, //'\$39.69',
                size: size1 ?? 12.5,
                color: color1 ?? getSecondaryColor(context),
                weight: weight1 ?? FontWeight.w500,
                onTap: ontap1,
                fontFamily: fontFamily,
                decoration: decoration1 ?? TextDecoration.none,
              ),
              MyText(
                text: text2, //'Free Now Booking Fee',
                size: size2 ?? 12.5,
                color: color2 ?? getSecondaryColor(context),
                weight: weight2 ?? FontWeight.w500,
                onTap: ontap2,
                fontFamily: fontFamily2,
                decoration: decoration2 ?? TextDecoration.none,
              ),
            ],
          );
  }
}

enum ColumnAlignment { start, end, center }

class TwoTextedColumn extends StatelessWidget {
  final String text1;
  final String text2;
  final Color? color1;
  final Color? color2;
  final FontWeight? weight1;
  final FontWeight? weight2;
  final double? size1;
  final double? size2, mBottom;
  final ColumnAlignment alignment;
  final bool? isExpanded;
  final TextDecoration? decoration1, decoration2;
  final String? fontFamily, fontFamily2;
  final TextAlign? align;
  final int? maxLines;
  final double? lineHeight;
  const TwoTextedColumn({
    super.key,
    required this.text1,
    required this.text2,
    this.color1,
    this.color2,
    this.weight1,
    this.weight2,
    this.size1,
    this.size2,
    this.alignment = ColumnAlignment.start,
    this.mBottom,
    this.decoration1,
    this.decoration2,
    this.fontFamily,
    this.isExpanded,
    this.align,
    this.maxLines,
    this.fontFamily2,
    this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    // Map alignment choice to CrossAxisAlignment
    final crossAxisAlignment = {
      ColumnAlignment.start: CrossAxisAlignment.start,
      ColumnAlignment.end: CrossAxisAlignment.end,
      ColumnAlignment.center: CrossAxisAlignment.center,
    }[alignment]!; // Use ! to ensure a non-null value

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        MyText(
          text: text1,
          size: size1 ?? 14,
          color: color1 ?? getSecondaryColor(context),
          weight: weight1 ?? FontWeight.w500,
          paddingBottom: mBottom ?? 3,
          textAlign: align,
          fontFamily: fontFamily,
          maxLines: maxLines,
          decoration: decoration1 ?? TextDecoration.none,
          textOverflow: TextOverflow.ellipsis,
        ),
        MyText(
          text: text2,
          size: size2 ?? 14,
          color: color2 ?? getSecondaryColor(context),
          // weight: weight2 ?? FontWeight.w400,
          maxLines: maxLines ?? 10,
          textAlign: align,
          fontFamily: fontFamily2,
          textOverflow: TextOverflow.ellipsis,
          decoration: decoration2 ?? TextDecoration.none,
          lineHeight: lineHeight ?? 1.5,
        ),
      ],
    );
  }
   
}
