import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class EditCasestudy extends StatelessWidget {
  const EditCasestudy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Edit Case Study', centerTitle: true),
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
                      radius: 10,
                      vpad: 17,
                      hpad: 17,
                      color: getfillcolor(context),
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: MyText(
                                  text: 'Introduction',
                                  size: 18,
                                  fontFamily: AppFonts.gilroyBold,
                                )),
                                Bounce(
                                    child: Image.asset(
                                  Assets.imagesCross,
                                  width: 16,
                                  height: 16,
                                  color: getSecondaryColor(context),
                                ))
                              ],
                            ),
                            MyText(
                              text:
                                  '0 / 500 words recommended      Limit: 600 words',
                              size: 11,
                              paddingTop: 20,
                              fontFamily: AppFonts.gilroyMedium,
                              paddingBottom: 20,
                            ),
                            ExpandedRow(
                              text1: 'Section Progress',
                              text2: '0 % Complete',
                              size1: 12,
                              size2: 12,
                              fontFamily2: AppFonts.gilroyMedium,
                              fontFamily: AppFonts.gilroyMedium,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            linearProgressIndicatorr(
                              value: 0.0,
                              height: 8,
                            ),
                            MyText(
                              paddingTop: 8,
                              text:
                                  'Target 500 words   Minimum 400 words   Maximum 400 words',
                              size: 10,
                              fontFamily: AppFonts.gilroyMedium,
                              paddingBottom: 20,
                            ),
                            CustomeContainer(
                              radius: 8,
                              borderColor: getSecondaryColor(context),
                              vpad: 11,
                              hpad: 14,
                              widget: Row(
                                children: [
                                  Image.asset(Assets.imagesBook2,
                                      width: 16,
                                      color: getSecondaryColor(context)),
                                  Expanded(
                                      child: MyText(
                                    text: 'RICS Guidance for Introduction',
                                    size: 14,
                                    fontFamily: AppFonts.gilroyBold,
                                    paddingLeft: 8,
                                  ))
                                ],
                              ),
                              mbott: 20,
                            ),
                            CustomeContainer(
                              radius: 8,
                              borderColor: getSecondaryColor(context),
                              vpad: 11,
                              hpad: 14,
                              widget: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TwoTextedColumn(
                                        size1: 14,
                                        size2: 11,
                                        fontFamily: AppFonts.gilroyBold,
                                        fontFamily2: AppFonts.gilroyRegular,
                                        text1: 'Key Requirements',
                                        text2:
                                            'Provide a summary of the project and your role Explain what you did and your level of responsibility Identify key stakeholders involved Outline the project timeline and context'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TwoTextedColumn(
                                        size1: 14,
                                        size2: 11,
                                        fontFamily: AppFonts.gilroyBold,
                                        fontFamily2: AppFonts.gilroyRegular,
                                        text1: 'Detailed Guidance',
                                        text2:
                                            'Start with a clear project overview and context Define your specific role and level of responsibility Identify key stakeholders and their roles Outline the project timeline and key milestones Explain why this project demonstrates your competencies'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TwoTextedColumn(
                                      size1: 14,
                                      size2: 11,
                                      fontFamily: AppFonts.gilroyBold,
                                      fontFamily2: AppFonts.gilroyRegular,
                                      text1: 'Example Content',
                                      text2:
                                          '"Provided project management services for a £2M office refurbishment"\n"Led the design team as Senior Architect on a 50-unit residential development"\n"Conducted valuation services for a portfolio of 25 commercial properties',
                                    )
                                  ]),
                              mbott: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: MyText(
                                  text: 'Introduction Content',
                                  size: 14,
                                  fontFamily: AppFonts.gilroyBold,
                                  paddingLeft: 8,
                                )),
                                row_widget(
                                  icon: Assets.imagesBulb,
                                  iconColor: getSecondaryColor(context),
                                  iconSize: 17,
                                  title: 'AI Help',
                                  fontFamily: AppFonts.gilroyBold,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MyTextField2(
                              maxLines: 6,
                              hintSize: 12,
                              hintColor: getSecondaryColor(context),
                              hint:
                                  'Write your introduction here. Focus on specific examples, your role, and the outcomes achieved. Use the guidance above to structure your content effectively.',
                            ),
                            ExpandedRow(
                              text1: 'Recommended length : 500 words',
                              text2: '0 words',
                              size1: 11,
                              size2: 11,
                              fontFamily2: AppFonts.gilroyMedium,
                              fontFamily: AppFonts.gilroyMedium,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              color: getTertiary(context),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: MyText(
                                  text:
                                      'Progress: 0% of recommended content complete',
                                  size: 11,
                                  fontFamily: AppFonts.gilroyMedium,
                                )),
                                buttonContainer(
                                  borderColor: getSecondaryColor(context),
                                  radius: 4,
                                  text: 'Cancel',
                                  bgColor: getfillcolor(context),
                                  vPadding: 5,
                                  hPadding: 12,
                                  textsize: 10,
                                ),
                              ],
                            )
                          ])),
                ],
              ),
            ),
          ],
        ));
  }
}
