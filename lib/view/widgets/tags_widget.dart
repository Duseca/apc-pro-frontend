
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';

class ServicesFilter extends StatelessWidget {
  final String tag;
  final Color? bgColor, defaultbgColor, textColor,borderColor;
  final VoidCallback? ontap;
  final bool? isSelected;
  final double? vpad, hpad;
 ServicesFilter(this.tag,
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
          padding: EdgeInsets.symmetric(horizontal: 7,vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
              color: klighblue,
              border: Border.all(color:borderColor?? ksecondary.withOpacity(0.5))
          ),
       
           child: MyText(
             text: tag,
             size: 10,
             color: textColor??ksecondary
           ),
          ),
        ));
  }
}
