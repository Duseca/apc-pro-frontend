import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/screens/community/community_mesg.dart';
import 'package:apc_pro/view/screens/groups/groups.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RicsProfessional extends StatelessWidget {
  const RicsProfessional({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<String> tabs = ["Info", 'Chat', 'Tables', 'CPD'];

    final RxInt currentIndex = 0.obs;
    return Scaffold(
        appBar: simpleAppBar(
            context: context, centerTitle: true, title: 'RICS Professionals'),
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
                    vpad: 16,
                    hpad: 16,
                    color: getfillcolor(context),
                    widget: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: getSecondaryColor(context),
                              child: Image.asset(
                                Assets.imagesUsers,
                                color: getsplashcolor(context),
                                width: 22,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: 'RICS Professionals',
                                  size: 24,
                                  fontFamily: AppFonts.gilroyBold,
                                  paddingBottom: 4,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.imagesError,
                                      color: getSecondaryColor(context),
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: MyText(
                                        text: '24 members online',
                                        size: 14,
                                        fontFamily: AppFonts.gilroyMedium,
                                        color: getTertiary(context),
                                        paddingLeft: 6,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ))
                          ],
                        ),
                        MyText(
                          text:
                              'A collaborative group for RICS chartered surveyors to share knowledge, discuss industry trends, and work together on professional development initiatives.',
                          size: 14,
                          fontFamily: AppFonts.gilroyMedium,
                          color: getTertiary(context),
                          paddingTop: 16,
                          paddingBottom: 16,
                        ),
                        MyTextField2(
                          hint: 'Group Code',
                          hintColor: getSecondaryColor(context),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MyText(
                                text: 'R1CS24',
                                size: 12,
                                fontFamily: AppFonts.gilroyBold,
                                paddingRight: 5,
                              ),
                              Image.asset(
                                  isDarkMode
                                      ? Assets.imagesCopyd
                                      : Assets.imagesCopyd,
                                  width: 16)
                            ],
                          ),
                        )
                      ],
                    ),
                    mbott: 5,
                  ),
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
                      selectedTextColor: getSecondaryColor(context),
                      unselectedTextColor: getTertiary(context),
                      selectedColor: getfifth(context),
                    ),
                  ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  CustomeContainer(
                      radius: 12,
                      vpad: 16,
                      hpad: 16,
                      color: getfillcolor(context),
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'Group Statistics',
                              size: 20,
                              fontFamily: AppFonts.gilroyBold,
                              paddingBottom: 12,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TwoTextedColumn(
                                    text1: 'Privacy',
                                    text2: "Private group - invitation only",
                                    size1: 14,
                                    size2: 12,
                                    color2: getTertiary(context),
                                    color1: getSecondaryColor(context),
                                    fontFamily: AppFonts.gilroyBold,
                                    mBottom: 0,
                                  ),
                                ),
                                buttonContainer(
                                  text: 'Private',
                                  bgColor: getfifth(context),
                                  txtColor: getSecondaryColor(context),
                                  vPadding: 3,
                                  hPadding: 6,
                                  textsize: 11.5,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TwoTextedColumn(
                              text1: 'Created',
                              text2: "March 15, 2024",
                              size1: 14,
                              size2: 12,
                              color2: getTertiary(context),
                              color1: getSecondaryColor(context),
                              fontFamily: AppFonts.gilroyBold,
                              mBottom: 0,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TwoTextedColumn(
                                    text1: 'Admin',
                                    text2: "Sarah Johnson, MRICS",
                                    size1: 14,
                                    size2: 12,
                                    color2: getTertiary(context),
                                    color1: getSecondaryColor(context),
                                    fontFamily: AppFonts.gilroyBold,
                                    mBottom: 0,
                                  ),
                                ),
                                CommonImageView(
                                  url: dummyImage,
                                  radius: 100,
                                  width: 32,
                                  height: 32,
                                )
                              ],
                            ),
                          ])),

                  CustomeContainer(
                      mtop: 16,
                      radius: 12,
                      vpad: 16,
                      hpad: 16,
                      color: getfillcolor(context),
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'Recent Activity',
                              size: 20,
                              fontFamily: AppFonts.gilroyBold,
                              paddingBottom: 12,
                            ),
                            ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: group_features_row(
                                      text1: 'Michael Completed the Quiz',
                                      text2: '5 hours ago',
                                      icon: isDarkMode
                                          ? Assets.imagesActivityd
                                          : Assets.imagesActivityl),
                                );
                              },
                            ),
                          ])),

                  CustomeContainer(
                      mtop: 16,
                      radius: 12,
                      vpad: 16,
                      hpad: 16,
                      color: getfillcolor(context),
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'Quick Actions',
                              size: 20,
                              fontFamily: AppFonts.gilroyBold,
                              paddingBottom: 12,
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
                                      radius: 8,
                                      color: getsplashcolor(context),
                                      mbott: 15,
                                      vpad: 10,
                                      hpad: 12,
                                      widget: mesg_tile(
                                        title: index == 1
                                            ? 'Manage Group'
                                            : 'Invite Members',
                                        desc: index == 1
                                            ? 'Edit settings and permissions'
                                            : 'Share group code or send invitations',
                                        icon: isDarkMode
                                            ? index == 1
                                                ? Assets.imagesSettingd
                                                : Assets.imagesAddgroup2d
                                            : index == 1
                                                ? Assets.imagesSettingl
                                                : Assets.imagesAddgroup2l,
                                        hasTime: false,
                                        hasIcon: true,
                                        borderColor: ktransparent,
                                        imgSize: 32,
                                        radius: 0,
                                      ),
                                    ));
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
