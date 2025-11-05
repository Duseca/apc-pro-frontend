

import 'package:apc_pro/consts/app_colors.dart';
import 'package:flutter/material.dart';

class linearProgressIndicatorr extends StatelessWidget {
  final double? value,height;
  final Color? bgColor,valueColor;

  const linearProgressIndicatorr({
    super.key, this.value, this.bgColor, this.valueColor, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
                borderRadius: BorderRadius.circular(20),
                color: getSecondaryColor(context),
                minHeight: height??11,
                value:value?? 0.3,
                valueColor: AlwaysStoppedAnimation(valueColor??getSecondaryColor(context)),
                backgroundColor: bgColor?? getfifth(context),
              );
  }
}