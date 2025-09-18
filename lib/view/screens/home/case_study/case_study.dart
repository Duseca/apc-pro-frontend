import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: kbackground,
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
                    color: kblackfill,
                    borderColor: kblueBorder3,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        row_widget(
                          icon: Assets.imagesBook,
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
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TwoTextedColumn(
                          text1: 'Project Information Required',
                          text2:
                              'Add details about your project to begin your case study',
                          size1: 20,
                          size2: 18,
                          fontFamily2: AppFonts.gilroyMedium,
                          fontFamily: AppFonts.gilroyBold,
                          align: TextAlign.center,
                          alignment: ColumnAlignment.center,
                        ),
                        MyButton(
                          mTop: 30,
                          mhoriz: 20,
                          buttonText: '+ Add Project Details',
                          mBottom: 20,
                          fontFamily: AppFonts.gilroyBold,
                        )
                      ],
                    ),
                    mbott: 20,
                  ),
                  CustomeContainer(
                    radius: 10,
                    vpad: 17,
                    hpad: 17,
                    color: kblackfill,
                    borderColor: kblueBorder3,
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
                    mbott: 20,
                  ),
                  CustomeContainer(
                      radius: 10,
                      vpad: 17,
                      hpad: 17,
                      color: kblackfill,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'Case Study Sections',
                              size: 16,
                              fontFamily: AppFonts.gilroyBold,
                              paddingBottom: 10,
                            ),
                            ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: caseStudySections.length,
                              itemBuilder: (context, index) {
                                final item = caseStudySections[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 25),
                                  child: _caseStudy_section_widget(
                                    text1: item["text1"]!,
                                    text2: item["text2"]!,
                                  ),
                                );
                              },
                            ),
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
        MyText(
          text: text1 ?? 'Introductions',
          size: 14,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  MyText(
                    text: text2 ?? '0/500 words   Limit 600 words',
                    size: 12,
                    fontFamily: AppFonts.gilroyMedium,
                    paddingRight: 12,
                  ),
                  SizedBox(
                    width: 50,
                    child: linearProgressIndicatorr(
                      value: 0,
                      bgColor: Color(0xff54CAFA).withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
            Bounce(
                onTap: ontap,
                child: Image.asset(
                  Assets.imagesEdit,
                  width: 18,
                  color: Color(0xff54CAFA),
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
        linearProgressIndicatorr(),
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
