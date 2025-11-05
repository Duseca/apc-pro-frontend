import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/profile_widgets/profile_widgets.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends StatelessWidget {
  Language({super.key});

  // Reactive variable to hold the selected language index
  final RxInt selectedIndex = (-1).obs;

  final List<String> languages = [
    'English (US)',
    'English (UK)',
    'Spanish (España)',
    'Spanish (México)',
    'French (France)',
    'French (Canada)',
    'German',
    'Italian',
    'Portuguese (Brazil)',
    'Chinese (Simplified)',
    'Chinese (Traditional)',
    'Japanese',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        context: context,
        title: 'Language',
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                MyTextField2(
                  hint: 'Search languages...',
                  bordercolor: getfifth(context),
                  filledColor: ktransparent,
                  prefixIcon: Image.asset(
                    Assets.imagesSearch,
                    width: 16,
                  ),
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
                        text: 'Current Language',
                        paddingBottom: 16,
                        size: 16,
                        fontFamily: AppFonts.gilroyBold,
                      ),
                      language_row(language: 'English (US)', isSelected: true)
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
                        text: 'Available Languages',
                        paddingBottom: 16,
                        size: 16,
                        fontFamily: AppFonts.gilroyBold,
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Divider(color: getfifth(context)),
                          );
                        },
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: languages.length,
                        itemBuilder: (context, index) {
                          return Obx(() => language_row(
                                language: languages[index],
                                isSelected: selectedIndex.value == index,
                                ontap: () {
                                  if (selectedIndex.value == index) {
                                    // Deselect if tapped again
                                    selectedIndex.value = -1;
                                  } else {
                                    selectedIndex.value = index;
                                  }
                                },
                              ));
                        },
                      ),
                    ],
                  ),
                ),
                CustomeContainer(
                    mbott: 16,
                    mtop: 16,
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Regional Settings',
                            paddingBottom: 16,
                            size: 16,
                            fontFamily: AppFonts.gilroyBold,
                          ),
                          notification_pref_row(
                            title: 'Date Format',
                            desc: 'MM/DD/YYYY',
                            hasSwitch: false,
                            fontFamily: AppFonts.gilroyRegular,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Divider(
                              color: getfifth(context),
                            ),
                          ),
                          notification_pref_row(
                            title: 'Number Format',
                            desc: '1,234.56',
                            hasSwitch: false,
                            fontFamily: AppFonts.gilroyRegular,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Divider(
                              color: getfifth(context),
                            ),
                          ),
                          notification_pref_row(
                            title: 'Currency Display',
                            desc: 'USD (\$)',
                            hasSwitch: false,
                            fontFamily: AppFonts.gilroyRegular,
                          )
                        ])),
                CustomeContainer(
                    mbott: 16,
                    mtop: 16,
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Content Language',
                            paddingBottom: 16,
                            size: 16,
                            fontFamily: AppFonts.gilroyBold,
                          ),
                          notification_pref_row(
                            title: 'Keep Learning Content in English',
                            desc:
                                'Interface language will change, content stays in English',
                            fontFamily: AppFonts.gilroyRegular,
                          ),
                        ])),
                CustomeContainer(
                    mbott: 16,
                    mtop: 16,
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                Assets.imagesInfo,
                                color: getSecondaryColor(context),
                                width: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TwoTextedColumn(
                                  text1: 'Language changes apply immediately',
                                  text2:
                                      'App restart may be required for some changes',
                                  color2: getTertiary(context),
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          MyButton(
                            mTop: 20,
                            buttonText: 'Continue in English (US)',
                            backgroundColor: getSecondaryColor(context),
                          )
                        ])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class language_row extends StatelessWidget {
  final String? language;
  final bool isSelected;
  final VoidCallback? ontap;

  const language_row({
    super.key,
    this.language,
    required this.isSelected,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: ontap,
      child: Row(
        children: [
          Expanded(
            child: MyText(
              text: language ?? 'English (US)',
              size: 15,
            ),
          ),
          if (isSelected)
            Image.asset(
              Assets.imagesTick,
              width: 15,
            )
        ],
      ),
    );
  }
}
