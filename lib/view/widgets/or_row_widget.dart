

import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';

class or_row extends StatelessWidget {
  final String? title;
  const or_row({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: kborder,
            thickness: 1,
            indent: 5,
            endIndent: 15,
          ),
        ),
        MyText(
          text: title ?? 'Or Login with',
          size: 14,
          color: kblack.withOpacity(0.7),
          weight: FontWeight.w400,
          paddingLeft: 0,
          paddingRight: 0,
        ),
        Expanded(
          child: Divider(
            color: kborder,
            thickness: 1,
            indent: 15,
            endIndent: 5,
          ),
        ),
      ],
    );
  }
}