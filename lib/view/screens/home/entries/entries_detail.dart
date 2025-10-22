import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/bullet_points.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/home_widgets/apc_diary_widgets.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
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
        "desc": "Get suggestions to improve technical detail and clarity",
      },
      {
        "title": "Deepen Reflections",
        "desc": "Add meaningful insights and learning connections",
      },
      {
        "title": "RICS Compliance",
        "desc": "Ensure entry meets all RICS diary requirements",
      },
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
                color: kwhite,
                width: 24,
              )),
              SizedBox(
                width: 8,
              ),
              Bounce(
                  child: Image.asset(
                Assets.imagesTrash,
                color: kwhite,
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
                    radius: 10,
                    hpad: 16,
                    vpad: 15,
                    color: kblackfill,
                    borderColor: kblueBorder2,
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
                                  borderColor: kblueBorder2,
                                  radius: 50,
                                  text: 'lvl 2 - Application of Knowledge',
                                  bgColor: kblackfill,
                                  vPadding: 4,
                                  hPadding: 15,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                buttonContainer(
                                  borderColor: kblueBorder2,
                                  radius: 50,
                                  text: '1.5 days committed',
                                  bgColor: kblueBorder2,
                                  txtColor: kwhite,
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
                            textColor: kwhite),
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
                            textColor: kwhite),
                        SizedBox(
                          height: 12,
                        ),
                        icon_button_row(),
                        ListView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: work.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(bottom: 1),
                                child: MyBullet(point: work[index]));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                            color: kblueBorder2,
                          ),
                        ),
                        icon_button_row(
                          title: 'Reflection & Learning',
                          buttonText: '18 words',
                        ),
                        MyBullet(
                            point:
                                'This survey enhanced my understanding of traditional building construction and common defect patterns in Victorian properties.'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                            color: kblueBorder2,
                          ),
                        ),
                        newEntry_container(
                          mbott: 0,
                          title: 'Survey-photos.zip',
                          desc:
                              '195 MB 15/01/2024\nProperty survey photographs',
                          icon: Assets.imagesDocument2,
                          borderColor: kblueBorder2,
                          suffixIcon: Assets.imagesExport,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                            color: kblueBorder2,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        icon_button_row(
                          title: 'AI Enhancement Suggestions',
                          icon: Assets.imagesMagicpen,
                          buttonText: 'Get AI Feedback',
                          pbot: 18,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: AiEnhancement.length,
                          itemBuilder: (context, index) {
                            final item = AiEnhancement[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: newEntry_container(
                                title: item["title"]!,
                                desc: item["desc"]!,
                                borderColor: kblueBorder2,
                                hasPrefix: false,
                                mbott: 0,
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Divider(
                            color: kblueBorder2,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DiffTextsTxt(
                                align: TextAlign.start,
                                text1: 'Created ',
                                text2: '15/01/2024 , 14:00:00',
                                size: 10,
                                size2: 10,
                                color1: kwhite,
                                color2: kgrey,
                                fontFamily: AppFonts.gilroyBold,
                                fontFamily2: AppFonts.gilroyRegular,
                              ),
                            ),
                            Expanded(
                              child: DiffTextsTxt(
                                align: TextAlign.start,
                                text1: 'Last Modified ',
                                text2: '15/01/2024 , 14:00:00',
                                size: 10,
                                size2: 10,
                                color1: kwhite,
                                color2: kgrey,
                                fontFamily: AppFonts.gilroyBold,
                                fontFamily2: AppFonts.gilroyRegular,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DiffTextsTxt(
                                align: TextAlign.start,
                                text1: 'Reporting Year ',
                                text2: '2024',
                                size: 10,
                                size2: 10,
                                color1: kwhite,
                                color2: kgrey,
                                fontFamily: AppFonts.gilroyBold,
                                fontFamily2: AppFonts.gilroyRegular,
                              ),
                            ),
                            MyText(
                              text: 'Sync Status',
                              size: 10,
                              fontFamily: AppFonts.gilroyBold,
                              paddingRight: 8,
                            ),
                            buttonContainer(
                              borderColor: kblueBorder2,
                              radius: 50,
                              text: 'Synced',
                              bgColor: kblackfill,
                              textsize: 11,
                              vPadding: 2,
                              hPadding: 15,
                            ),
                          ],
                        ),
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
            borderColor: kblueBorder2,
            radius: 50,
            text: buttonText ?? '35 words',
            bgColor: kblackfill,
            textsize: 11,
            vPadding: 2,
            hPadding: 15,
          ),
        ],
      ),
    );
  }
}
