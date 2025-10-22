import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/bullet_points.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiPlanningAssistant extends StatelessWidget {
  const AiPlanningAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    final List actions = [
      'Book RICS-approved online courses',
      'Register for upcoming webinars',
      'Schedule internal training sessions',
      'Document all formal learning activities'
    ];
    final List<String> tags = [
      'medium impact',
      'moderate effort',
      'short-term',
    ];
    final List<String> tabs = [
      "Recommendations",
      'AI Plans',
      'Insights',
      'Timeline'
    ];
    final RxInt currentIndex = 0.obs;
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'AI Planning Assistant',
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
                  CustomeContainer(
                    radius: 8,
                    color: kblackfill,
                    borderColor: Color(0xff4285F4),
                    vpad: 17,
                    hpad: 14,
                    widget: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.imagesCalendar,
                          width: 20,
                          color: ksecondary,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: TwoTextedColumn(
                          text1: 'AI Analysis Complete',
                          text2:
                              'Based on your current progress and assessment timeline',
                          size1: 14,
                          size2: 11,
                          fontFamily2: AppFonts.gilroyMedium,
                          fontFamily: AppFonts.gilroyBold,
                        )),
                        SizedBox(
                          width: 8,
                        ),
                        TwoTextedColumn(
                          text1: '87%',
                          text2: 'Confidence',
                          size1: 14,
                          size2: 11,
                          fontFamily2: AppFonts.gilroyMedium,
                          fontFamily: AppFonts.gilroyBold,
                          align: TextAlign.center,
                          alignment: ColumnAlignment.center,
                        )
                      ],
                    ),
                    mbott: 20,
                  ),
                  Obx(
                    () => TabsWidget(
                      isexpanded: false,
                      margin: 2,
                      bgColor: kblackfill,
                      textSize: 11,
                      items: tabs,
                      currentindex: currentIndex.value,
                      ontap: (p0) {
                        currentIndex.value = p0;
                      },
                    ),
                  ),
                  recommendations(),
                  recommendations(
                    text1: '15%',
                    text2: 'Effort Reduction',
                  ),
                  recommendations(
                    text2: 'Risk Reduction',
                    text1: '25%',
                  ),
                  CustomeContainer(
                      radius: 8,
                      mtop: 20,
                      color: kblackfill,
                      borderColor: Color(0xff4285F4),
                      vpad: 17,
                      hpad: 14,
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                Assets.imagesClock,
                                width: 20,
                                color: ksecondary,
                              ),
                              Expanded(
                                  child: MyText(
                                paddingLeft: 8,
                                paddingRight: 5,
                                text: 'Balanced CPD Requirements',
                                size: 12,
                                fontFamily: AppFonts.gilroyBold,
                              )),
                              Bounce(
                                  child: Image.asset(
                                Assets.imagesLike,
                                width: 20,
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Bounce(
                                  child: Image.asset(
                                Assets.imagesDislike,
                                width: 20,
                              ))
                            ],
                          ),
                          MyText(
                            paddingTop: 10,
                            paddingBottom: 10,
                            text:
                                'You have 0 hours of formal CPD but need 10. Consider structured courses or webinars.',
                            size: 12,
                            fontFamily: AppFonts.gilroyMedium,
                          ),
                          Wrap(
                            spacing: 8,
                            runSpacing: 6,
                            children: tags.map((tag) {
                              return TagsWidget(tag);
                            }).toList(),
                          ),
                          MyText(
                            paddingTop: 10,
                            paddingBottom: 10,
                            text: 'Action Items:',
                            size: 12,
                            fontFamily: AppFonts.gilroyBold,
                          ),
                          ListView.builder(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: actions.length,
                            itemBuilder: (context, index) {
                              return MyBullet(point: actions[index]);
                            },
                          ),
                          DiffTextsTxt(
                            text1: 'Expected Outcome: ',
                            text2:
                                'Meet formal CPD requirements within 4–6 weeks',
                            fontFamily: AppFonts.gilroyBold,
                            fontFamily2: AppFonts.gilroyRegular,
                            color1: kwhite,
                            color2: kwhite,
                            size2: 12,
                            size: 12,
                            align: TextAlign.start,
                            weight2: FontWeight.normal,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}

class recommendations extends StatelessWidget {
  final Color? bgColor;
  final String? text1, text2;
  const recommendations({
    super.key,
    this.text1,
    this.text2,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
        mtop: 20,
        radius: 10,
        color: bgColor ?? kblueBorder4,
        borderColor: bgColor ?? kblueBorder4,
        vpad: 17,
        hpad: 14,
        widget: Column(
          children: [
            TwoTextedColumn(
              text1: text1 ?? '2',
              text2: text2 ?? 'Active Recommendations',
              size1: 20,
              size2: 12,
              fontFamily2: AppFonts.gilroyMedium,
              fontFamily: AppFonts.gilroyBold,
              align: TextAlign.center,
              alignment: ColumnAlignment.center,
            )
          ],
        ));
  }
}
