import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/submittion_planner/ai_planning_assistant.dart';
import 'package:apc_pro/view/screens/profile/contact_support.dart';
import 'package:apc_pro/view/screens/profile/edit_profile.dart';
import 'package:apc_pro/view/screens/profile/faqs.dart';
import 'package:apc_pro/view/screens/profile/subscription.dart';
import 'package:apc_pro/view/screens/profile/terms_services.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/profile_widgets/profile_widgets.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'privacy_policy.dart';
import 'reviews.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> drawerItems = [
      {
        'title': 'Select Theme',
        'icon': Assets.imagesMoon,
        'onTap': () {
          // Handle theme selection
        }
      },
      {
        'title': 'Language',
        'icon': Assets.imagesGlobe,
        'onTap': () {
          // Handle language selection
        }
      },
      {
        'title': 'Edit Profile',
        'icon': Assets.imagesEdit2,
        'onTap': () {
          Get.to(() => EditProfile());
        }
      },
      {
        'title': 'Saved Items',
        'icon': Assets.imagesSaved,
        'onTap': () {
          // Handle saved items
        }
      },
      {
        'title': 'Subscription and Billings',
        'icon': Assets.imagesCards,
        'onTap': () {
          Get.to(() => Subscription());
        }
      },
      {
        'title': 'Notification Preferences',
        'icon': Assets.imagesNotification,
        'onTap': () {}
      },
      {
        'title': 'Contact Support',
        'icon': Assets.imagesComment,
        'onTap': () {
          Get.to(() => ContactSupport());
        }
      },
      {
        'title': 'FAQ’s & Help Center',
        'icon': Assets.imagesMes3,
        'onTap': () {
          Get.to(() => Faqs());
        }
      },
      {
        'title': 'Submit Feedback',
        'icon': Assets.imagesStar,
        'onTap': () {
          Get.to(() => Reviews());
        }
      },
      {
        'title': 'Terms Of Service',
        'icon': Assets.imagesDocument,
        'onTap': () {
          Get.to(() => TermsConditions());
        }
      },
      {
        'title': 'Privacy Policy',
        'icon': Assets.imagesPrivacy,
        'onTap': () {
          Get.to(() => PrivacyPolicy());
        }
      },
      {'title': 'Export Data', 'icon': Assets.imagesExport2, 'onTap': () {}},
      {
        'title': 'Logout',
        'icon': Assets.imagesLogout,
        'onTap': () {
          SuccessDialog.showSuccessDialog('Logout', context,
              message: 'Are you sure you want to logout?',
              ButtonText: 'Cancel',
              button2text: 'Logout',
              hasSecbutton: true,
              borderColor: ktransparent,
              bgColor: kblack,
              b1Color: ktransparent,
              b1text: ksecondary,
              hasbutton: true);
        }
      },
    ];

    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Profile',
            centerTitle: true,
            haveBackButton: false),
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
                  AddProfileImg(),
                  Center(
                    child: MyText(
                      paddingTop: 12,
                      text: 'Robert Fox',
                      size: 18,
                      fontFamily: AppFonts.gilroyMedium,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      profile_iinfo_widget(
                        icon: Assets.imagesPathwat,
                      ),
                      profile_iinfo_widget(
                        icon: Assets.imagesPathwat,
                        title: 'Career Stage',
                        desc: 'APC Candidate',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      profile_iinfo_widget(
                        title: 'Region',
                        icon: Assets.imagesGlobe,
                        desc: 'North America',
                      ),
                      profile_iinfo_widget(
                        icon: Assets.imagesClock,
                        title: 'Member Since',
                        desc: '08/25/2025',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Center(
                    child: row_widget(
                      title: 'Progress Summary',
                      icon: Assets.imagesAward,
                      iconColor: kwhite,
                      iconSize: 20,
                      texSize: 18,
                      fontFamily: AppFonts.gilroyBold,
                    ),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: recommendations(
                          bgColor: Color(0xff2AA4F4),
                          text1: '75%',
                          text2: 'Overall Progress',
                        ),
                      ),
                      Expanded(
                        child: recommendations(
                          bgColor: ksecondary,
                          text2: 'Badge',
                          text1: '1',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: drawerItems.length,
                    itemBuilder: (context, index) {
                      final item = drawerItems[index];

                      final widgetTile = index == 5
                          ? buildDrawerItem(
                              item['title'],
                              item['icon'],
                              hasSwitch: true,
                              hasShadow: true,
                            )
                          : Bounce(
                              onTap: item['onTap'],
                              duration: Duration(milliseconds: 10),
                              child: buildDrawerItem(
                                item['title'],
                                item['icon'],
                                hasIcon:
                                    index == 0 || index == 1 ? true : false,
                                hasShadow: true,
                              ),
                            );

                      return Column(
                        children: [
                          widgetTile,
                          if ([1, 4, 5, 8, 10, 11].contains(index))
                            Padding(
                              padding: const EdgeInsets.only(bottom: 22),
                              child: Divider(
                                color: Color(0xff0D336C),
                                // thickness: 0.7,
                                // height: 16,
                              ),
                            ),
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
