import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/groups/refer_friend.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/groups_widget/group_widget.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Groups extends StatelessWidget {
  const Groups({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar:
            simpleAppBar(context: context, centerTitle: true, title: 'Groups'),
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
                    text1: 'Collaborate with Groups',
                    text2:
                        'Join a team or create your own to compare quiz performance and CPD plans',
                  ),
                  CustomeContainer(
                    radius: 12,
                    color: getfillcolor(context),
                    widget: Column(
                      children: [
                        MyButton(
                          buttonText: 'Invite Your Friends to Survyr',
                          onTap: () => {
                            Get.to(() => ReferFriend()),
                          },
                        )
                      ],
                    ),
                    mbott: 16,
                  ),
                  create_group_widget(),
                  create_group_widget(
                    hasCode: true,
                    buttonText: 'Join Group',
                  ),
                  TwoTextedColumn(
                    text1: 'My Groups',
                    text2: "Groups you've created or joined",
                    size1: 20,
                    size2: 14,
                    color2: getTertiary(context),
                    color1: getSecondaryColor(context),
                    fontFamily: AppFonts.gilroyBold,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  no_group_container(),
                  CustomeContainer(
                    radius: 12,
                    color: getfillcolor(context),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Group Features',
                          size: 20,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 16,
                        ),
                        group_features_row(
                            icon: isDarkMode
                                ? Assets.imagesShared
                                : Assets.imagesSharel),
                        group_features_row(
                            text1: 'Live group insights',
                            text2:
                                'View combined quiz results, leaderboards and CPD plans',
                            icon: isDarkMode
                                ? Assets.imagesLived
                                : Assets.imagesLivel),
                        group_features_row(
                            text1: 'Team Communication',
                            text2: 'Talk through results and CPD plans',
                            icon: isDarkMode
                                ? Assets.imagesTeamd
                                : Assets.imagesTeaml),
                      ],
                    ),
                    mbott: 16,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class group_features_row extends StatelessWidget {
  final String? text1, text2, icon;
  const group_features_row({
    super.key,
    this.text1,
    this.text2,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Image.asset(
            icon ?? Assets.imagesShared,
            width: 32,
            height: 32,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TwoTextedColumn(
              text1: text1 ?? 'Shared Quiz Results',
              fontFamily: AppFonts.gilroySemiBold,
              text2: text2 ??
                  'Set up group quizzes, share an access code, and compare scores',
              size1: 14,
              size2: 12,
              color2: getTertiary(context),
            ),
          )
        ],
      ),
    );
  }
}
