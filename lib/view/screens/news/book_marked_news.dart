import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/news/competency_coverage.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/news_widgets/news_widget.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookMarkedNews extends StatelessWidget {
  final bool? isBookmark;
  const BookMarkedNews({super.key, this.isBookmark});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [
      "All",
      'APC',
      'RICS',
      'Property',
      'Construction'
    ];

    final RxInt currentIndex = 0.obs;
    return Scaffold(
      appBar: simpleAppBar(
          context: context, title: "BookMarked Articles", centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            children: [
              MyTextField2(
                hintColor: getSecondaryColor(context),
                hint: 'Search BookMarked articles...',
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
              SizedBox(
                height: 16,
              ),
              CustomeContainer(
                radius: 12,
                color: getfillcolor(context),
                hpad: 0,
                vpad: 0,
                widget: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: CommonImageView(
                        imagePath: Assets.imagesHouse,
                        height: 192,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    news_info_column()
                  ],
                ),
                mbott: 16,
              ),
              ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CustomeContainer(
                        radius: 12,
                        color: getfillcolor(context),
                        hpad: 16,
                        vpad: 0,
                        widget: Column(children: [
                          Row(
                            children: [
                              CommonImageView(
                                imagePath: Assets.imagesHouse,
                                radius: 10,
                                width: 80,
                                height: 80,
                              ),
                              Expanded(
                                  child: news_info_column(
                                size1: 14,
                              ))
                            ],
                          )
                        ])),
                  );
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
                text1: 'No BookMarked Articles',
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
                    buttonText: 'Browse News',
                    outlineColor: getSecondaryColor(context),
                    fontColor: getSecondaryColor(context),
                    backgroundColor: ktransparent,
                    mBottom: 30,
                    onTap: () {
                      Get.to(()=>CompetencyCoverage());
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
