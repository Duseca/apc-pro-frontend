import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/job_posting/post_job_details.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostNewJob extends StatelessWidget {
  const PostNewJob({super.key});

  @override
  Widget build(BuildContext context) {
    final List jobType = ['Full-time', 'Part-time', 'Contract', 'Internship'];
    RxInt selectjobType=(0).obs;
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Post New Job',
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
                    hint: 'e.g. Senior Frontend Developer',
                    label: 'Job Title',
                    filledColor: getfillcolor(context),
                    bordercolor: ktransparent,
                  ),
                  MyTextField2(
                    hint: 'e.g. TechCorp Inc.',
                    label: 'Company',
                    filledColor: getfillcolor(context),
                    bordercolor: ktransparent,
                  ),
                  MyTextField2(
                    hint: 'e.g. San Francisco, CA or Remote',
                    label: 'Location',
                    filledColor: getfillcolor(context),
                    bordercolor: ktransparent,
                  ),
                  MyText(
                    text: 'Job Type',
                    size: 14,
                    fontFamily: AppFonts.gilroySemiBold,
                    paddingBottom: 8,
                  ),
                  GridView.builder(
                    itemCount: jobType.length,
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
                      // final item = homeOptions[index];
                      return Obx(() => MyButton(
                            buttonText: jobType[index],
                            fontSize: 14,
                            fontFamily: AppFonts.gilroyMedium,
                            outlineColor: selectjobType.value == index
                                ? getSecondaryColor(context)
                                : getSecondaryColor(context),
                            fontColor: selectjobType.value == index
                                ? getsplashcolor(context)
                                : getSecondaryColor(context),
                            backgroundColor: selectjobType.value == index
                                ? getSecondaryColor(context)
                                : ktransparent,
                            onTap: () {
                              selectjobType.value = index;
                            },
                          ));
                    },
                  ),
                  job_posting_step_card(
                       step: "Step 1 of 3: Basic Information",
                            percent: '33%',
                  ),
                 
                ],
              ),


            ),

            Divider(color: getfillcolor(context),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                spacing: 15,
                children: [
                  Expanded(child: MyButton(
                          buttonText: 'Save Draft',
                          fontSize: 14,
                          fontFamily: AppFonts.gilroyMedium,
                          outlineColor: getSecondaryColor(context),
                          fontColor: getSecondaryColor(context),
                          backgroundColor: ktransparent,
                          mBottom: 20,
                       radius: 8,
                        )),
                                Expanded(child:  MyButton(
                buttonText: 'Continue ',
                icon: Icons.arrow_forward,
                iconPosition: IconPosition.right,
                imgColor: getsplashcolor(context),
                mBottom: 20,
                iconSize: 15,
                     radius: 8,  
                onTap: () {
                Get.to(()=>PostJobDetails());
                },
              ))
                ],
              ),
            )
          ],
        ));
  }
}
