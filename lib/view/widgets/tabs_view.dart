import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({
    super.key,
    required this.currentindex,
    this.ontap,
    required this.items,
    this.isexpanded,
    this.height,
  });

  final int currentindex;
  final void Function(int)? ontap; // Allow ontap to receive the index
  final List<String> items;
  final bool? isexpanded;
  final double? height;

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

int current = 0;

class _TabsWidgetState extends State<TabsWidget> {
  void _onTap(int index) {
    if (widget.ontap != null) {
      widget.ontap!(index); // Pass index to ontap callback
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
            height: widget.height ?? 40,
            margin: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
                color: kblueBorder2.withOpacity(0.4), border: Border.all(color: ktransparent)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.items.length,
                      (index) {
                        return GestureDetector(
                          onTap: () => _onTap(index),
                          child: AnimatedContainer(
                            padding: EdgeInsets.all(4),
                            margin: EdgeInsets.all(4),
                            duration: const Duration(milliseconds: 300),
                            height: Get.height,
                            decoration: BoxDecoration(
                                color: widget.currentindex == index
                                    ? ksecondary
                                    : ktransparent,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    color: widget.currentindex == index
                                        ? ktransparent
                                        : ktransparent)
                                // color: ktransparent,
                                ),
                            child: Center(
                              child: MyText(
                                text: widget.items[index],
                                paddingLeft: 7,
                                paddingRight: 7,
                                size: 13,
                                fontFamily: AppFonts.gilroyMedium,
                                color: widget.currentindex == index
                                    ? kwhite
                                    : kblack,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
            child: Container(
              height: widget.height ?? 52,
              margin: EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  color: kblueBorder2.withOpacity(0.4), border: Border.all(color: ktransparent)),
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
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.all(4),
                              duration: const Duration(milliseconds: 300),
                              height: Get.height,
                              decoration: BoxDecoration(
                                  color: widget.currentindex == index
                                      ? kblueBorder2
                                      : ktransparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: widget.currentindex == index
                                          ? ktransparent
                                          : ktransparent)
                                  // color: ktransparent,
                                  ),
                              child: Center(
                                child: MyText(
                                  text: widget.items[index],
                                  textAlign: TextAlign.center,
                                  // paddingLeft: 7,
                                  // paddingRight: 7,
                                  size: 11.5,
                                  fontFamily: AppFonts.gilroyRegular,
                                  color: widget.currentindex == index
                                      ? kwhite
                                      : kwhite,
                                ),
                              ),
                            ),
                          ));
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
  final Color? sLabel,label2;
  final FontWeight? labelWeight;
  final TabBarIndicatorSize? indicator;
  const MyTabbar(
      {super.key,
      required this.items,
      this.controller,
      this.hasborder = false,
      this.indicatorpadd, this.dividerColor, this.sLabel, this.label2, this.indicator, this.labelWeight});
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
        dividerColor:dividerColor?? ktransparent,
        dividerHeight: 4,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight:labelWeight?? FontWeight.w400,
          fontFamily:AppFonts.gilroyBold,
          color:sLabel?? kheading,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize:14,
          fontWeight:labelWeight?? FontWeight.w400,
          fontFamily:AppFonts.gilroyBold,
          color:label2?? kgrey,
        ),
        //isScrollable: true,
        // tabAlignment: TabAlignment.start,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        indicatorPadding: EdgeInsets.symmetric(
            horizontal: hasborder == true ? 0: indicatorpadd ?? 0),
        labelPadding:
            EdgeInsets.symmetric(horizontal: hasborder == true ? 10 : 0),
        controller: controller,
        indicatorWeight: 4,
      
   splashBorderRadius: BorderRadius.circular(10),
   
        //labelPadding: EdgeInsets.all(),
        indicatorColor: ksecondary,
        indicatorSize:indicator?? TabBarIndicatorSize.label,
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
