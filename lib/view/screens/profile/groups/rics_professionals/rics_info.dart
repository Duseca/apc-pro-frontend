import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/screens/community/community_mesg.dart';
import 'package:apc_pro/view/screens/profile/groups/groups.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class RicsInfo extends StatelessWidget {
  const RicsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                          TwoTextedColumn(
                              text2: 'Total Members',
                              text1: '47',
                              size1: 20,
                              size2: 14,
                              fontFamily2: AppFonts.gilroyMedium,
                              color2: getTertiary(context),
                              fontFamily: AppFonts.gilroyBold,
                               align: TextAlign.center,
                              alignment: ColumnAlignment.center,
                            ),
                                   TwoTextedColumn(
                              text2: 'Average Test Score',
                              text1: '90%',
                              size1: 20,
                              size2: 14,
                              fontFamily2: AppFonts.gilroyMedium,
                              fontFamily: AppFonts.gilroyBold,
                              color2: getTertiary(context),
                              align: TextAlign.center,
                              alignment: ColumnAlignment.center,
                            )
                                  ],
                                )
                              ]),mbott: 16,),
                      CustomeContainer(
                          radius: 12,
                          vpad: 16,
                          hpad: 16,
                          color: getfillcolor(context),
                          widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: 'Group Settings',
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
                                            //hasTime: false,
                                            hasIcon: true,
                                            borderColor: ktransparent,
                                            imgSize: 32,
                                            radius: 0,
                                          ),
                                        ));
                                  },
                                ),
                              ])),
                    ],
                  );
  }
}