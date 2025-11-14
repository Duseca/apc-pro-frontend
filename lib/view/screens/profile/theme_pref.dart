import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/profile_widgets/profile_widgets.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';

class ThemePref extends StatelessWidget {
  const ThemePref({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Theme Preferences', centerTitle: true),
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
                  theme_selection_card(),
                  theme_selection_card(
                    theme: 'Light Theme',
                    title: 'Light Mode',
                    desc: 'Classic light appearance',
                    bgColor: getSecondaryColor(context),
                    fontColor: getsplashcolor(context),
                  ),
                  theme_selection_card(
                    theme: 'Dark Theme',
                    title: 'Dark Mode',
                    desc: 'Easy on the eyes',
                    bgColor: getsplashcolor(context),
                    fontColor: getSecondaryColor(context),
                  ),
                  MyText(
                    text: 'Live Preview',
                    paddingBottom: 16,
                    fontFamily: AppFonts.gilroyBold,
                    size: 16,
                  ),
                  CustomeContainer(
                      mbott: 16,
                      radius: 8,
                      borderColor: getfifth(context),
                      vpad: 16,
                      color: getfillcolor(context),
                      hpad: 16,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomeContainer(
                                mtop: 10,
                                radius: 8,
                                color: getsplashcolor(context),
                                vpad: 12,
                                hpad: 12,
                                widget: Column(
                                    spacing: 8,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            Assets.imagesMenu,
                                            width: 10,
                                            color: getSecondaryColor(context),
                                          ),
                                          MyText(
                                            text: 'Preview',
                                            fontFamily: AppFonts.gilroyMedium,
                                          ),
                                          Image.asset(
                                            Assets.imagesSearch,
                                            width: 10,
                                            color: getSecondaryColor(context),
                                          )
                                        ],
                                      ),
                                      CustomeContainer(
                                        mtop: 10,
                                        radius: 8,
                                        color: getfillcolor(context),
                                      ),
                                      CustomeContainer(
                                        mtop: 10,
                                        radius: 8,
                                        color: getfillcolor(context),
                                      ),

                                      Divider(color: getfifth(context),),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            Assets.imagesHomeunfilled,
                                            width: 10,
                                            color: getSecondaryColor(context),
                                          ),
                                          Image.asset(
                                            Assets.imagesHeart,
                                            color: getSecondaryColor(context),
                                            width: 10,
                                          ),
                                          Image.asset(
                                            Assets.imagesProfileunfilled,
                                            width: 10,
                                            color: getSecondaryColor(context),
                                          )
                                        ],
                                      ),
                                    ]))
                          ])),
                  MyText(
                    text: 'Advanced Options',
                    paddingBottom: 16,
                    fontFamily: AppFonts.gilroyBold,
                    size: 16,
                  ),
                  CustomeContainer(
                      mbott: 16,
                      radius: 8,
                      borderColor: getfifth(context),
                      vpad: 16,
                      color: getfillcolor(context),
                      hpad: 16,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            notification_pref_row(
                              title: 'Auto-switch based on time',
                              desc: 'Switch to dark mode after sunset',
                              size1: 14,
                              size2: 12,
                            )
                          ])),
                  CustomeContainer(
                      mbott: 16,
                      radius: 8,
                      borderColor: getfifth(context),
                      vpad: 16,
                      color: getfillcolor(context),
                      hpad: 16,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'Custom Schedule',
                              paddingBottom: 16,
                              fontFamily: AppFonts.gilroyBold,
                              size: 16,
                            ),
                            ExpandedRow(
                              text1: 'Light mode starts',
                              text2: '7:00 AM',
                              size1: 11.8,
                              size2: 11.8,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            ExpandedRow(
                              text1: 'Dark mode starts',
                              text2: '8:00 AM',
                              size1: 11.8,
                              size2: 11.8,
                            ),
                          ])),
                  MyButton(
                    buttonText: 'Apply Theme',
                    mBottom: 16,
                  ),
                  Center(
                    child: MyText(
                      text: 'Reset to Default',
                      paddingBottom: 16,
                      fontFamily: AppFonts.gilroyBold,
                      size: 16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class theme_selection_card extends StatelessWidget {
  final String? title, desc, theme;
  final Color? bgColor, fontColor;
  const theme_selection_card({
    super.key,
    this.title,
    this.desc,
    this.theme,
    this.bgColor,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      mbott: 16,
      radius: 8,
      borderColor: getfifth(context),
      vpad: 17,
      color: getfillcolor(context),
      hpad: 17,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              CustomCheckBox(
                isActive: true,
                onTap: () {},
                iscircle: true,
                size: 17,
                circleIconsize: 13,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TwoTextedColumn(
                    text1: title ?? 'System Default',
                    text2: desc ?? 'Follow device settings',
                    size1: 14,
                    size2: 12,
                    fontFamily: AppFonts.gilroyBold,
                    color2: getTertiary(context),
                  ),
                  CustomeContainer(
                      mtop: 10,
                      radius: 8,
                      color: bgColor ?? getfifth(context),
                      vpad: 12,
                      hpad: 12,
                      widget: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            checkbox_row(
                              cbg: getfifth(context),
                              cBorder: getfifth(context),
                              title: theme ?? 'Auto Theme',
                              textColor: fontColor ?? getTertiary(context),
                            ),
                            linearProgressIndicatorr(
                              height: 8,
                              valueColor: fontColor,
                            )
                          ]))
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}
