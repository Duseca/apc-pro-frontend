
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';

class TagsWidget extends StatelessWidget {
  final String tag;
  final Color? bgColor, defaultbgColor, textColor,borderColor;
  final VoidCallback? ontap;
  final bool? isSelected;
  final double? vpad, hpad;
 TagsWidget(this.tag,
      {Key? key,
      this.bgColor,
      this.textColor,
      this.ontap,
      this.isSelected,
      this.vpad,
      this.hpad,
      this.defaultbgColor, this.borderColor})
      : super(key: key);

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap ?? () {},
        child: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
              color: ktransparent,
              border: Border.all(color:borderColor?? ksecondary)
          ),
       
           child: MyText(
             text: tag,
             size: 11,
             fontFamily: AppFonts.gilroyMedium,
             color: textColor??kwhite
           ),
          ),
        ));
  }
}
