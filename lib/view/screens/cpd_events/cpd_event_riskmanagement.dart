import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/cpd_events/add_cpd_event.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CpdEventRiskmanagement extends StatelessWidget {
  const CpdEventRiskmanagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: "Add CPD Event", centerTitle: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
                  Divider(color: getfillcolor(context),),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomeContainer(
                    mtop: 20,
                    radius: 12,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TwoTextedColumn(
                          text1: 'Advanced Risk Management Workshop',
                          text2:
                              'A comprehensive workshop covering modern risk assessment methodologies and their practical applications in property and construction management.',
                          size1: 20,
                          size2: 13.5,
                          color2: getTertiary(context),
                          fontFamily: AppFonts.gilroyBold,
                          fontFamily2: AppFonts.gilroyMedium,
                          maxLines: 6,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            row_widget(
                              title: 'March 15, 2024 • 9:00 AM - 5:00 PM',
                              icon: Assets.imagesClock,
                              iconSize: 15,
                              texSize: 12.5,
                              textColor: getSecondaryColor(context),
                              fontFamily: AppFonts.gilroyMedium,
                              iconColor: getTertiary(context),
                            ),
                            row_widget(
                              title: 'RICS Training Centre, London',
                              icon: Assets.imagesLocation,
                              iconSize: 15,
                              texSize: 12.5,
                              textColor: getSecondaryColor(context),
                              fontFamily: AppFonts.gilroyMedium,
                              iconColor: getTertiary(context),
                            ),
                            row_widget(
                              title: '8 CPD Hours',
                              icon: Assets.imagesTimer,
                              iconSize: 15,
                              texSize: 12.5,
                              textColor: getSecondaryColor(context),
                              fontFamily: AppFonts.gilroyMedium,
                              iconColor: getTertiary(context),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            MyText(
                              text: 'Activity Type:',
                              size: 12,
                              fontFamily: AppFonts.gilroyBold,
                              paddingRight: 8,
                            ),
                            buttonContainer(
                              text: 'Formal Learning',
                              radius: 50,
                              bgColor: getfifth(context),
                              vPadding: 3,
                              textsize: 12,
                            )
                          ],
                        )
                      ],
                    ),
                    mbott: 16,
                  ),
                  MyButton(
                    buttonText: 'Create Event',
                    mBottom: 12,
                    onTap: () {
                      Get.to(()=>AddCpdEvent())
;                    },
                  ),
                  MyButton(
                    buttonText: 'Save as Draft',
                    backgroundColor: getfillcolor(context),
                    fontColor: getSecondaryColor(context),
                    mBottom: 20,
                  ),
                  MyText(
                    text: 'Edit Details',
                    textAlign: TextAlign.center,
                    color: getTertiary(context),
                    size: 16,
                    fontFamily: AppFonts.gilroyMedium,
                    onTap: () {},
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
