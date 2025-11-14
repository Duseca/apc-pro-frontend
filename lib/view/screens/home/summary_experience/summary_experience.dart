import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/apc_ai/apc_AI.dart';
import 'package:apc_pro/view/screens/home/summary_experience/continue_writing.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/home_widgets/apc_diary_widgets.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryExperience extends StatelessWidget {
  const SummaryExperience({super.key});

  @override
  Widget build(BuildContext context) {
    final List status = [
      'Ethics/Rules/Professionalism',
      'Client Care',
      'Communication and Negotiation'
    ];
    final List tStatus = [
      'Building Maintenance/Refurbishment',
      'Building Surveys and Inspections',
      'Construction Technology/Environmental Services'
    ];
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Summary of Experience',
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
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(child: twoTexted_container()),
                        Expanded(
                          child: twoTexted_container(
                            text2: 'Mandatory',
                          ),
                        ),
                        Expanded(
                          child: twoTexted_container(
                            text2: 'Technical',
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    newEntry_container(
                      borderColor: getSecondaryColor(context),
                      // icon: Assets.imagesDocument2,
                      title: 'Continue Writing',
                      desc: '15 competencies to go',
                      suffixIcon: Assets.imagesArrowRight,
                      hasPrefix: false,
                      iconColor: getSecondaryColor(context),
                      ontap: () {
                        Get.to(() => ContinueWriting());
                      },
                    ),
                    newEntry_container(
                      borderColor: getSecondaryColor(context),
                      suffixIcon: Assets.imagesMagic2,
                      title: 'AI Assistance',
                      desc: 'Get writing help and suggestions',
                      hasPrefix: false,
                      iconColor: getSecondaryColor(context),
                      ontap: () {
                        Get.bottomSheet(ApcAi(), isScrollControlled: true);
                      },
                    ),
                    _compencies_container(
                      status: status,
                      hpad: 16,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _compencies_container(
                      status: tStatus,
                      heading: 'Technical Competencies',
                      hpad: 16,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomeContainer(
                      radius: 8,
                      hpad: 16,
                      vpad: 0,
                      color: getfillcolor(context),
                      widget: Column(
                        children: [
                          _compencies_container(
                              status: status,
                              heading: 'Recent Activity',
                              hasMore: false,
                              borderColor: ktransparent,
                              hpad: 0),
                          CustomeContainer(
                            color: getfifth(context),
                            radius: 10,
                            hpad: 17,
                            vpad: 17,
                            widget: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: 'Completion Estimate',
                                  size: 14,
                                  paddingBottom: 12,
                                  color: getTertiary(context),
                                  fontFamily: AppFonts.gilroySemiBold,
                                ),
                                TwoTextedColumn(
                                  text1: 'About 8 working days',
                                  text2:
                                      'Based on remaining competencies and average writing time',
                                  size1: 16,
                                  size2: 12,
                                  fontFamily2: AppFonts.gilroyRegular,
                                  fontFamily: AppFonts.gilroyBold,
                                  mBottom: 0,
                                  color2: getTertiary(context),
                                  align: TextAlign.center,
                                  alignment: ColumnAlignment.center,
                                ),
                              ],
                            ),
                            mbott: 17,
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }
}

class _compencies_container extends StatelessWidget {
  final String? heading, title, desc;
  final bool? hasMore;
  final Color? borderColor;
  final double? hpad, vpad;
  const _compencies_container({
    super.key,
    required this.status,
    this.heading,
    this.title,
    this.desc,
    this.hasMore = true,
    this.borderColor,
    this.hpad,
    this.vpad,
  });

  final List status;

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      hpad: hpad ?? 12,
      vpad: vpad ?? 17,
      color: getfillcolor(context),
      borderColor: borderColor ?? ktransparent,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: heading ?? 'Mandatory Competencies',
            size: 16,
            paddingBottom: 12,
            fontFamily: AppFonts.gilroyBold,
          ),
          ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: status.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                          child: TwoTextedColumn(
                        text1: status[index],
                        text2: desc ?? '0 words',
                        size1: 12,
                        size2: 12,
                        fontFamily2: AppFonts.gilroyMedium,
                        fontFamily: AppFonts.gilroyBold,
                        mBottom: 0,
                        color2: getTertiary(context),
                        maxLines: 2,
                      )),
                      SizedBox(
                        width: 12,
                      ),
                      Image.asset(
                        Assets.imagesEdit2,
                        width: 16,
                        color: getSecondaryColor(context),
                      )
                    ],
                  ));
            },
          ),
          if (hasMore == true)
            Row(
              children: [
                buttonContainer(
                  radius: 8,
                  vPadding: 6,
                  text: 'View More',
                  borderColor: getSecondaryColor(context),
                  bgColor: ktransparent,
                )
              ],
            )
        ],
      ),
    );
  }
}

class twoTexted_container extends StatelessWidget {
  final String? text1, text2;
  const twoTexted_container({
    super.key,
    this.text1,
    this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      hpad: 4,
      radius: 10,
      color: getfillcolor(context),
      widget: TwoTextedColumn(
        text1: text1 ?? '0%',
        text2: text2 ?? 'Overall Progress',
        size1: 18,
        size2: 12,
        fontFamily2: AppFonts.gilroyRegular,
        fontFamily: AppFonts.gilroyBold,
        align: TextAlign.center,
        alignment: ColumnAlignment.center,
        maxLines: 1,
      ),
    );
  }
}
