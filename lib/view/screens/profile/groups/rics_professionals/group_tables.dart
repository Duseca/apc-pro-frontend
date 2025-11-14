import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupTables extends StatelessWidget {
  const GroupTables({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<String> tabs = ['Avg Test Score', 'Unique Correct'];

    final RxInt currentIndex = 0.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            textSize: 11,
            radius: 8,
          ),
        ),
        CustomeContainer(
          radius: 12,
          color: getfillcolor(context),
          vpad: 16,
          hpad: 0,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                        child: MyText(
                      text: 'Test Performance Leaderboard',
                      size: 20,
                      fontFamily: AppFonts.gilroyBold,
                    )),
                    MyText(
                      text: '47\nmembers',
                      size: 14,
                      color: getTertiary(context),
                    )
                  ],
                ),
              ),
              Divider(
                color: getSecondaryColor(context),
              ),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 8),
                    child: Divider(
                      color: getSecondaryColor(context),
                    ),
                  );
                },
                padding: EdgeInsets.only(top: 8, bottom: 8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return group_table_card();
                },
              ),
              Divider(
                color: getSecondaryColor(context),
              ),

              MyButton(
                mTop: 8,
                mhoriz: 16,
                buttonText: 'View All Members',
                icon: Icons.keyboard_arrow_down_rounded,
                imgColor: getSecondaryColor(context),
                fontColor: getSecondaryColor(context),
                backgroundColor: getfifth(context),
                iconPosition: IconPosition.right,
              )
            ],
          ),
        )
      ],
    );
  }
}

class group_table_card extends StatelessWidget {
  final String? img, name, desc, revenue;
  const group_table_card({
    super.key,
    this.img,
    this.name,
    this.desc,
    this.revenue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Image.asset(
            Assets.imagesOne,
            width: 22,
          ),
          SizedBox(
            width: 8,
          ),
          CommonImageView(
            url: img ?? dummyImage,
            width: 40,
            height: 40,
            radius: 100,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DiffTextsTxt(
                text1: name ?? 'Sarah Johnson',
                text2: ' ',
                text3: 'MRICS',
                size: 14,
                size2: 12,
                color1: getSecondaryColor(context),
                color2: getTertiary(context),
                color3: getTertiary(context),
                fontFamily: AppFonts.gilroyBold,
                fontFamily2: AppFonts.gilroyMedium,
              ),
              MyText(
                text: desc ?? 'Chartered Surveyor',
                size: 12,
                color: getTertiary(context),
                paddingTop: 4,
              )
            ],
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyText(
                text: revenue ?? '94.2',
                size: 15,
                color: getSecondaryColor(context),
                fontFamily: AppFonts.gilroyBold,
              ),
              row_widget(
                title: '0.8',
                icon: Assets.imagesRate,
                iconColor: getTertiary(context),
                iconSize: 12,
                texSize: 11,
              )
            ],
          )
        ],
      ),
    );
  }
}
