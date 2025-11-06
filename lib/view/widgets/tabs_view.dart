import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:get/get.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({
    super.key,
    required this.currentindex,
    this.ontap,
    required this.items,
    this.isexpanded,
    this.height,
    this.textSize,
    this.bgColor,
    this.margin,

    /// 🔹 New fields for icon-only tabs
    this.useIcons = false,
    this.iconItems,
    this.iconSize = 22,
  });

  final int currentindex;
  final void Function(int)? ontap;
  final List<String> items;
  final bool? isexpanded;
  final double? height, margin;
  final Color? bgColor;
  final double? textSize;

  /// 🔹 New for icons
  final bool useIcons;
  final List<String>? iconItems; // expects list of asset paths
  final double iconSize;

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

int current = 0;

class _TabsWidgetState extends State<TabsWidget> {
  void _onTap(int index) {
    if (widget.ontap != null) {
      widget.ontap!(index);
    } else {
      setState(() {
        current = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isexpanded == false
        ? Container(
            height: widget.height ?? 46,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: widget.bgColor ?? ktransparent,
              border: Border.all(color: ktransparent),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.items.length,
                  (index) {
                    return GestureDetector(
                      onTap: () => _onTap(index),
                      child: AnimatedContainer(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6),
                        margin: EdgeInsets.symmetric(
                            horizontal: widget.margin ?? 6, vertical: 4),
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: widget.currentindex == index
                              ? getSecondaryColor(context)
                              : ktransparent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: widget.useIcons
                              ? Image.asset(
                                  widget.iconItems![index],
                                  width: widget.iconSize,
                                  height: widget.iconSize,
                                  color: widget.currentindex == index
                                      ? getsplashcolor(context)
                                      : getsplashcolor(context)
                                          .withOpacity(0.6),
                                )
                              : MyText(
                                  text: widget.items[index],
                                  textAlign: TextAlign.center,
                                  size: widget.textSize ?? 11,
                                  fontFamily: AppFonts.gilroySemiBold,
                                  color: widget.currentindex == index
                                      ? getsplashcolor(context)
                                      : getSecondaryColor(context),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
            child: Container(
              height: widget.height ?? 52,
              margin: const EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: widget.bgColor ?? ktransparent,
                border: Border.all(color: ktransparent),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: List.generate(
                        widget.items.length,
                        (index) {
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => _onTap(index),
                              child: AnimatedContainer(
                                padding: EdgeInsets.all(0),
                                margin: EdgeInsets.symmetric(
                                    vertical: widget.margin ?? 5,
                                    horizontal: 2),
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  color: widget.currentindex == index
                                      ? getSecondaryColor(context)
                                      : ktransparent,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: widget.useIcons
                                      ? Image.asset(
                                          widget.iconItems![index],
                                          width: widget.iconSize,
                                          height: widget.iconSize,
                                          color: widget.currentindex == index
                                              ? getsplashcolor(context)
                                              : getTertiary(context),
                                        )
                                      : MyText(
                                          text: widget.items[index],
                                          textAlign: TextAlign.center,
                                          size: widget.textSize ?? 11.5,
                                          fontFamily: AppFonts.gilroySemiBold,
                                          color: widget.currentindex == index
                                              ? getsplashcolor(context)
                                              : getSecondaryColor(context),
                                        ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

/////

class MyTabbar extends StatelessWidget {
  final TabController? controller;
  final bool? hasborder;
  final double? indicatorpadd;
  final Color? dividerColor;
  final Color? sLabel, label2;
  final FontWeight? labelWeight;
  final TabBarIndicatorSize? indicator;
  const MyTabbar(
      {super.key,
      required this.items,
      this.controller,
      this.hasborder = false,
      this.indicatorpadd,
      this.dividerColor,
      this.sLabel,
      this.label2,
      this.indicator,
      this.labelWeight});
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
          color: ktransparent, border: Border.all(color: ktransparent)),
      child: TabBar(
        isScrollable: hasborder == true ? true : false,
        tabAlignment: hasborder == true ? TabAlignment.start : null,
        automaticIndicatorColorAdjustment: false,
        dividerColor: dividerColor ?? ktransparent,
        // dividerHeight: 2,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: labelWeight ?? FontWeight.w400,
          fontFamily: AppFonts.gilroyBold,
          color: sLabel ?? kheading,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: labelWeight ?? FontWeight.w400,
          fontFamily: AppFonts.gilroyBold,
          color: label2 ?? getTertiary(context),
        ),
        //isScrollable: true,
        // tabAlignment: TabAlignment.start,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        indicatorPadding: EdgeInsets.symmetric(
            horizontal: hasborder == true ? 0 : indicatorpadd ?? 0),
        labelPadding:
            EdgeInsets.symmetric(horizontal: hasborder == true ? 10 : 0),
        controller: controller,
        indicatorWeight: 4,

        splashBorderRadius: BorderRadius.circular(10),

        //labelPadding: EdgeInsets.all(),
        indicatorColor: getSecondaryColor(context),
        indicatorSize: indicator ?? TabBarIndicatorSize.label,
        //      labelPadding: EdgeInsets.symmetric(horizontal: 3),
        tabs: List.generate(
          items.length,
          (index) => Tab(
            iconMargin: EdgeInsets.all(0),
            text: items[index],
          ),
        ),
      ),
    );
  }
}
