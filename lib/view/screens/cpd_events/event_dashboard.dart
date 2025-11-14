import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDashboard extends StatelessWidget {
  const EventDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [
      "Active",
      'Pending',
      'Expired',
    ];

    final RxInt currentIndex = 0.obs;
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Event Dashboard', centerTitle: true),
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
                  Obx(
                    () => TabsWidget(
                      bgColor: getfillcolor(context),
                      items: tabs,
                      currentindex: currentIndex.value,
                      ontap: (p0) {
                        currentIndex.value = p0;
                      },
                      isexpanded: true,
                      textSize: 12,
                      radius: 12,
                    ),
                  ),
                  CustomeContainer(
                    radius: 12,
                    color: getfillcolor(context),
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TwoTextedColumn(
                          text1: '12',
                          text2: 'Active Events',
                          size1: 20,
                          size2: 12,
                          fontFamily: AppFonts.gilroyBold,
                          align: TextAlign.center,
                          alignment: ColumnAlignment.center,
                        ),
                        Container(
                          color: getTertiary(context),
                          width: 2,
                          height: 50,
                        ),
                        TwoTextedColumn(
                          text1: '2.4K',
                          text2: 'Total Views',
                          size1: 20,
                          size2: 12,
                          fontFamily: AppFonts.gilroyBold,
                          align: TextAlign.center,
                          alignment: ColumnAlignment.center,
                        ),
                        Container(
                          color: getTertiary(context),
                          width: 2,
                          height: 50,
                        ),
                        TwoTextedColumn(
                          text1: '187',
                          text2: 'Bookmarks',
                          size1: 20,
                          size2: 12,
                          fontFamily: AppFonts.gilroyBold,
                          align: TextAlign.center,
                          alignment: ColumnAlignment.center,
                        ),
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
                        child: CustomeContainer(
                          radius: 12,
                          color: getfillcolor(context),
                          vpad: 16,
                          hpad: 16,
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 6,
                                children: [
                                  CommonImageView(
                                    imagePath: Assets.imagesCompanylogo2,
                                    radius: 8,
                                    width: 55,
                                    height: 55,
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: MyText(
                                              text:
                                                  'Tech Innovation Summit 2024',
                                              size: 14,
                                              fontFamily: AppFonts.gilroyBold,
                                              paddingBottom: 3,
                                            ),
                                          ),
                                          TagsWidget(
                                            'Active',
                                            borderColor: ktransparent,
                                            radius: 50,
                                            bgColor: getfifth(context),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        spacing: 15,
                                        children: [
                                          row_widget(
                                            icon: Assets.imagesEye,
                                            iconColor: getTertiary(context),
                                            iconSize: 12,
                                            title: '1.2K',
                                            texSize: 12,
                                            fontFamily: AppFonts.gilroyMedium,
                                          ),
                                          row_widget(
                                            icon: Assets.imagesShare3,
                                            iconColor: getTertiary(context),
                                            iconSize: 12,
                                            title: '89',
                                            texSize: 11,
                                            fontFamily: AppFonts.gilroyMedium,
                                          ),
                                          row_widget(
                                            icon: Assets.imagesBookmark,
                                            iconColor: getTertiary(context),
                                            iconSize: 12,
                                            title: '45',
                                            texSize: 11,
                                            fontFamily: AppFonts.gilroyMedium,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        spacing: 12,
                                        children: [
                                          Expanded(
                                              child: MyButton(
                                            buttonText: 'View',
                                            height: 38,
                                          )),
                                          Expanded(
                                            child: MyButton(
                                              buttonText: 'Edit',
                                              fontColor:
                                                  getSecondaryColor(context),
                                              backgroundColor:
                                                  getfifth(context),
                                              height: 38,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  MyButton(
                    mTop: 20,
                    buttonText: '+ Create New Event',
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
