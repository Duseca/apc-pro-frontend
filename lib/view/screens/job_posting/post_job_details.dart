import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/job_posting/job_preview.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostJobDetails extends StatelessWidget {
  const PostJobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List exp = ['Entry Level', 'Mid Level', 'Senior Level', 'Executive'];
    final List salary = ['USD', 'EUR', 'GBP'];
    final List benefits = [
      'Benefits',
      'Health Insurance',
      'Dental Insurance',
      '401(k) Matching',
      'Remote Work',
      'Paid Time Off'
    ];
    RxInt selectedSalary = (0).obs;

    RxInt experience = (0).obs;
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Job Details',
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
                  MyTextField2(
                    hint:
                        'Describe the role, responsibilities, and key duties...',
                    label: 'Job Description',
                    filledColor: getfillcolor(context),
                    bordercolor: ktransparent,
                    maxLines: 5,
                  ),
                  MyTextField2(
                    hint: 'List required skills, experience, education...',
                    label: 'Requirements',
                    filledColor: getfillcolor(context),
                    bordercolor: ktransparent,
                    maxLines: 5,
                  ),
                  MyText(
                    text: 'Salary Range',
                    size: 14,
                    fontFamily: AppFonts.gilroySemiBold,
                    paddingBottom: 8,
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: MyTextField2(
                          hint: 'Min',
                          filledColor: getfillcolor(context),
                          bordercolor: ktransparent,
                        ),
                      ),
                      MyText(
                        text: 'to',
                        size: 14,
                        fontFamily: AppFonts.gilroySemiBold,
                        paddingBottom: 8,
                      ),
                      Expanded(
                        child: MyTextField2(
                          hint: 'Max',
                          filledColor: getfillcolor(context),
                          bordercolor: ktransparent,
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: salary.asMap().entries.map((entry) {
                        int index = entry.key;
                        String tag = entry.value;

                        bool isSelected = selectedSalary.value == index;

                        return TagsWidget(
                          tag,
                          vpad: 8,
                          fontFamily: AppFonts.gilroySemiBold,
                          ontap: () {
                            selectedSalary.value = index;
                          },
                          bgColor: isSelected
                              ? getSecondaryColor(context)
                              : ktransparent,
                          textColor: isSelected
                              ? getsplashcolor(context)
                              : getSecondaryColor(context),
                        );
                      }).toList(),
                    ),
                  ),
                  MyText(
                    paddingTop: 16,
                    text: 'Experience Level',
                    size: 14,
                    fontFamily: AppFonts.gilroySemiBold,
                    paddingBottom: 8,
                  ),
                  GridView.builder(
                    itemCount: exp.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 47,
                    ),
                    itemBuilder: (context, index) {
                      return Obx(() => MyButton(
                            buttonText: exp[index],
                            fontSize: 14,
                            fontFamily: AppFonts.gilroyMedium,
                            outlineColor: experience.value == index
                                ? getSecondaryColor(context)
                                : getSecondaryColor(context),
                            fontColor: experience.value == index
                                ? getsplashcolor(context)
                                : getSecondaryColor(context),
                            backgroundColor: experience.value == index
                                ? getSecondaryColor(context)
                                : ktransparent,
                            onTap: () {
                              experience.value = index;
                            },
                          ));
                    },
                  ),
                  MyText(
                    paddingTop: 16,
                    text: 'Benefits',
                    size: 12,
                    paddingBottom: 8,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: benefits.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: CustomeContainer(
                            radius: 8,
                            color: getfillcolor(context),
                            borderColor: getfifth(context),
                            vpad: 12,
                            hpad: 12,
                            widget: checkbox_row(
                              title: benefits[index],
                              fontFamily: AppFonts.gilroySemiBold,
                            )),
                      );
                    },
                  ),
                  job_posting_step_card()
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
                    buttonText: 'Continue ',
                    icon: Icons.arrow_forward,
                    iconPosition: IconPosition.right,
                    imgColor: getsplashcolor(context),
                    mBottom: 20,
                    iconSize: 15,
                    radius: 8,
                    onTap: () {
                       Get.to(()=>JobPreview());
                    },
                  ))
                ],
              ),
            )
          ],
        ));
  }
}

class job_posting_step_card extends StatelessWidget {
  final String? step,percent;
  const job_posting_step_card({
    super.key, this.step, this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
        mtop: 20,
        radius: 8,
        color: getfillcolor(context),
        borderColor: getfifth(context),
        vpad: 17,
        hpad: 17,
        widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpandedRow(
                text1:step?? "Step 2 of 3: Job Details",
                text2:percent?? '67%',
                size1: 12,
                size2: 14,
                fontFamily2: AppFonts.gilroyMedium,
                color1: getTertiary(context),
              ),
              SizedBox(
                height: 15,
              ),
              linearProgressIndicatorr(
                height: 3,
              ),
            ]));
  }
}
