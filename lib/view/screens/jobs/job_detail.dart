import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/jobs/application_submittion.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/jobs_widgets/jobs_cards.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobDetail extends StatelessWidget {
  const JobDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> req = [
      'React',
      'TypeScript',
      'JavaScript',
      'Tailwind CSS',
      'CSS',
      'Git'
    ];
    return Scaffold(
        appBar: simpleAppBar(context: context, title: 'Job Detail',centerTitle: true),
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
                  jobs_container(
                    bgColor: ktransparent,
                    radius: 0,
                    hasLike: false,
                    hasIcon: true,
                    logo: Assets.imagesCompanylogo2,
                    logoSize: 64,
                    textSize: 24,
                    sText: 19,
                    hpad: 0,
                    postingTime: 'Posted 2 days ago',
                  ),
                  CustomeContainer(
                    mbott: 24,
                    vpad: 17,
                    hpad: 17,
                    radius: 8,
                    color: getfillcolor(context),
                    widget: TwoTextedColumn(
                      size1: 16,
                      size2: 14,
                      fontFamily: AppFonts.gilroySemiBold,
                      fontFamily2: AppFonts.gilroyMedium,
                      color2: getTertiary(context),
                      text1: 'Job Description',
                      mBottom: 8,
                      text2:
                          "We are looking for a passionate Senior Frontend Developer to join our growing team. You will work on cutting-edge web applications using modern technologies and collaborate with designers and backend engineers.\n\nThe ideal candidate has strong experience with React, TypeScript, and modern CSS frameworks. You'll be responsible for building responsive, performant user interfaces and contributing to our design system.",
                    ),
                  ),
                  CustomeContainer(
                      mbott: 24,
                      vpad: 17,
                      hpad: 17,
                      radius: 8,
                      color: getfillcolor(context),
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Requirements',
                            size: 16,
                            fontFamily: AppFonts.gilroySemiBold,
                            paddingBottom: 8,
                          ),
                          MyText(
                            text:
                                "5+ years of experience in frontend development\n\nExpert knowledge of React, JavaScript, and TypeScript\n\nExperience with modern CSS frameworks(Tailwind, Styled Components)\n\nStrong understanding of responsive design principles\n\nBachelor's degree in Computer Science or equivalent experience",
                            size: 14,
                            paddingLeft: 12,
                            fontFamily: AppFonts.gilroyMedium,
                            color: getTertiary(context),
                          )
                        ],
                      )),
                  MyText(
                    text: 'Required Skills',
                    size: 16,
                    fontFamily: AppFonts.gilroySemiBold,
                    paddingBottom: 8,
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: req.map((tag) {
                      return TagsWidget(tag,vpad: 6,);
                    }).toList(),
                  ),
                  CustomeContainer(
                      mtop: 24,
                      mbott: 24,
                      vpad: 17,
                      hpad: 17,
                      radius: 8,
                      color: getfillcolor(context),
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Benefits',
                            size: 16,
                            fontFamily: AppFonts.gilroySemiBold,
                            paddingBottom: 8,
                          ),
                          MyText(
                            text:
                                "Comprehensive health, dental, and vision insurance",
                            size: 14,
                            paddingLeft: 12,
                            fontFamily: AppFonts.gilroyMedium,
                            color: getTertiary(context),
                            paddingBottom: 8,
                          ),
                          MyText(
                            text:
                                'Flexible work schedule and remote work options',
                            size: 14,
                            paddingLeft: 12,
                            fontFamily: AppFonts.gilroyMedium,
                            color: getTertiary(context),
                            paddingBottom: 8,
                          ),
                          MyText(
                            text: "Professional development budget",
                            size: 14,
                            paddingLeft: 12,
                            fontFamily: AppFonts.gilroyMedium,
                            color: getTertiary(context),
                            paddingBottom: 8,
                          ),
                          MyText(
                            text: "Stock options and equity participation",
                            size: 14,
                            paddingLeft: 12,
                            fontFamily: AppFonts.gilroyMedium,
                            color: getTertiary(context),
                          )
                        ],
                      )),
                  CustomeContainer(
                    mbott: 24,
                    vpad: 17,
                    hpad: 17,
                    radius: 8,
                    color: getfillcolor(context),
                    widget: TwoTextedColumn(
                      size1: 16,
                      size2: 14,
                      fontFamily: AppFonts.gilroySemiBold,
                      fontFamily2: AppFonts.gilroyMedium,
                      color2: getTertiary(context),
                      text1: 'About TechFlow Inc.',
                      mBottom: 8,
                      text2:
                          "TechFlow Inc. is a fast-growing technology company focused on building innovative web solutions for modern businesses. We pride ourselves on our collaborative culture and commitment to cutting- edge technology.",
                    ),
                  ),
                  MyButton(
                    buttonText: 'Apply Now',
                    mBottom: 30,
                    onTap: () {
                       Get.to(()=>ApplicationSubmittion());
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
