import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/bullet_points.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/home_widgets/apc_diary_widgets.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class EntriesDetail extends StatelessWidget {
  const EntriesDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final List work = [
      'Conducted detailed survey of Victorian terraced property focusing on structural defects and dampness issues.',
      'Identified rising damp in ground floor walls',
      'Assessed timber floor joists for decay',
      'Documented roof tile slippage'
    ];
    final List<Map<String, String>> AiEnhancement = [
      {
        "title": "Enhance Description",
        // "desc": "Get suggestions to improve technical detail and clarity",
        'icon': Assets.imagesEdit2
      },
      {
        "title": "Deepen Reflections",
        // "desc": "Add meaningful insights and learning connections",
        'icon': Assets.imagesBrain
      },
      {
        "title": "RICS Compliance",
        // "desc": "Ensure entry meets all RICS diary requirements",
        'icon': Assets.imagesBadge
      },
    ];
    final List<String> tagList = [
      'Laser Scanning',
      'Drone Photogrammetry',
      '3D Modeling',
    ];
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Entries Detail',
            centerTitle: true,
            actions: [
              Bounce(
                  child: Image.asset(
                Assets.imagesEdit,
                color: getSecondaryColor(context),
                width: 24,
              )),
              SizedBox(
                width: 8,
              ),
              Bounce(
                  child: Image.asset(
                Assets.imagesTrash,
                color: getSecondaryColor(context),
                width: 24,
              )),
              SizedBox(
                width: 12,
              ),
            ]),
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
                  SizedBox(
                    height: 15,
                  ),
                  CustomeContainer(
                    radius: 8,
                    hpad: 16,
                    vpad: 15,
                    color: getfillcolor(context),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Building Surveying and Technology',
                          size: 18,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 12,
                        ),
                        Wrap(
                          spacing: 15,
                          runSpacing: 10,
                          children: [
                            Row(
                              children: [
                                buttonContainer(
                                  radius: 50,
                                  text: 'lvl 2 - Application of Knowledge',
                                  bgColor: getsplashcolor(context),
                                  txtColor: getTertiary(context),
                                  vPadding: 4,
                                  hPadding: 15,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                buttonContainer(
                                  radius: 50,
                                  text: '1.5 days committed',
                                  bgColor: getsplashcolor(context),
                                  txtColor: getTertiary(context),
                                  vPadding: 4,
                                  hPadding: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        row_widget(
                          title: 'Monday 15 January 2024',
                          fontFamily: AppFonts.gilroyMedium,
                          icon: Assets.imagesCalendar,
                          iconSize: 18,
                          lpad: 5,
                          texSize: 11,
                          textColor: getSecondaryColor(context),
                          iconColor: getSecondaryColor(context),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        row_widget(
                          title: 'Last updated 15/01/2024',
                          fontFamily: AppFonts.gilroyMedium,
                          icon: Assets.imagesClock,
                          iconSize: 18,
                          lpad: 5,
                          texSize: 11,
                          textColor: getSecondaryColor(context),
                          iconColor: getSecondaryColor(context),
                        ),
                      ],
                    ),
                  ),
                  CustomeContainer(
                    mtop: 16,
                    radius: 8,
                    hpad: 16,
                    vpad: 15,
                    color: getfillcolor(context),
                    widget: Column(
                      children: [
                        icon_button_row(),
                        SizedBox(
                          height: 12,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: work.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(bottom: 1),
                                child: MyBullet(
                                  point: work[index],
                                  color: getTertiary(context),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomeContainer(
                    mtop: 16,
                    mbott: 16,
                    radius: 8,
                    hpad: 16,
                    vpad: 15,
                    color: getfillcolor(context),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        icon_button_row(
                          title: 'Reflection & Learning',
                          buttonText: '18 words',
                          icon: Assets.imagesReflection,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        MyBullet(
                            color: getTertiary(context),
                            point:
                                'This survey enhanced my understanding of traditional building construction and common defect patterns in Victorian properties.'),
                        MyText(
                          text: 'Skills Developed',
                          size: 14,
                          fontFamily: AppFonts.gilroySemiBold,
                          paddingTop: 10,
                          paddingBottom: 10,
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: tagList.map((tag) {
                            return TagsWidget(
                              tag,
                              bgColor:
                                  getSecondaryColor(context).withOpacity(0.08),
                              radius: 30,
                              borderColor: ktransparent,
                              textColor: getTertiary(context),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  CustomeContainer(
                    mtop: 16,
                    mbott: 16,
                    radius: 8,
                    hpad: 16,
                    vpad: 15,
                    color: getfillcolor(context),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        icon_button_row(
                          icon: Assets.imagesAttachment2,
                          title: 'Attachment',
                          buttonText: '',
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        newEntry_container(
                          iconSize: 20,
                          bgColor: getSecondaryColor(context).withOpacity(0.08),
                          mbott: 0,
                          title: 'Survey-photos.zip',
                          desc: '24.5 MB • Images',
                          icon: Assets.imagesImages,
                          suffixIcon: Assets.imagesExport,
                          iconColor: getSecondaryColor(context),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        newEntry_container(
                          iconSize: 20,
                          bgColor: getSecondaryColor(context).withOpacity(0.08),
                          mbott: 0,
                          title: 'Survey_Report.pdf',
                          desc: '3.2 MB • Document',
                          icon: Assets.imagesDocument,
                          suffixIcon: Assets.imagesExport,
                          iconColor: getSecondaryColor(context),
                        ),
                      ],
                    ),
                  ),
                  CustomeContainer(
                    mbott: 16,
                    radius: 8,
                    hpad: 16,
                    vpad: 15,
                    color: getfillcolor(context),
                    widget: Column(
                      children: [
                        icon_button_row(
                          title: 'AI Enhancement Suggestions',
                          icon: Assets.imagesMagic2,
                          buttonText: '',
                          pbot: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buttonContainer(
                              borderColor: getSecondaryColor(context),
                              radius: 8,
                              bgColor: ktransparent,
                              text: ' Get AI Feedback',
                              imagePath: Assets.imagesLight,
                              iconColor: getSecondaryColor(context),
                              imageSize: 17,
                            )
                          ],
                        ),
                        ListView.builder(
                          padding: EdgeInsets.only(top: 16),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: AiEnhancement.length,
                          itemBuilder: (context, index) {
                            final item = AiEnhancement[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: CustomeContainer(
                                radius: 8,
                                color: getSecondaryColor(context)
                                    .withOpacity(0.05),
                                vpad: 20,
                                hpad: 12,
                                widget: Row(
                                  children: [
                                    Image.asset(
                                      item["icon"]!,
                                      width: 16,
                                      color: getSecondaryColor(context),
                                    ),
                                    Expanded(
                                        child: MyText(
                                      text: item["title"]!,
                                      size: 14,
                                      fontFamily: AppFonts.gilroyMedium,
                                      paddingLeft: 10,
                                    )),
                                    MyText(
                                      text: 'Apply',
                                      size: 12,
                                      color: getTertiary(context),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomeContainer(
                    mbott: 16,
                    radius: 8,
                    hpad: 16,
                    vpad: 15,
                    color: getfillcolor(context),
                    widget: Column(
                      children: [
                        icon_button_row(
                          title: 'Related Entries',
                          icon: Assets.imagesChain,
                          buttonText: '',
                          pbot: 18,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: CustomeContainer(
                                radius: 8,
                                color: getSecondaryColor(context)
                                    .withOpacity(0.05),
                                vpad: 20,
                                hpad: 12,
                                widget: Row(
                                  children: [
                                    Expanded(
                                        child: TwoTextedColumn(
                                      text1: index == 1
                                          ? 'CAD Software Proficiency'
                                          : 'Structural Analysis Techniques',
                                      text2: 'Competency Level 2 • 3 weeks ago',
                                      size1: 14,
                                      size2: 12,
                                      fontFamily: AppFonts.gilroySemiBold,
                                      color2: getTertiary(context),
                                    )),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    MyText(
                                      text: 'View',
                                      size: 14,
                                      color: getSecondaryColor(context),
                                      fontFamily: AppFonts.gilroyMedium,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class icon_button_row extends StatelessWidget {
  final String? icon, title, buttonText;
  final double? pbot;
  final bool? hasIcon;
  const icon_button_row({
    super.key,
    this.icon,
    this.title,
    this.buttonText,
    this.pbot,
    this.hasIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: pbot ?? 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (hasIcon == true) ...{
            Image.asset(
              icon ?? Assets.imagesDocument,
              width: 18,
              color: getSecondaryColor(context),
            ),
          },
          Expanded(
            child: MyText(
              text: title ?? 'Work Description',
              size: 14,
              fontFamily: AppFonts.gilroyBold,
              paddingLeft: hasIcon == true ? 5 : 0,
              // paddingRight: 15,
            ),
          ),
          buttonContainer(
            radius: 50,
            text: buttonText ?? '35 words',
            bgColor: getfillcolor(context),
            textsize: 11,
            vPadding: 2,
            hPadding: 15,
            txtColor: getTertiary(context),
          ),
        ],
      ),
    );
  }
}
