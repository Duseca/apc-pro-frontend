import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/cpd_events/book_marked_cpdevent.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/cpd_events_widgets/cpd_events_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CpdEvents extends StatefulWidget {
  const CpdEvents({super.key});

  @override
  State<CpdEvents> createState() => _CpdEventsState();
}

class _CpdEventsState extends State<CpdEvents>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  final List<String> tabs = [
    "Events",
    'Tracker',
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  final List<String> tabs2 = ["All", 'Online', 'In-person', 'Hybrid', 'Free'];

  final RxInt currentIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'CPD',
            centerTitle: true,
            actions: [
              Bounce(
                onTap: () {
                  Get.to(()=>BookMarkedCpdevent());
                },
                  child: Image.asset(
                Assets.imagesBookmark,
                width: 20,
                color: getSecondaryColor(context),
              )),
              SizedBox(
                width: 15,
              )
            ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  MyTabbar(
                    items: tabs,
                    controller: tabController,
                    hasborder: false,
                    indicator: TabBarIndicatorSize.tab,
                    dividerColor: getTertiary(context),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: row_widget(
                      title: 'Disclaimer',
                      icon: Assets.imagesInfo,
                      iconColor: getSecondaryColor(context),
                      textColor: getSecondaryColor(context),
                      isIconRight: true,
                      iconSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  MyTextField2(
                    hint: 'Search events...',
                    prefixIcon: Image.asset(
                      Assets.imagesSearch,
                      width: 15,
                      color: getSecondaryColor(context),
                    ),
                    filledColor: ktransparent,
                    hintColor: getSecondaryColor(context),
                  ),
                  Obx(
                    () => TabsWidget(
                      bgColor: ktransparent,
                      items: tabs2,
                      currentindex: currentIndex.value,
                      ontap: (p0) {
                        currentIndex.value = p0;
                      },
                      borderColor2: getSecondaryColor(context),
                      radius: 50,
                      isexpanded: false,
                      textSize: 10,
                      selectedColor: getfillcolor(context),
                      selectedTextColor: getSecondaryColor(context),
                      unselectedTextColor: getSecondaryColor(context),
                      height: 45,
                    ),
                  ),
                  MyText(
                    text: 'Featured Events',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 16,
                    paddingTop: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: featurd_events_card(),
                        ),
                      ),
                    ),
                  ),
                  MyText(
                    text: 'All CPD Events',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 16,
                    paddingTop: 16,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: all_events_card(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
