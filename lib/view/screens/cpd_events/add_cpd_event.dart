import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/cpd_events/cpd_pricing/pricing_opt.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCpdEvent extends StatelessWidget {
  const AddCpdEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: "Add CPD Event", centerTitle: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              color: getfillcolor(context),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  MyTextField2(
                    label: 'Event Title',
                    hint: 'Enter event title',
                    filledColor: getfillcolor(context),
                  ),
                  MyText(
                    text: 'Date & Time',
                    size: 14,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 16,
                    paddingTop: 16,
                  ),
                  MyTextField2(
                    filledColor: getfillcolor(context),
                    hint: 'mm/dd/yyyy',
                    label: 'Date',
                    labelColor: getTertiary(context),
                    labelSize: 12,
                    suffixIcon: Image.asset(
                      Assets.imagesCalender3,
                      width: 17,
                      color: getSecondaryColor(context),
                    ),
                    lablefontFamily: AppFonts.gilroyRegular,
                    hintColor: getSecondaryColor(context),
                  ),
                  MyTextField2(
                    filledColor: getfillcolor(context),
                    label: 'Start Time',
                    hint: '--:-- --',
                    labelColor: getTertiary(context),
                    labelSize: 12,
                    suffixIcon: Image.asset(
                      Assets.imagesClock,
                      width: 17,
                      color: getSecondaryColor(context),
                    ),
                    lablefontFamily: AppFonts.gilroyRegular,
                    hintColor: getSecondaryColor(context),
                  ),
                  MyText(
                    text: 'Duration',
                    size: 14,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 16,
                    paddingTop: 16,
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      Expanded(
                          child: MyTextField2(
                        hint: '2',
                        filledColor: getfillcolor(context),
                      )),
                      Expanded(
                          child: MyTextField2(
                        hint: 'Hours',
                        filledColor: getfillcolor(context),
                      ))
                    ],
                  ),
                  MyText(
                    text: 'Delivery Mode',
                    size: 14,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 16,
                    paddingTop: 16,
                  ),
                  delivery_mode_widget(),
                  delivery_mode_widget(
                    type: 'In Person',
                    icon: Assets.imagesLocation2,
                  ),
                  delivery_mode_widget(
                    type: 'Hybrid',
                    icon: Assets.imagesGlobe,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  MyTextField2(
                    filledColor: getfillcolor(context),
                    label: 'Location / Online Link',
                    hint: 'Enter location address or online meeting link',
                    maxLines: 3,
                  ),
                  MyText(
                    text: 'Price',
                    size: 14,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 16,
                    paddingTop: 10,
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      Expanded(
                          child: CustomDropDown(
                              hint: '£ GBP',
                              items: [
                                '£ GBP',
                                '\$ GBP',
                              ],
                              bordercolor: getSecondaryColor(context),
                              hintColor: getTertiary(context),
                              iconColor: getTertiary(context),
                              value: '£ GBP',
                              onChanged: (a) {})),
                      Expanded(
                          child: MyTextField2(
                        hint: '0.0',
                        filledColor: getfillcolor(context),
                      ))
                    ],
                  ),
                  checkbox_row(
                    title: 'Free Event',
                    textColor: getTertiary(context),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MyTextField2(
                    filledColor: getfillcolor(context),
                    label: 'Registration URL',
                    hint: 'https://example.com/register',
                  ),
                  MyButton(
                    mTop: 40,
                    buttonText: 'Continue ',
                    mBottom: 12,
                    icon: Icons.arrow_forward,
                    iconPosition: IconPosition.right,
                    imgColor: getsplashcolor(context),
                    onTap: () {
                      Get.to(() => PricingOpt());
                    },
                  ),
                  MyButton(
                    buttonText: 'Save as Draft',
                    outlineColor: getSecondaryColor(context),
                    fontColor: getSecondaryColor(context),
                    backgroundColor: ktransparent,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class delivery_mode_widget extends StatelessWidget {
  final String? icon, type;
  const delivery_mode_widget({
    super.key,
    this.icon,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      borderColor: getSecondaryColor(context),
      vpad: 17,
      color: getfillcolor(context),
      hpad: 17,
      mbott: 12,
      widget: Row(
        spacing: 8,
        children: [
          CustomCheckBox(
            isActive: false,
            onTap: () {},
            iscircle: true,
            circleIconsize: 16,
            size: 18,
          ),
          Image.asset(
            icon ?? Assets.imagesOnline2,
            width: 18,
            color: getTertiary(context),
          ),
          Expanded(
              child: MyText(
            text: type ?? 'Online',
            size: 14,
            color: getSecondaryColor(context),
            fontFamily: AppFonts.gilroyMedium,
          ))
        ],
      ),
    );
  }
}
