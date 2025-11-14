import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/screens/community/community_mesg.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class PublicProfile extends StatelessWidget {
  const PublicProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Public Profile', centerTitle: true),
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
                    radius: 12,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonImageView(
                              url: dummyImage,
                              width: 80,
                              height: 80,
                              radius: 100,
                            ),
                            Expanded(
                                child: Column(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: 'Sarah Mitchell',
                                  size: 20,
                                  fontFamily: AppFonts.gilroyBold,
                                ),
                                DiffTextsTxt(
                                  text1: ' MRICS',
                                  text2: ' ',
                                  text3: 'FRICS',
                                  size: 14,
                                  size2: 12,
                                  color1: getSecondaryColor(context),
                                  color2: getTertiary(context),
                                  color3: getTertiary(context),
                                  fontFamily: AppFonts.gilroyBold,
                                  fontFamily2: AppFonts.gilroyMedium,
                                ),
                                row_widget(
                                  icon: Assets.imagesLocation,
                                  iconSize: 13,
                                  title: 'London, UK',
                                  texSize: 11,
                                  iconColor: getTertiary(context),
                                  textColor: getTertiary(context),
                                )
                              ],
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            buttonContainer(
                              radius: 50,
                              bgColor: getfifth(context),
                              vPadding: 5,
                              text: 'Commercial Property',
                              textsize: 11,
                            ),
                          ],
                        ),
                        MyText(
                          paddingTop: 10,
                          text:
                              'Senior Commercial Property Surveyor with 15+ years experience in valuation, investment advisory, and development consulting across London and South East markets.',
                          size: 14,
                          color: getTertiary(context),
                        ),
                      ],
                    ),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    mbott: 16,
                    radius: 12,
                    color: getfillcolor(context),
                    widget: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Performance Metrics',
                            size: 20,
                            fontFamily: AppFonts.gilroyBold,
                            paddingBottom: 16,
                          ),
                          ListView.builder(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        index == 0
                                            ? isDarkMode
                                                ? Assets.imagesTestscored
                                                : Assets.imagesTestscorel
                                            : isDarkMode
                                                ? Assets.imagesUniquequesd
                                                : Assets.imagesUniquequesl,
                                        width: 32,
                                        height: 32,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TwoTextedColumn(
                                          text1: index == 0
                                              ? 'Average Test Score'
                                              : 'Unique Correct Questions',
                                          text2: index == 0
                                              ? 'Last 12 months'
                                              : 'Total answered correctly',
                                          size1: 14,
                                          size2: 12,
                                          fontFamily: AppFonts.gilroyBold,
                                          color2: getTertiary(context),
                                        ),
                                      ),
                                      MyText(
                                        text: index == 0 ? '87%' : '1,247',
                                        size: 20,
                                        fontFamily: AppFonts.gilroyBold,
                                        paddingLeft: 6,
                                      )
                                    ],
                                  ));
                            },
                          ),
                        ]),
                  ),
                  CustomeContainer(
                      mbott: 16,
                      radius: 12,
                      color: getfillcolor(context),
                      widget: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: MyText(
                                    text: 'Upcoming CPD',
                                    size: 20,
                                    fontFamily: AppFonts.gilroyBold,
                                    paddingBottom: 16,
                                  ),
                                ),
                                MyText(
                                  text: 'View All',
                                  size: 12,
                                  color: getTertiary(context),
                                  paddingBottom: 16,
                                ),
                              ],
                            ),
                            ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: CustomeContainer(
                                      vpad: 12,
                                      hpad: 12,
                                      radius: 8,
                                      color: getfifth(context),
                                      widget: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                Assets.imagesCalender3,
                                                width: 18,
                                                color: getTertiary(context),
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TwoTextedColumn(
                                                    text1:
                                                        'Commercial Valuation Updates',
                                                    text2:
                                                        'RICS Professional Development',
                                                    size1: 14,
                                                    size2: 12,
                                                    color2:
                                                        getTertiary(context),
                                                    fontFamily:
                                                        AppFonts.gilroyBold,
                                                  ),
                                                  MyText(
                                                    text:
                                                        'March 15, 2024  •  2 CPD hours',
                                                    size: 12,
                                                    color: getTertiary(context),
                                                    paddingTop: 5,
                                                  ),
                                                ],
                                              ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ));
                              },
                            ),
                          ])),
                  CustomeContainer(
                      mbott: 16,
                      radius: 12,
                      color: getfillcolor(context),
                      widget: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: MyText(
                                    text: 'Professional Groups',
                                    size: 20,
                                    fontFamily: AppFonts.gilroyBold,
                                    paddingBottom: 16,
                                  ),
                                ),
                                MyText(
                                  text: 'View All',
                                  size: 12,
                                  color: getTertiary(context),
                                  paddingBottom: 16,
                                ),
                              ],
                            ),
                            ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: mesg_tile(
                                    ontap: () {
                                      //  Get.to(()=>PublicProfile());
                                    },
                                    radius: 0,
                                    title: 'RICS Commercial Property',
                                    isStart: true,
                                    statusText: 'Member',
                                    icon: Assets.imagesCompanylogo2,
                                    hasIcon: true,
                                    hasStatus: true,
                                    borderColor: ktransparent,
                                    desc: '2,847 members',
                                  ),
                                );
                              },
                            ),
                          ]))
                ],
              ),
            ),
          ],
        ));
  }
}
