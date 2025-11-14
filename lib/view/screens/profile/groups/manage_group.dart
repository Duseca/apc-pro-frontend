import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/community/community_mesg.dart';
import 'package:apc_pro/view/screens/profile/groups/public_profile.dart';
import 'package:apc_pro/view/screens/profile/notification_pref.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/profile_widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageGroup extends StatelessWidget {
  const ManageGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    List<SettingItem> notificationTiming = [
      SettingItem(
        title: "Create Surveys",
        value: false,
        desc: 'Allow members to create new surveys',
      ),
      SettingItem(
          title: "Invite Friends",
          value: true,
          desc: 'Allow members to invite new people'),
      SettingItem(
          title: 'Export Data',
          value: true,
          desc: 'Allow members to export survey data')
    ];
    return Scaffold(
      appBar: simpleAppBar(
          context: context, title: 'Manage Group', centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
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
                          radius: 26,
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
                              size: 22,
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
                  ],
                ),
                mbott: 16,
              ),
              CustomeContainer(
                radius: 12,
                color: getfillcolor(context),
                widget: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Group Settings',
                        size: 20,
                        fontFamily: AppFonts.gilroyBold,
                        paddingBottom: 16,
                      ),
                      MyTextField2(
                        hint: 'Group Name',
                        label: 'RICS Professionals',
                        filledColor: getfifth(context),
                        hintColor: getSecondaryColor(context),
                      ),
                      MyTextField2(
                        label: 'Description',
                        maxLines: 5,
                        filledColor: getfifth(context),
                        hintColor: getSecondaryColor(context),
                        hint:
                            'A collaborative group for RICS chartered surveyors to share knowledge, discuss industry trends, and work together on professional development initiatives.',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TwoTextedColumn(
                              text1: 'Privacy',
                              text2: "Make group invite-only",
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
                    ]),
                mbott: 16,
              ),
              CustomeContainer(
                radius: 12,
                color: getfillcolor(context),
                widget: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Access Code',
                        size: 20,
                        fontFamily: AppFonts.gilroyBold,
                        paddingBottom: 16,
                      ),
                      CustomeContainer(
                        radius: 8,
                        color: getSecondaryColor(context),
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: MyText(
                                    text: 'Current Code',
                                    size: 14,
                                    fontFamily: AppFonts.gilroyMedium,
                                    color: getsplashcolor(context),
                                  ),
                                ),
                                row_widget(
                                  icon: Assets.imagesCopyd,
                                  title: 'R1CS24',
                                  isIconRight: true,
                                  fontFamily: AppFonts.gilroyBold,
                                  textColor: getsplashcolor(context),
                                  texSize: 15,
                                )
                              ],
                            ),
                            MyText(
                              paddingTop: 10,
                              text: 'Created March 15, 2024',
                              size: 12,
                              color: getTertiary(context),
                            ),
                          ],
                        ),
                      ),
                      MyButton(
                        buttonText: 'Regenerate Code',
                      )
                    ]),
                mbott: 16,
              ),
              CustomeContainer(
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
                              text: 'Members (47)',
                              size: 20,
                              fontFamily: AppFonts.gilroyBold,
                            ),
                          ),
                          MyText(
                            text: 'View All',
                            color: getSecondaryColor(context),
                            size: 14,
                            fontFamily: AppFonts.gilroyMedium,
                          )
                        ],
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 3, top: 3),
                          child: Divider(
                            color: getTertiary(context),
                          ),
                        ),
                        padding: EdgeInsets.all(0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return mesg_tile(
                            ontap: () {
                              Get.to(()=>PublicProfile());
                            },
                            isStart: true,
                            hasSuffix: index == 0 ? false : true,
                            hasStatus: index == 0 ? true : false,
                            borderColor: ktransparent,
                            desc: 'Admin • MRICS',
                          );
                        },
                      ),
                    ]),
                mbott: 16,
              ),
              CustomeContainer(
                radius: 12,
                color: getfillcolor(context),
                widget: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: 'Access Code',
                      size: 20,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 16,
                    ),
                    ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: notificationTiming.length,
                      itemBuilder: (context, index) {
                        final item = notificationTiming[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: notification_pref_row(
                            title: item.title,
                            value: item.value,
                            desc: item.desc,
                            // hasSwitch: item.hasSwitch,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                mbott: 16,
              ),
              CustomeContainer(
                radius: 12,
                color: getfillcolor(context),
                widget: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Group Actions',
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
                              padding: const EdgeInsets.only(bottom: 15),
                              child: CustomeContainer(
                                radius: 8,
                                color: getsplashcolor(context),
                                vpad: 10,
                                hpad: 12,
                                widget: mesg_tile(
                                  title: index == 0
                                      ? 'Archive Group'
                                      : 'Delete Group',
                                  desc: index == 0
                                      ? 'Hide group but keep all data'
                                      : 'Permanently delete group and all data',
                                  icon: isDarkMode
                                      ? index == 1
                                          ? Assets.imagesArchived
                                          : Assets.imagesDeleteD
                                      : index == 0
                                          ? Assets.imagesArchivel
                                          : Assets.imagesDeleteL,
                                  //hasTime: false,
                                  hasIcon: true,
                                  borderColor: ktransparent,
                                  imgSize: 32,
                                  radius: 0,
                                ),
                              ));
                        },
                      ),
                    ]),
                mbott: 16,
              )
            ],
          ))
        ],
      ),
    );
  }
}
