import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class ApplicationSubmittion extends StatelessWidget {
  const ApplicationSubmittion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Application Submission',
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
                  Center(
                      child: Icon(
                    Icons.check_circle,
                    color: getSecondaryColor(context),
                    size: 30,
                  )),
                  SizedBox(
                    height: 40,
                  ),
                  TwoTextedColumn(
                    size1: 22,
                    size2: 14,
                    fontFamily: AppFonts.gilroyBold,
                    fontFamily2: AppFonts.gilroyMedium,
                    color2: getTertiary(context),
                    align: TextAlign.center,
                    alignment: ColumnAlignment.center,
                    text1: 'Application Submitted!',
                    mBottom: 8,
                    text2:
                        "Your application for Senior Frontend Developer at TechFlow Inc. has been successfully submitted.\nWe'll review your application and get back to you within 3-5 business days.",
                  ),
                  CustomeContainer(
                    mtop: 30,
                    vpad: 17,
                    hpad: 17,
                    radius: 8,
                    color: getfillcolor(context),
                    widget: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "What's Next?",
                          size: 18,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Assets.imagesOne,
                              width: 12,
                            ),
                            Expanded(
                                child: MyText(
                              paddingBottom: 5,
                              paddingLeft: 5,
                              text:
                                  'Our recruitment team will review your application',
                              size: 14,
                              color: getTertiary(context),
                            ))
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Assets.imagesTwo,
                              width: 12,
                            ),
                            Expanded(
                                child: MyText(
                              paddingBottom: 5,
                              paddingLeft: 5,
                              text:
                                  "If shortlisted, we'll schedule an initial interview",
                              size: 14,
                              color: getTertiary(context),
                            ))
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Assets.imagesThree,
                              width: 12,
                            ),
                            Expanded(
                                child: MyText(
                              paddingBottom: 5,
                              paddingLeft: 5,
                              text: 'Check your email regularly for updates',
                              size: 14,
                              color: getTertiary(context),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomeContainer(
                    mtop: 30,
                    vpad: 17,
                    hpad: 17,
                    radius: 8,
                    color: getfillcolor(context),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                              MyText(
                          text: "Application Reference",
                          size: 18,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ExpandedRow(
                                text1: 'Reference ID:',
                                text2: '#APP-2024-001234',
                                size1: 13,
                                fontFamily2: AppFonts.gilroyBold,
                                size2: 13,
                                fontFamily: AppFonts.gilroyMedium,
                                color1: getTertiary(context),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Image.asset(
                              Assets.imagesCopy,
                              width: 16,
                              height: 15,
                              color: getTertiary(context),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            MyButton(
              buttonText: 'Browse More Jobs',
              mhoriz: 20,
              mBottom: 12,
            ),
            MyButton(
              buttonText: 'View My Applications',
              outlineColor: getSecondaryColor(context),
              fontColor: getSecondaryColor(context),
              backgroundColor: ktransparent,
              mhoriz: 20,
              mBottom: 30,
            )
          ],
        ));
  }
}
