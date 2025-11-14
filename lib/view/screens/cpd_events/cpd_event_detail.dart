import 'dart:ui';

import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/cpd_events/cpd_event_riskmanagement.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/bullet_points.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/cpd_events_widgets/cpd_events_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CpdEventDetail extends StatelessWidget {
  const CpdEventDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final List learn = [
      'Master advanced project management methodologies and best practices',
      'Develop leadership skills for construction teams and stakeholders',
      'Understand digital transformation trends in construction industry',
      'Learn effective risk assessment and mitigation strategies'
    ];
    final List items = [
      'Project Management',
      'Leadership',
      'Innovation',
      'Risk Management'
    ];
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Event Details', centerTitle: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                // padding:
                //     const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  CommonImageView(
                    imagePath: Assets.imagesHouse,
                    height: 200,
                  ),
                  CustomeContainer(
                    radius: 0,
                    hpad: 16,
                    vpad: 16,
                    color: getfillcolor(context),
                    widget: Column(
                      children: [
                        Row(
                          spacing: 6,
                          children: [
                            TagsWidget(
                              bgColor: getfifth(context),
                              radius: 6,
                              borderColor: ktransparent,
                              textSize: 10,
                              'CONFERENCE',
                            ),
                            row_widget(
                              title: 'Jan 15, 2025',
                              icon: Assets.imagesCalender3,
                              iconSize: 13,
                              texSize: 11,
                              fontFamily: AppFonts.gilroyMedium,
                              textColor: getTertiary(context),
                              iconColor: getTertiary(context),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TwoTextedColumn(
                          text1: 'Construction Management Excellence Summit',
                          text2: 'Hosted by RICS Professional Standards',
                          size1: 24,
                          size2: 14,
                          fontFamily: AppFonts.gilroyBold,
                          color2: getTertiary(context),
                          maxLines: 2,
                          lineHeight: 1.6,
                        ),
                        SizedBox(height: 3),
                      ],
                    ),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    radius: 12,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    mleft: 16,
                    mrigth: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: twoTexted_icon_row(),
                            ),
                            Expanded(
                              child: twoTexted_icon_row(
                                text1: 'Duration',
                                text2: '8 hours',
                                text3: 'Full day event',
                                color3: getTertiary(context),
                                icon: Assets.imagesClock,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: twoTexted_icon_row(
                                text1: 'Mode',
                                text2: 'Hybrid',
                                text3: 'In-person + Online',
                                color3: getTertiary(context),
                                icon: Assets.imagesUsers,
                              ),
                            ),
                            Expanded(
                              child: twoTexted_icon_row(
                                text1: 'Location',
                                text2: 'London, UK',
                                text3: 'ExceL London',
                                color3: getTertiary(context),
                                icon: Assets.imagesLocation,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Divider(
                            color: getSecondaryColor(context),
                          ),
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Image.asset(
                              Assets.imagesPound,
                              width: 16,
                              height: 16,
                              color: getSecondaryColor(context),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TwoTextedColumn(
                                      text1: 'Event Price',
                                      text2: '£295',
                                      size1: 12,
                                      size2: 20,
                                      fontFamily2: AppFonts.gilroyBold,
                                      color1: getTertiary(context),
                                      fontFamily: AppFonts.gilroySemiBold),
                                  TwoTextedColumn(
                                    text1: 'Early bird until',
                                    text2: 'Dec 31, 2024',
                                    size1: 12,
                                    color1: getTertiary(context),
                                    size2: 12,
                                    color2: getTertiary(context),
                                    fontFamily2: AppFonts.gilroyMedium,
                                    fontFamily: AppFonts.gilroyMedium,
                                    align: TextAlign.end,
                                    alignment: ColumnAlignment.end,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    mbott: 16,
                  ),
                  MyText(
                    text: 'Competency Areas',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 16,
                    paddingLeft: 16,
                    paddingRight: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: (items)
                          .map(
                            (tag) => TagsWidget(
                              tag,
                              bgColor: getfifth(context),
                              borderColor: ktransparent,
                              radius: 8,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  CustomeContainer(
                    mtop: 16,
                    radius: 12,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    mleft: 16,
                    mrigth: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Learning Outcomes',
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 16,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: learn.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: MyBullet(
                                point: learn[index],
                                size: 14,
                                fontFamily: AppFonts.gilroyMedium,
                                bulletIcon: Assets.imagesError,
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
                    vpad: 16,
                    hpad: 16,
                    mleft: 16,
                    mrigth: 16,
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'About This Event',
                            size: 16,
                            fontFamily: AppFonts.gilroyBold,
                            paddingBottom: 16,
                          ),
                          MyText(
                            text:
                                'Join industry leaders and experts for a comprehensive exploration of construction management excellence. This summit brings together the latest insights, methodologies, and technologies shaping the future of construction project delivery.\n\nJoin industry leaders and experts for a comprehensive exploration of construction management excellence. This summit brings together the latest insights, methodologies, and technologies shaping the future of construction project delivery.\n\nJoin industry leaders and experts for a comprehensive exploration of construction management excellence. This summit brings together the latest insights, methodologies, and technologies shaping the future of construction project delivery.',
                            size: 14,
                            fontFamily: AppFonts.gilroyMedium,
                            paddingBottom: 8,
                          ),
                          Divider(
                            color: getSecondaryColor(context),
                          ),
                          MyText(
                            text: 'Event Includes:',
                            size: 12,
                            fontFamily: AppFonts.gilroyMedium,
                            paddingBottom: 8,
                            color: getTertiary(context),
                          ),
                          ListView.builder(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: MyBullet(
                                  point:
                                      'Welcome breakfast and networking lunch',
                                  size: 12,
                                  fontFamily: AppFonts.gilroyMedium,
                                ),
                              );
                            },
                          ),
                        ]),
                    mbott: 16,
                  ),
                  MyButton(
                    mhoriz: 16,
                    buttonText: 'Register Now - £295',
                    mBottom: 16,
                    onTap: () {
                        Get.to(() => CpdEventRiskmanagement());
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: buttonContainer(
                            text: 'Add to Calendar',
                            imagePath: Assets.imagesAddcalender,
                            iconColor: getSecondaryColor(context),
                            iconSize: 14,
                            borderColor: getSecondaryColor(context),
                            radius: 8,
                            bgColor: ktransparent,
                          ),
                        ),
                        Expanded(
                          child: buttonContainer(
                            text: 'Save Event',
                            imagePath: Assets.imagesBookmark,
                            iconColor: getSecondaryColor(context),
                            iconSize: 14,
                            borderColor: getSecondaryColor(context),
                            radius: 8,
                            bgColor: ktransparent,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomeContainer(
                    radius: 8,
                    vpad: 16,
                    hpad: 16,
                    mleft: 16,
                    mrigth: 16,
                    mtop: 16,
                    borderColor: getSecondaryColor(context),
                    color: ktransparent,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                              Image.asset(
                                Assets.imagesInfo,
                                width: 17,
                                color: getSecondaryColor(context),
                              ),
                              Expanded(
                                  child: TwoTextedColumn(
                                text1: 'CPD Hours Guidance',
                                text2:
                                    '“Survyr does not award CPD hours. Please follow your institution guidance',
                                size1: 12,
                                size2: 12,
                                color2: getTertiary(context),
                                fontFamily: AppFonts.gilroyMedium,
                              ))
                            ])
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
