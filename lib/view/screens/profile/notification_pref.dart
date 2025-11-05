import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/profile_widgets/profile_widgets.dart';
import 'package:apc_pro/view/widgets/switch_button.dart';
import 'package:flutter/material.dart';

class SettingItem {
  final String title;
  bool value;
String?desc;
bool? hasSwitch;
  SettingItem({required this.title, this.value = false,this.desc,this.hasSwitch=true});
}

class NotificationPref extends StatelessWidget {
  const NotificationPref({super.key});

  @override
  Widget build(BuildContext context) {
    List<SettingItem> learningAndProgress = [
      SettingItem(title: "Quiz reminders", value: true),
      SettingItem(title: "Learning streak notifications", value: true),
      SettingItem(title: "Achievement badges", value: false),
      SettingItem(title: "Progress milestone alerts", value: true),
      SettingItem(title: "Study plan reminders", value: true),
    ];

    List<SettingItem> communityActivity = [
      SettingItem(title: "New discussion replies", value: true),
      SettingItem(title: "Forum mentions", value: false),
      SettingItem(title: "Following user activity", value: true),
      SettingItem(title: "Community event updates", value: false),
    ];

    List<SettingItem> accountAndSecurity = [
      SettingItem(title: "Login alerts", value: true),
      SettingItem(title: "Password change confirmations", value: true),
      SettingItem(title: "Security alerts", value: true),
      SettingItem(title: "Payment & billing notifications", value: false),
    ];

    List<SettingItem> emailNotifications = [
      SettingItem(title: "Weekly progress summary", value: true),
      SettingItem(title: "Monthly newsletter", value: false),
      SettingItem(title: "Product updates", value: true),
      SettingItem(title: "Marketing communications", value: false),
    ];

    List<SettingItem> notificationTiming = [
      SettingItem(title: "Quiet hours", value: false,desc: '10:00 PM - 8:00 AM',hasSwitch: false),
      SettingItem(title: "Weekend notifications", value: true),
      SettingItem(title: 'Time zone',value:true,desc: 'Eastern Time (UTC-5)',hasSwitch: false)
    ];

    List<SettingItem> deliveryMethod = [
      SettingItem(title: "Push notifications", value: true),
      SettingItem(title: "Email notifications", value: false),
      SettingItem(title: "SMS notifications", value: false),
    ];

    List<SettingItem> advancedSettings = [
      SettingItem(title: "Notification sound", value: false,hasSwitch: false),
      SettingItem(title: "Vibration", value: true),
    ];

    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Notification Preferences',
            centerTitle: true),
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
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        notification_pref_row(
                          desc: 'System notifications enabled',
                        ),
                      ],
                    ),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Learning & Progress',
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 15,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: learningAndProgress.length,
                          itemBuilder: (context, index) {
                            final item = learningAndProgress[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: notification_pref_row(
                                title: item.title,
                                value: item.value,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    mbott: 16,
                  ),
                   CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Community Activity',
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 15,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: communityActivity.length,
                          itemBuilder: (context, index) {
                            final item = communityActivity[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: notification_pref_row(
                                title: item.title,
                                value: item.value,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    mbott: 16,
                  ),

                        CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Account & Security',
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 15,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: accountAndSecurity.length,
                          itemBuilder: (context, index) {
                            final item = accountAndSecurity[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: notification_pref_row(
                                title: item.title,
                                value: item.value,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    mbott: 16,
                  ),

                   CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Email Notifications',
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 15,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: emailNotifications.length,
                          itemBuilder: (context, index) {
                            final item =emailNotifications[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: notification_pref_row(
                                title: item.title,
                                value: item.value,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    mbott: 16,
                  ), CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Notification Timing',
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 15,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: notificationTiming.length,
                          itemBuilder: (context, index) {
                            final item = notificationTiming[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: notification_pref_row(
                                title: item.title,
                                value: item.value,
                                desc: item.desc,
                                hasSwitch: item.hasSwitch,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    mbott: 16,
                  ), CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Delivery Method',
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 15,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: deliveryMethod.length,
                          itemBuilder: (context, index) {
                            final item = deliveryMethod[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: notification_pref_row(
                                title: item.title,
                                value: item.value,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Advanced Settings',
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 15,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: advancedSettings.length,
                          itemBuilder: (context, index) {
                            final item = advancedSettings[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: notification_pref_row(
                                title: item.title,
                                value: item.value,
                                hasSwitch: item.hasSwitch,
                                isDefault: index==0?true:false,
                              ),
                            );
                          },
                        )
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

