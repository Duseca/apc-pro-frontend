import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/news/book_marked_news.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/news_widgets/news_widget.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class News extends StatelessWidget {
  final bool? isBookmark;
  const News({super.key, this.isBookmark});

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
      appBar: simpleAppBar(context: context, title: "News", centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            children: [
              Row(
                children: [
                  Expanded(
                      child: MyText(
                    text: 'Top Stories',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                  )),
                  buttonContainer(
                    text: 'Bookmarks',
                    borderColor: getSecondaryColor(context),
                    txtColor: getSecondaryColor(context),
                    radius: 6,
                    bgColor: ktransparent,
                    onTap: () {
                      Get.to(() => BookMarkedNews());
                    },
                  )
                ],
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
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: news_feed_card(),
                  );
                },
              ),
            
              MyButton(
                buttonText: 'Load More Articles',
                outlineColor: getSecondaryColor(context),
                fontColor: getSecondaryColor(context),
                backgroundColor: ktransparent,
              )
            ],
          ))
        ],
      ),
    );
  }
}

class news_feed_card extends StatelessWidget {
  const news_feed_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
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
        ]));
  }
}
