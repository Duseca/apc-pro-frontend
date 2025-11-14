import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/screens/profile/groups/groups.dart';
import 'package:apc_pro/view/screens/profile/subscription/subscription_info.dart';
import 'package:apc_pro/view/screens/profile/edit_profile.dart';
import 'package:apc_pro/view/screens/profile/language.dart';
import 'package:apc_pro/view/screens/profile/notification_pref.dart';
import 'package:apc_pro/view/screens/profile/support/help_support.dart';
import 'package:apc_pro/view/screens/profile/terms_services.dart';
import 'package:apc_pro/view/screens/profile/theme_pref.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/profile_widgets/profile_widgets.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
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
        'title': 'Explore Groups',
        //'icon': Assets.imagesMoon,
        'onTap': () {
          Get.to(() => Groups());
        }
      },
      {
        'title': 'Invite Friends to Servyr',
        //'icon': Assets.imagesGlobe,
        'onTap': () {
          Get.to(() => Language());
        }
      },
      {
        'title': 'Select Theme',
        //'icon': Assets.imagesMoon,
        'onTap': () {
          Get.to(() => ThemePref());
        }
      },
      {
        'title': 'Language',
        //'icon': Assets.imagesGlobe,
        'onTap': () {
          Get.to(() => Language());
        }
      },
      {
        'title': 'Edit Profile',
        // 'icon': Assets.imagesEdit2,
        'onTap': () {
          Get.to(() => EditProfile());
        }
      },
      // {
      //   'title': 'Saved Items',
      //   // 'icon': Assets.imagesSaved,
      //   'onTap': () {
      //    // Get.to(() => SavedItems());
      //   }
      // },
      {
        'title': 'Subscription and Billings',
        //'icon': Assets.imagesCards,
        'onTap': () {
          Get.to(() => SubscriptionInfo());
        }
      },
      {
        'title': 'Notification Preferences',
        //'icon': Assets.imagesNotification,
        'onTap': () {
          Get.to(() => NotificationPref());
        }
      },
      {
        'title': 'Contact Support',
        //'icon': Assets.imagesComment,
        'onTap': () {
         // Get.to(() => ContactSupport());
        }
      },
      {
        'title': 'FAQ’s & Help Center',
        // 'icon': Assets.imagesMes3,
        'onTap': () {
          Get.to(() => HelpSupport());
        }
      },
      {
        'title': 'Submit Feedback',
        //'icon': Assets.imagesStar,
        'onTap': () {
          Get.to(() => Reviews());
        }
      },
      {
        'title': 'Terms Of Service',
        //'icon': Assets.imagesDocument,
        'onTap': () {
          Get.to(() => TermsConditions());
        }
      },
      {
        'title': 'Privacy Policy',
        // 'icon': Assets.imagesPrivacy,
        'onTap': () {
          Get.to(() => PrivacyPolicy());
        }
      },
      {
        'title': 'Export Data',
        //'icon': Assets.imagesExport2,
        'onTap': () {}
      },
      {
        'title': 'Delete Account',
        // 'icon': Assets.imagesExport2,
        'onTap': () {
          SuccessDialog.showSuccessDialog('Delete Account', context,
              message: 'Are you sure you want to delete your account?',
              ButtonText: 'Cancel',
              button2text: 'Delete',
              hasSecbutton: true,
              borderColor: ktransparent,
              bgColor: getsplashcolor(context),
              b1Color: ktransparent,
              b1text: getSecondaryColor(context),
              hasbutton: true);
        },
        'color': kred,
      },
      {
        'title': 'Logout',
        //'icon': Assets.imagesLogout,
        'onTap': () {
          SuccessDialog.showSuccessDialog('Logout', context,
              message: 'Are you sure you want to logout?',
              ButtonText: 'Cancel',
              button2text: 'Logout',
              hasSecbutton: true,
              borderColor: ktransparent,
              bgColor: getsplashcolor(context),
              b1Color: ktransparent,
              b1text: getSecondaryColor(context),
              hasbutton: true);
        }
      },
    ];
    final groups = drawerItems.sublist(0, 2);
    final accountPersonalization = drawerItems.sublist(2, 4);
    final profileManagement = drawerItems.sublist(4, 5);
    final accountBilling = drawerItems.sublist(5, 6);
    final preferencesSettings = drawerItems.sublist(6, 7);
    final supportHelp = drawerItems.sublist(7, 10);
    final legalPrivacy = drawerItems.sublist(10, 12);
    final dataSecurity = drawerItems.sublist(12);

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
                  Row(
                    children: [
                      CommonImageView(
                        url: dummyImage,
                        radius: 100,
                        width: 64,
                        height: 64,
                      ),
                      Expanded(
                        child: MyText(
                          paddingLeft: 10,
                          text: 'Robert Fox',
                          size: 20,
                          fontFamily: AppFonts.gilroyBold,
                        ),
                      ),
                    ],
                  ),
                  CustomeContainer(
                    mtop: 20,
                    mbott: 20,
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      spacing: 12,
                      children: [
                        ExpandedRow(
                          text1: 'Pathway',
                          text2: 'Project Management',
                          size1: 14,
                          size2: 14,
                        ),
                        ExpandedRow(
                          text1: 'Career Stage',
                          text2: 'APC Candidate',
                          size1: 14,
                          size2: 14,
                        ),
                        ExpandedRow(
                          text1: 'Region',
                          text2: 'North America',
                          size1: 14,
                          size2: 14,
                        ),
                        ExpandedRow(
                          text1: 'Member Since',
                          text2: '08/25/2025',
                          size1: 14,
                          size2: 14,
                        ),
                      ],
                    ),
                  ),
                  row_widget(
                    title: 'Progress Summary',
                    icon: Assets.imagesAward,
                    iconColor: getSecondaryColor(context),
                    iconSize: 20,
                    texSize: 18,
                    fontFamily: AppFonts.gilroyBold,
                  ),
                  CustomeContainer(
                    mtop: 20,
                    mbott: 20,
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      spacing: 12,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TwoTextedColumn(
                              text1: '75%',
                              text2: 'Overall Progress',
                              size1: 24,
                              size2: 14,
                              align: TextAlign.center,
                              fontFamily: AppFonts.gilroyBold,
                              fontFamily2: AppFonts.gilroyMedium,
                              alignment: ColumnAlignment.center,
                            ),
                            TwoTextedColumn(
                              text1: '1',
                              text2: 'Badge',
                              size1: 24,
                              size2: 14,
                              align: TextAlign.center,
                              fontFamily: AppFonts.gilroyBold,
                              fontFamily2: AppFonts.gilroyMedium,
                              alignment: ColumnAlignment.center,
                            ),
                          ],
                        ),
                        linearProgressIndicatorr(
                          height: 6,
                        )
                      ],
                    ),
                  ),
                  MyText(
                      text: 'Groups',
                      size: 16,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 12),
                  profile_container(count: groups.length, items: groups),
                  MyText(
                      text: 'Account & Personalization',
                      size: 16,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 12),
                  profile_container(
                      count: accountPersonalization.length,
                      items: accountPersonalization),
                  MyText(
                      text: 'Profile Management',
                      size: 16,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 12),
                  profile_container(
                      count: profileManagement.length,
                      items: profileManagement),
                  MyText(
                      text: 'Account & Billing',
                      size: 16,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 12),
                  profile_container(
                      count: accountBilling.length, items: accountBilling),
                  MyText(
                      text: 'Preferences & Settings',
                      size: 16,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 12),
                  profile_container(
                      count: preferencesSettings.length,
                      items: preferencesSettings),
                  MyText(
                      text: 'Support & Help',
                      size: 16,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 12),
                  profile_container(
                      count: supportHelp.length, items: supportHelp),
                  MyText(
                      text: 'Legal & Privacy',
                      size: 16,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 12),
                  profile_container(
                      count: legalPrivacy.length, items: legalPrivacy),
                  MyText(
                      text: 'Data & Security',
                      size: 16,
                      fontFamily: AppFonts.gilroyBold,
                      paddingBottom: 12),
                  profile_container(
                    count: dataSecurity.length,
                    items: dataSecurity,
                    textColor: kred,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class profile_container extends StatelessWidget {
  final int count;
  final Color? textColor;
  final List<Map<String, dynamic>> items;
  const profile_container({
    super.key,
    required this.count,
    required this.items,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      mbott: 22,
      color: getfillcolor(context),
      vpad: 16,
      hpad: 16,
      radius: 8,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 8),
                child: Divider(
                  color: getfifth(context),
                ),
              );
            },
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
                count, // drawerItems.length >= 2 ? 2 : drawerItems.length,
            itemBuilder: (context, index) {
              final item = items[index]; //drawerItems[index];
              return Bounce(
                onTap: item['onTap'],
                duration: Duration(milliseconds: 10),
                child: buildDrawerItem(
                    item['title'],
                    // item['icon'],
                    context,
                    hasIcon: true,
                    contentColor: item['color']),
              );
            },
          ),
        ],
      ),
    );
  }
}
