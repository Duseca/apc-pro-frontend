import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

class TooltipIcon extends StatefulWidget {
  const TooltipIcon({super.key});

  @override
  State<TooltipIcon> createState() => _TooltipIconState();
}

class _TooltipIconState extends State<TooltipIcon> {
  SuperTooltipController? _tooltipController;

  @override
  void initState() {
    super.initState();
    _tooltipController = SuperTooltipController();
  }

  @override
  void dispose() {
    _tooltipController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SuperTooltip(
      controller: _tooltipController,
      hideTooltipOnBarrierTap: true,
      arrowTipDistance: 0,
      right: 40,
      elevation: 0,
      borderRadius: 10.0,
      borderColor: kborder,
      shadowColor: ktransparent,
      arrowLength: 5,
      hideTooltipOnTap: true,
      popupDirection: TooltipDirection.down,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.imagesQuestionmark,
            width: 18,
            height: 18,
            color: isDarkMode ? kwhite : kblack,
          ),
          MyText(
            paddingTop: 8,
            text:
                "Technical competencies vary by your\nselected RICS pathway.\nOnly the ones relevant to your path will be shown",
            color: getSecondaryColor(context),
            fontFamily: AppFonts.gilroyRegular,
            weight: FontWeight.w400,
          ),
        ],
      ),
      child: Image.asset(
        Assets.imagesQuestionmark,
        width: 18,
        height: 18,
        color: isDarkMode ? kwhite : kblack,
      ),
    );
  }
}
