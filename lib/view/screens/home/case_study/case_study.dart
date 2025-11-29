import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/case_study/edit_casestudy.dart';
import 'package:apc_pro/view/screens/home/case_study/project_information.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/home_widgets/apc_diary_widgets.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseStudy extends StatelessWidget {
  const CaseStudy({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> caseStudySections = [
      {
        "text1": "Introductions",
        "text2": "0/500 words   Limit 600 words",
      },
      {
        "text1": "My Approach",
        "text2": "0/800 words   Limit 1000 words",
      },
      {
        "text1": "My Achievements",
        "text2": "0/1000 words   Limit 1200 words",
      },
      {
        "text1": "Conclusions",
        "text2": "0/500 words   Limit 700 words",
      },
    ];

    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Case Study', centerTitle: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomeContainer(
                    radius: 10,
                    vpad: 17,
                    hpad: 17,
                    color: getfillcolor(context),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        row_widget(
                          icon: Assets.imagesBook,
                          iconColor: getSecondaryColor(context),
                          iconSize: 19,
                          title: 'Project Information',
                          texSize: 14,
                          fontFamily: AppFonts.gilroyBold,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Image.asset(
                            Assets.imagesBook,
                            width: 40,
                            height: 40,
                            color: getSecondaryColor(context),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TwoTextedColumn(
                          text1: 'Project Information Required',
                          text2:
                              'Add details about your project to begin your case study',
                          size1: 18,
                          size2: 14,
                          fontFamily2: AppFonts.gilroyMedium,
                          fontFamily: AppFonts.gilroyBold,
                          align: TextAlign.center,
                          color2: getTertiary(context),
                          alignment: ColumnAlignment.center,
                        ),
                        MyButton(
                          onTap: () {
                            Get.to(() => ProjectInformation());
                          },
                          mTop: 30,
                          mhoriz: 20,
                          outlineColor: getSecondaryColor(context),
                          backgroundColor: ktransparent,
                          buttonText: '+ Add Project Details',
                          mBottom: 20,
                          fontColor: getSecondaryColor(context),
                          fontFamily: AppFonts.gilroySemiBold,
                        )
                      ],
                    ),
                    mbott: 20,
                  ),
                  CustomeContainer(
                    radius: 10,
                    vpad: 17,
                    hpad: 17,
                    color: getfillcolor(context),
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Progress Overview',
                            size: 16,
                            fontFamily: AppFonts.gilroyBold,
                            paddingBottom: 10,
                          ),
                          _progress_view(),
                          SizedBox(
                            height: 15,
                          ),
                          _progress_view(
                            title: 'Word Count',
                            desc: 'Target: 3,000 words | Limit: 3,500 words',
                            count: '0/3000',
                          )
                        ]),
                    mbott: 16,
                  ),
                  newEntry_container(
                    icon: Assets.imagesDocument,
                    title: 'Export Case Study',
                    desc: 'Export case study in DOCX or PDF formats',
                    iconSize: 20,
                    mbott: 16,
                    iconColor: getSecondaryColor(context),
                  ),
                  CustomeContainer(
                    radius: 10,
                    vpad: 17,
                    hpad: 17,
                    color: getfillcolor(context),
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Case Study Sections',
                            size: 16,
                            fontFamily: AppFonts.gilroyBold,
                            paddingBottom: 10,
                          ),
                          ListView.separated(
                            separatorBuilder: (context, index) {
                              final item = caseStudySections[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Divider(
                                  color: getsplashcolor(context),
                                ),
                              );
                            },
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: caseStudySections.length,
                            itemBuilder: (context, index) {
                              final item = caseStudySections[index];
                              return _caseStudy_section_widget(
                                text1: item["text1"]!,
                                text2: item["text2"]!,
                              );
                            },
                          ),
                        ]),
                    mbott: 20,
                  ),
                  newEntry_container(
                    title: 'Competency Table',
                    desc: '0 Competencies demonstrated',
                    icon: Assets.imagesBadge2,
                    iconSize: 20,
                    mbott: 16,
                    iconColor: getSecondaryColor(context),
                  ),
                  newEntry_container(
                    title: 'Appendices',
                    desc: '0 attachments uploaded',
                    icon: Assets.imagesAttachment2,
                    iconSize: 20,
                    mbott: 16,
                    iconColor: getSecondaryColor(context),
                  ),
                  newEntry_container(
                    title: 'AI Assistance',
                    desc: 'Get writing help and suggestions',
                    icon: Assets.imagesMagic2,
                    iconSize: 20,
                    mbott: 16,
                    iconColor: getSecondaryColor(context),
                  ),
                  CustomeContainer(
                      mbott: 20,
                      hpad: 15,
                      color: getfillcolor(context),
                      radius: 8,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  Assets.imagesInfo,
                                  width: 20,
                                  height: 20,
                                  color: getSecondaryColor(context),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: MyText(
                                  text: 'Getting Started with your case study',
                                  fontFamily: AppFonts.gilroyBold,
                                  size: 14,
                                )),
                              ],
                            ),
                            MyText(
                              text:
                                  'Your case study must be completed within the last 24 months that demonstrates your Technical competencies.\n\nAim for approximately 3,000 words total across all sections.\n\nFocus on demonstrating Level 3 (reasoned advice) competencies where possible.\n\nUse the AI assistant to help structure your content and ensure RICS compliance.',
                              color: getTertiary(context),
                              paddingTop: 5,
                              size: 14,
                            )
                          ]))
                ],
              ),
            ),
          ],
        ));
  }
}

class _caseStudy_section_widget extends StatelessWidget {
  final String? text1, text2;
  final VoidCallback? ontap;
  const _caseStudy_section_widget({
    super.key,
    this.text1,
    this.text2,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: text1 ?? 'Introductions',
                    size: 14,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 8,
                  ),
                  SizedBox(
                    width: 140,
                    child: linearProgressIndicatorr(
                      value: 0,
                      bgColor: getfifth(context),
                      height: 7,
                    ),
                  ),
                  MyText(
                    text: text2 ?? '0/500 words   Limit 600 words',
                    size: 12,
                    fontFamily: AppFonts.gilroyMedium,
                    paddingRight: 12,
                    paddingTop: 5,
                    color: getTertiary(context),
                  ),
                ],
              ),
            ),
            Bounce(
                onTap: ontap ??
                    () {
                      Get.to(() => EditCasestudy());
                    },
                child: Image.asset(
                  Assets.imagesEdit,
                  width: 18,
                  color: getSecondaryColor(context),
                ))
          ],
        ),
      ],
    );
  }
}

class _progress_view extends StatelessWidget {
  final String? title, count, desc;
  const _progress_view({
    super.key,
    this.title,
    this.count,
    this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandedRow(
          text1: title ?? 'Section Complete',
          text2: count ?? '0/4',
          size1: 14,
          size2: 14,
          fontFamily2: AppFonts.gilroyBold,
          fontFamily: AppFonts.gilroyBold,
        ),
        SizedBox(
          height: 14,
        ),
        linearProgressIndicatorr(
          bgColor: getfifth(context),
          value: 0.1,
          height: 7,
        ),
        SizedBox(
          height: 8,
        ),
        MyText(
          text: desc ?? '0% Complete',
          size: 12,
          fontFamily: AppFonts.gilroyMedium,
          paddingBottom: 10,
        ),
      ],
    );
  }
}
