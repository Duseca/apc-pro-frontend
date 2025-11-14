import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/cpd_events/event_dashboard.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/cpd_events_widgets/cpd_events_widget.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookMarkedCpdevent extends StatelessWidget {
  final bool? isBookmark;
  const BookMarkedCpdevent({super.key, this.isBookmark});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [
      "All",
      'Online',
      'In Person',
      'Free',
    ];

    final RxInt currentIndex = 0.obs;
    return Scaffold(
      appBar: simpleAppBar(
          context: context, title: "BookMarked Events", centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
                Divider(color: getfillcolor(context),),
          Expanded(
              child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            children: [
              MyTextField2(
                hintColor: getSecondaryColor(context),
                hint: 'Search BookMarked events',
                prefixIcon: Image.asset(
                  Assets.imagesSearch,
                  width: 18,
                  color: getSecondaryColor(context),
                ),
                filledColor: ktransparent,
              ),
              Obx(
                () => TabsWidget(
                  bgColor: ktransparent,
                  items: tabs,
                  currentindex: currentIndex.value,
                  ontap: (p0) {
                    currentIndex.value = p0;
                  },
                  borderColor2: getTertiary(context),
                  radius: 50,
                  isexpanded: true,
                  textSize: 10,
                  selectedColor: getfillcolor(context),
                  selectedTextColor: getTertiary(context),
                  unselectedTextColor: getTertiary(context),
                  height: 45,
                ),
              ),
              MyText(
                text: 'Bookmarked CPD Events',
                size: 16,
                fontFamily: AppFonts.gilroyBold,
                paddingBottom: 16,
                paddingTop: 16,
              ),
              ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: all_events_card());
                },
              ),
              CircleAvatar(
                backgroundColor: getSecondaryColor(context),
                radius: 25,
                child: Center(
                  child: Image.asset(
                    Assets.imagesBookmark,
                    width: 18,
                    color: getsplashcolor(context),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TwoTextedColumn(
                text1: 'No BookMarked Events',
                text2:
                    'Start saving articles you want to read later by tapping the bookmark icon.',
                size1: 16,
                size2: 12,
                fontFamily: AppFonts.gilroyBold,
                align: TextAlign.center,
                alignment: ColumnAlignment.center,
                color2: getTertiary(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    hpad: 20,
                    mTop: 16,
                    buttonText: 'Browse Events',
                    outlineColor: getSecondaryColor(context),
                    fontColor: getSecondaryColor(context),
                    backgroundColor: ktransparent,
                    mBottom: 30,
                    onTap: () {
                    Get.to(()=>EventDashboard());
                    },
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
