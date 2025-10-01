import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/apc_ai/apc_AI.dart';
import 'package:apc_pro/view/screens/home/entries/entries_detail.dart';
import 'package:apc_pro/view/screens/home/summary_experience/continue_writing.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
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
      'Ethics, Rules of Conduct and Professionalism',
      'Client Care',
      'Communication and Negotiation'
    ];
    final List Tstatus = [
      'Building Maintenance and Refurbishment',
      'Building Surveys and Inspections',
      'Construction Technology and Environmental Services'
    ];
    return Scaffold(
        backgroundColor: kbackground,
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
                      borderColor: kblueBorder2,
                      icon: Assets.imagesDocument2,
                      title: 'Continue Writing',
                      desc: '15 competencies to go',
                      ontap: () {
                        Get.to(() => ContinueWriting());
                      },
                    ),
                    newEntry_container(
                      borderColor: kblueBorder2,
                      icon: Assets.imagesDocument2,
                      title: 'AI Assistance',
                      desc: 'Get writing help and suggestions',
                      ontap: () {
                        Get.bottomSheet(ApcAi(), isScrollControlled: true);
                      },
                    ),
                    CustomeContainer(
                      vpad: 17,
                      hpad: 17,
                      color: kblackfill,
                      radius: 10,
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          icon_button_row(
                            title: 'Competency Status',
                            buttonText: '0 of 15 complete',
                            hasIcon: false,
                            pbot: 12,
                          ),
                          _compencies_container(status: status),
                          SizedBox(
                            height: 12,
                          ),
                          _compencies_container(
                            status: Tstatus,
                            heading: 'Technical Competencies',
                          )
                        ],
                      ),
                      mbott: 22,
                    ),
                    _compencies_container(
                      status: status,
                      heading: 'Recent Activity',
                      hasMore: false,
                      borderColor: ktransparent,
                      hpad: 17,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    CustomeContainer(
                      borderColor: kblueBorder2,
                      color: kblackfill,
                      radius: 10,
                      hpad: 17,
                      vpad: 17,
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Completion Estimate',
                            size: 14,
                            paddingBottom: 12,
                            fontFamily: AppFonts.gilroySemiBold,
                          ),
                          TwoTextedColumn(
                            text1: 'About 8 working days',
                            text2:
                                'Based on remaining competencies and average writing time',
                            size1: 12,
                            size2: 12,
                            fontFamily2: AppFonts.gilroyRegular,
                            fontFamily: AppFonts.gilroyBold,
                            mBottom: 0,
                          ),
                        ],
                      ),
                    )
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
      radius: 10,
      hpad: hpad ?? 7,
      vpad: vpad ?? 17,
      color: kblackfill,
      borderColor: borderColor ?? kblueBorder2,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: heading ?? 'Mandatory Competencies',
            size: 14,
            paddingBottom: 12,
            fontFamily: AppFonts.gilroySemiBold,
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
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        Assets.imagesEdit,
                        width: 18,
                      )
                    ],
                  ));
            },
          ),
          if (hasMore == true)
            Center(
              child: MyText(
                text: 'View More',
                size: 12,
                textAlign: TextAlign.center,
                fontFamily: AppFonts.gilroySemiBold,
              ),
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
      color: kblackfill,
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
