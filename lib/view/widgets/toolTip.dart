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
    return SuperTooltip(
      controller: _tooltipController,
      hideTooltipOnBarrierTap: true,
      arrowTipDistance: 0,
      right: 40,
      elevation: 0,
      borderRadius: 10.0,
      borderColor: ksecondary,
      shadowColor: ktransparent,
      arrowLength: 5,
      hideTooltipOnTap: true,
      popupDirection: TooltipDirection.down,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: "Preliminary Review",
            color: kwhite,
            size: 15,
            fontFamily: AppFonts.gilroyBold,
            paddingBottom: 10,
            weight: FontWeight.w700,
          ),
          MyText(
            text:
                "Preparing documents and evidence for the\npreliminary review process before\nstarting structured training.",
            color: kwhite,
            fontFamily: AppFonts.gilroyBold,
            weight: FontWeight.w400,
          ),
        ],
      ),
      child: Image.asset(
        Assets.imagesQuestionmark,
        width: 18,
        height: 18,
        color: ksecondary,
      ),
    );
  }
}
