import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/spine_graph.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageJobs extends StatelessWidget {
  const ManageJobs({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: simpleAppBar(
            onBackIconTap: () {
              Get.back(closeOverlays: true);
            },
            context: context,
            title: 'Manage Job',
            centerTitle: true,
            actions: [
              Bounce(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    Assets.imagesCross,
                    width: 15,
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
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    borderColor: getfifth(context),
                    vpad: 17,
                    hpad: 17,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TwoTextedColumn(
                          text2: 'TechCorp • Remote • Posted 3 days ago',
                          text1: 'Senior Frontend Developer',
                          size1: 22,
                          size2: 14,
                          color2: getTertiary(context),
                          fontFamily: AppFonts.gilroySemiBold,
                          maxLines: 2,
                          mBottom: 4,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          spacing: 12,
                          children: [
                            TagsWidget(
                              'Active',
                              bgColor: ktransparent,
                              borderColor: getTertiary(context),
                              vpad: 5,
                            ),
                            MyText(
                              text: 'Full-time',
                              size: 12,
                              color: getTertiary(context),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: TwoTextedColumn(
                                text1: '42',
                                text2: 'Applications',
                                size1: 28,
                                size2: 12,
                                fontFamily: AppFonts.gilroySemiBold,
                                align: TextAlign.center,
                                alignment: ColumnAlignment.center,
                              ),
                            ),
                            Expanded(
                              child: TwoTextedColumn(
                                text1: '1,247',
                                text2: 'Views',
                                size1: 28,
                                size2: 12,
                                fontFamily: AppFonts.gilroySemiBold,
                                align: TextAlign.center,
                                alignment: ColumnAlignment.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    mbott: 16,
                  ),
                  MyText(
                    text: 'Quick Actions',
                    size: 16,
                    fontFamily: AppFonts.gilroySemiBold,
                    paddingBottom: 16,
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      Expanded(
                        child: MyButton(
                          buttonText: ' Edit Job',
                          icon: Icons.edit,
                          iconSize: 15,
                          imgColor: getSecondaryColor(context),
                          fontColor: getSecondaryColor(context),
                          backgroundColor: getfillcolor(context),
                          fontFamily: AppFonts.gilroyMedium,
                          fontSize: 14,
                          mBottom: 16,
                          onTap: () {
                            //  Get.to(()=>PostNewJob());
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          buttonText: ' Pause Job',
                          image: Assets.imagesPause,
                          iconSize: 15,
                          imgColor: getSecondaryColor(context),
                          fontFamily: AppFonts.gilroyMedium,
                          fontColor: getSecondaryColor(context),
                          backgroundColor: ktransparent,
                          outlineColor: getTertiary(context),
                          fontSize: 14,
                          mBottom: 16,
                        ),
                      )
                    ],
                  ),
                  MyText(
                    text: 'Analytics',
                    size: 16,
                    fontFamily: AppFonts.gilroySemiBold,
                    paddingBottom: 16,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    borderColor: getfifth(context),
                    vpad: 17,
                    hpad: 17,
                    widget: Column(
                        spacing: 25,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                child: TwoTextedColumn(
                                  text1: '19.8%',
                                  text2: 'Application Rate',
                                  size1: 20,
                                  size2: 12,
                                  color2: getTertiary(context),
                                  fontFamily: AppFonts.gilroySemiBold,
                                ),
                              ),
                              Expanded(
                                child: TwoTextedColumn(
                                  text1: '3.4%',
                                  text2: 'Response Rate',
                                  size1: 20,
                                  size2: 12,
                                  color2: getTertiary(context),
                                  fontFamily: AppFonts.gilroySemiBold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                child: TwoTextedColumn(
                                  text1: '8',
                                  text2: 'Interviews',
                                  size1: 20,
                                  size2: 12,
                                  color2: getTertiary(context),
                                  fontFamily: AppFonts.gilroySemiBold,
                                ),
                              ),
                              Expanded(
                                child: TwoTextedColumn(
                                  text1: '2',
                                  text2: 'Offers Sent',
                                  size1: 20,
                                  size2: 12,
                                  color2: getTertiary(context),
                                  fontFamily: AppFonts.gilroySemiBold,
                                ),
                              ),
                            ],
                          ),
                        ]),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    borderColor: getfifth(context),
                    vpad: 17,
                    hpad: 17,
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Daily Views (Last 7 days)',
                            color: getTertiary(context),
                            paddingBottom: 16,
                            fontFamily: AppFonts.gilroySemiBold,
                          ),
                          RepaintBoundary(
                            child: WeeklyChart(),
                          )
                        ]),
                    mbott: 16,
                  ),
                  MyText(
                    text: 'Job Management',
                    size: 16,
                    fontFamily: AppFonts.gilroySemiBold,
                    paddingBottom: 16,
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Divider(
                        color: getTertiary(context),
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Image.asset(
                            isDarkMode
                                ? (index == 0
                                    ? Assets.imagesSharejobd
                                    : (index == 1
                                        ? Assets.imagesDeleteD
                                        : Assets.imagesArchived))
                                : (index == 0
                                    ? Assets.imagesSharejobl
                                    : (index == 1
                                        ? Assets.imagesDeleteL
                                        : Assets.imagesArchivel)),
                            width: 32,
                            height: 32,
                          ),
                          Expanded(
                              child: MyText(
                            text: index == 1
                                ? 'Archive Job'
                                : (index == 2
                                    ? 'Delete Job'
                                    : 'Share Job Posting'),
                            size: 14,
                            fontFamily: AppFonts.gilroyMedium,
                            paddingLeft: 10,
                          )),
                          Image.asset(
                            Assets.imagesForward,
                            width: 18,
                          )
                        ],
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
