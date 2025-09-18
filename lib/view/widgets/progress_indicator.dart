

import 'package:apc_pro/consts/app_colors.dart';
import 'package:flutter/material.dart';

class linearProgressIndicatorr extends StatelessWidget {
  final double? value;
  final Color? bgColor,valueColor;
  const linearProgressIndicatorr({
    super.key, this.value, this.bgColor, this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
                borderRadius: BorderRadius.circular(20),
                color: kblueBorder2,
                minHeight: 12,
                value:value?? 0.3,
                valueColor: AlwaysStoppedAnimation(kblueBorder2),
                backgroundColor:   kblueBorder2.withOpacity(0.49),
              );
  }
}