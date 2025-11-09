import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/community/community_mesg.dart';
import 'package:apc_pro/view/screens/groups/manage_group.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/groups_widget/group_widget.dart';

import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferFriend extends StatelessWidget {
  const ReferFriend({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<Map<String, dynamic>> homeOptions = [
      {
        "icon": isDarkMode ? Assets.imagesMesg2 : Assets.imagesMesgl,
        "text": "Messages",
        "onTap": () {
          // Get.to(() => ApcDiary());
        },
      },
      {
        "icon": isDarkMode ? Assets.imagesWhatsappd : Assets.imagesWhatsappl,
        "text": "WhatsApp",
        "onTap": () {
          // Get.to(() => SummaryExperience());
        },
      },
      {
        "icon": isDarkMode ? Assets.imagesEmaild : Assets.imagesEmaill,
        "text": "Email",
        "onTap": () {
          //  Get.to(() => CaseStudy());
        },
      },
      {
        "icon": isDarkMode ? Assets.imagesTwitterd : Assets.imagesTwitterl,
        "text": "Twitter",
        "onTap": () {
          // Get.to(() => TestQuiz());
        },
      },
      {
        "icon": isDarkMode ? Assets.imagesFacebookd : Assets.imagesFacebookl,
        "text": "Facebook",
        "onTap": () {
          // Get.to(() => CpdTracker());
        },
      },
      {
        "icon": isDarkMode ? Assets.imagesMored : Assets.imagesMorel,
        "text": "More",
        "onTap": () {
          //  Get.to(() => SubmittionPlanner());
        },
      },
    ];
    return Scaffold(
        appBar: simpleAppBar(
            context: context, centerTitle: true, title: 'Refer a Friend'),
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
                  no_group_container(
                    bgcolor: ktransparent,
                    radius: 0,
                    text1: 'Invite Friends to Survyr',
                    text2:
                        'Share Survyr with friends and earn rewards when they join and complete their first survey',
                  ),
                  CustomeContainer(
                    radius: 12,
                    color: getfillcolor(context),
                    widget: Column(
                      children: [
                        TwoTextedColumn(
                          text1: 'Your Referral Code',
                          text2: "Share this code with friends to get started",
                          size1: 20,
                          size2: 14,
                          color2: getTertiary(context),
                          color1: getSecondaryColor(context),
                          fontFamily: AppFonts.gilroyBold,
                          align: TextAlign.center,
                          alignment: ColumnAlignment.center,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        DottedBorder(
                            radius: Radius.circular(8),
                            borderType: BorderType.RRect,
                            color: getSecondaryColor(context),
                            child: CustomeContainer(
                              radius: 8,
                              vpad: 8,
                              hpad: 0,
                              color: getfifth(context),
                              widget: MyText(
                                text: 'SURVYR2024',
                                size: 24,
                                paddingLeft: 60,
                                paddingRight: 60,
                                fontFamily: AppFonts.gilroyBold,
                                paddingTop: 12,
                                paddingBottom: 12,
                              ),
                            )),
                        MyButton(
                          mTop: 16,
                          buttonText: ' Copy Code',
                          image: Assets.imagesCopy,
                          imgColor: getsplashcolor(context),
                          iconSize: 14,
                          mBottom: 12,
                        ),
                        MyButton(
                          backgroundColor: getfifth(context),
                          fontColor: getSecondaryColor(context),
                          imgColor: getSecondaryColor(context),
                          buttonText: ' Copy Referral Link',
                          image: Assets.imagesLink,
                          iconSize: 14,
                        )
                      ],
                    ),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    radius: 12,
                    color: getfillcolor(context),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Share with Friends',
                          size: 20,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 16,
                        ),
                        GridView.builder(
                          itemCount: homeOptions.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 12,
                            mainAxisExtent: 110,
                          ),
                          itemBuilder: (context, index) {
                            final item = homeOptions[index];
                            return share_opts(
                              text: item["text"],
                              icon: item["icon"],
                              ontap: homeOptions[index]["onTap"],
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
                            text: 'How it Works',
                            size: 20,
                            fontFamily: AppFonts.gilroyBold,
                            paddingBottom: 16,
                          ),
                          mesg_tile(
                            icon: Assets.imagesOne,
                            hasIcon: true,
                            imgSize: 20,
                            title: 'Share your code',
                            desc:
                                'Send your referral code or link to friends via your preferred method',
                          ),
                          mesg_tile(
                            icon: Assets.imagesTwo,
                            hasIcon: true,
                            imgSize: 20,
                            title: 'Friend joins Survyr',
                            desc:
                                'They sign up using your code and create their profile',
                          ),
                          mesg_tile(
                            icon: Assets.imagesThree,
                            hasIcon: true,
                            imgSize: 20,
                            title: 'Earn rewards',
                            desc:
                                'You both get get a month free when they complete their first survey',
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
                                    text: 'Your Referrals',
                                    size: 20,
                                    fontFamily: AppFonts.gilroyBold,
                                    paddingBottom: 16,
                                    onTap: () {
                                      Get.to(() => ManageGroup());
                                    },
                                  ),
                                ),
                                buttonContainer(
                                  text: '3 Active',
                                  bgColor: getfifth(context),
                                  radius: 50,
                                  vPadding: 3,
                                  txtColor: getSecondaryColor(context),
                                  textsize: 11,
                                ),
                              ],
                            ),
                            ListView.separated(
                              separatorBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8, top: 8),
                                child: Divider(
                                  color: getfifth(context),
                                ),
                              ),
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return mesg_tile(
                                  isStart: true,
                                  hasStatus: true,
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

class share_opts extends StatelessWidget {
  final String? text, icon;
  final VoidCallback? ontap;
  const share_opts({
    super.key,
    this.text,
    this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: ontap,
      child: CustomeContainer(
        radius: 8,
        vpad: 16,
        hpad: 16,
        color: getfifth(context),
        widget: Column(
          children: [
            Image.asset(
              icon ?? Assets.imagesMesgd,
              width: 48,
            ),
            MyText(
              text: text ?? 'Messages',
              size: 11,
              textAlign: TextAlign.center,
              fontFamily: AppFonts.gilroyMedium,
              paddingTop: 6,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
