import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/job_posting/manage_jobs.dart';
import 'package:apc_pro/view/screens/job_posting/post_job_details.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobPreview extends StatelessWidget {
  const JobPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Job Preview',
            centerTitle: true,
            actions: [
              Bounce(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    Assets.imagesCross,
                    width: 15,
                    color: getSecondaryColor(context),
                  )),
              SizedBox(
                width: 15,
              )
            ]),
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
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    borderColor: getfifth(context),
                    vpad: 17,
                    hpad: 17,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Image.asset(
                              isDarkMode ? Assets.imagesJobd : Assets.imagesJob,
                              width: 48,
                              height: 48,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: 'Senior Software Engineer',
                                    size: 16,
                                    fontFamily: AppFonts.gilroyBold,
                                    paddingBottom: 3,
                                  ),
                                  TwoTextedColumn(
                                    text1: 'TechCorp Inc.',
                                    text2: 'San Francisco, CA • Remote',
                                    size1: 14,
                                    size2: 12,
                                    color2: getTertiary(context),
                                    fontFamily: AppFonts.gilroyMedium,
                                    maxLines: 2,
                                    mBottom: 0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            TagsWidget(
                              '\$120K - \$180K USD',
                              bgColor: getfifth(context),
                              borderColor: ktransparent,
                            ),
                            TagsWidget(
                              'Entry Level',
                              bgColor: getfifth(context),
                              borderColor: ktransparent,
                            ),
                            TagsWidget(
                              'Full-time',
                              bgColor: getfifth(context),
                              borderColor: ktransparent,
                            )
                          ],
                        ),
                        TwoTextedColumn(
                            size1: 12,
                            size2: 14,
                            mBottom: 8,
                            fontFamily2: AppFonts.gilroyMedium,
                            fontFamily: AppFonts.gilroyMedium,
                            text1: 'Job Description',
                            text2:
                                'We are seeking a talented Senior Software Engineer to join our dynamic development team. You will be responsible for designing, developing, and maintaining scalable web applications using modern technologies.'),
                        TwoTextedColumn(
                            size1: 12,
                            size2: 14,
                            mBottom: 8,
                            fontFamily2: AppFonts.gilroyMedium,
                            fontFamily: AppFonts.gilroyMedium,
                            text1: 'Requirements',
                            text2:
                                '• 5+ years of experience in software development\n• Proficiency in JavaScript, React, and Node.js\n• Experience with cloud platforms (AWS, Azure)\n• Strong problem-solving skills and team collaboration'),
                        MyText(
                          text: 'Benefits',
                          fontFamily: AppFonts.gilroyMedium,
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            TagsWidget(
                              'Health Insurance',
                              bgColor: getfifth(context),
                              borderColor: ktransparent,
                            ),
                            TagsWidget(
                              '401(k) Matching',
                              bgColor: getfifth(context),
                              borderColor: ktransparent,
                            ),
                            TagsWidget(
                              'Paid Time Off',
                              bgColor: getfifth(context),
                              borderColor: ktransparent,
                            )
                          ],
                        ),
                      ],
                    ),
                    mbott: 16,
                  ),
                  MyText(
                    text: 'Need to make changes?',
                    fontFamily: AppFonts.gilroyMedium,
                    paddingBottom: 16,
                  ),
                  Row(
                    children: [
                      MyButton(
                        buttonText: 'Edit Basic Information ',
                        outlineColor: getTertiary(context),
                        fontColor: getSecondaryColor(context),
                        backgroundColor: ktransparent,
                        fontSize: 13.8,
                        hpad: 20,
                        fontFamily: AppFonts.gilroyMedium,
                        image: Assets.imagesArrowright2,
                        imgColor: getSecondaryColor(context),
                        iconSize: 10,
                        iconPosition: IconPosition.right,
                        mBottom: 8,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        buttonText: 'Edit Job Details ',
                        outlineColor: getTertiary(context),
                        fontColor: getSecondaryColor(context),
                        backgroundColor: ktransparent,
                        fontSize: 13.8,
                        hpad: 20,
                        fontFamily: AppFonts.gilroyMedium,
                        image: Assets.imagesArrowright2,
                        imgColor: getSecondaryColor(context),
                        iconSize: 10,
                        iconPosition: IconPosition.right,
                      )
                    ],
                  ),

                    job_posting_step_card(
                       step: "Step 3 of 3: Review & Confirm",
                            percent: '100%',
                  ),
                ],
              ),
            ),
              Divider(
              color: getfillcolor(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                spacing: 15,
                children: [
                  Expanded(
                      child: MyButton(
                    buttonText: 'Save Draft',
                    fontSize: 14,
                    fontFamily: AppFonts.gilroyMedium,
                    outlineColor: getSecondaryColor(context),
                    fontColor: getSecondaryColor(context),
                    backgroundColor: ktransparent,
                    mBottom: 20,
                    radius: 8,
                  )),
                  Expanded(
                      child: MyButton(
                    buttonText: 'Publish Job ',
                    icon: Icons.check,
                    iconPosition: IconPosition.right,
                    imgColor: getsplashcolor(context),
                    mBottom: 20,
                    iconSize: 15,
                    radius: 8,
                    onTap: () {
                       Get.to(() => ManageJobs(), transition: Transition.noTransition);

                    },
                  ))
                ],
              ),
            )
          ],
        ));
  }
}
