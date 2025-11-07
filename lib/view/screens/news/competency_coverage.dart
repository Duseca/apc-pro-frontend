import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/profile/subscription/subscription_info.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/pie_chart.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CompetencyCoverage extends StatelessWidget {
  const CompetencyCoverage({super.key});

  @override
  Widget build(BuildContext context) {
        final List<String> tabs = [
      "All",
      'Not Started',
      'In Progress',
      'Refreshed',
  
    ];

    final RxInt currentIndex = 0.obs;
    return Scaffold(
      appBar: simpleAppBar(
          context: context, title: 'Competency Coverage', centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            physics: BouncingScrollPhysics(),
            children: [
            PieChartWithTap(),
              SizedBox(
                height: 8,
              ),
            
              Row(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              
                  MyText(
                    text: 'How Competency Coverage is calculated',
                    color: getTertiary(context),
                  ),
                  Image.asset(
                    Assets.imagesInfo,
                    width: 15,
                    color: getTertiary(context),
                  )
                ],
              ),
              
              SizedBox(
                height: 4,
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
                height: 4,
              ),
               ListView.builder(
 padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child:competency_coverage_widget(),
                    );
                  },
                ),

            ],
          ))
        ],
      ),
    );
  }
}

class competency_coverage_widget extends StatelessWidget {
  const competency_coverage_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 12,
      color: getfillcolor(context),
      vpad: 16,
      hpad: 16,
      widget: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: MyText(
                text: 'Ethics, Rules of Conduct and professionalism',
                size: 14,
                fontFamily: AppFonts.gilroyBold,
              )),
              buttonContainer(
                radius: 50,
                bgColor: getfifth(context),
                text: 'Refreshed',
                txtColor: getTertiary(context),
                vPadding: 4,
                textsize: 11,
              )
            ],
          ),
          expanded_icon_row(
            text: 'CPD Logged',
            icon: Assets.imagesCross,
            fontFamily: AppFonts.gilroyMedium,
            textSize: 12,
            iconSize: 14,
            textcolor: getTertiary(context),
          ),
          SizedBox(
            height: 4,
          ),
          ExpandedRow(
            text1: 'Quiz Progress',
            text2: '78/100 correct answers',
            color1: getTertiary(context),
            color2: getTertiary(context),
          ),
          SizedBox(
            height: 3,
          ),
          linearProgressIndicatorr(
            height: 8,
            bgColor: getTertiary(context),
            valueColor: getfifth(context),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            spacing: 5,
            children: [
              Expanded(
                  child: MyText(
                text: 'Last activity: 5 days ago',
                color: getTertiary(context),
              )),
              buttonContainer(
                radius: 8,
                bgColor: getfifth(context),
                text: ' Log CPD',
                imagePath: Assets.imagesBook2,
                imageSize: 16,
                txtColor: getSecondaryColor(context),
                iconColor: getSecondaryColor(context),
                vPadding: 4,
                textsize: 11,
              ),
              buttonContainer(
                radius: 8,
                bgColor: ktransparent,
                borderColor: getSecondaryColor(context),
                text: ' Take Quiz',
                imagePath: Assets.imagesPause,
                imageSize: 16,
                txtColor: getSecondaryColor(context),
                iconColor: getSecondaryColor(context),
                vPadding: 4,
                textsize: 11,
              )
            ],
          )
        ],
      ),
    );
  }
}
