import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CareerStage extends StatelessWidget {
  const CareerStage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<SurveyController>();

    List<Map<String, dynamic>> career = [
      {
        'title': 'APC Candidate?',
        'description': 'Working towards APC qualification',
        'onTap': () {
          // Navigate to APC Candidate screen
        }
      },
      {
        'title': 'Final Assessment Candidate',
        'description':
            'Completed structured training and submitted your final summary of experience. Preparing for your final assessment interview.',
        'onTap': () {
          // Navigate to Final Assessment Candidate screen
        }
      },
      {
        'title': 'Preliminary Review',
        'description': 'Preparing for preliminary review',
        'onTap': () {
          // Navigate to Preliminary Review screen
        }
      },
      {
        'title': 'RICS Qualified',
'description':'Preparing for preliminary review stage. Working on submission requirements and documentation.',
     'onTap': () {
          // Navigate to Preliminary Review screen
        }
      },
      {
        'title': 'Publisher',
        'description': 'Submission window; Case study & Interview prep',
        'onTap': () {
          // Navigate to RICS Counsellor screen
        }
      }
    ];
    return Column(
      children: [
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: career.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: CareerStageContainer(
                title: career[index]['title'],
                desc: career[index]['description'],
                ontap: career[index]['onTap'],
              ),
            );
          },
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Bounce(   onTap: () {
                  controller.previousStep();
                },
                child: Image.asset(
              isDarkMode ? Assets.imagesBackbutton : Assets.imagesBackbutton2,
              width: 48,
              height: 45,
            )),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: MyButton(
                backgroundColor: getSecondaryColor(context).withOpacity(0.1),
                buttonText: 'Continue',
                fontColor: getTertiary(context),
                onTap: () {
                  controller.nextStep();
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CareerStageContainer extends StatefulWidget {
  final String? title, desc;
  final VoidCallback? ontap;

  const CareerStageContainer({
    super.key,
    this.title,
    this.desc,
    this.ontap,
  });

  @override
  State<CareerStageContainer> createState() => _CareerStageContainerState();
}

class _CareerStageContainerState extends State<CareerStageContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
        if (widget.ontap != null) widget.ontap!();
      },
      child: CustomeContainer(
        color: getfillcolor(context),
        radius: 8,
        widget: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCheckBox(
              isActive: true,
              onTap: () {
                // setState(() {
                //   isExpanded = !isExpanded;
                // });
              },
              iscircle: true,
              iconColor: getSecondaryColor(context),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: widget.title ?? 'APC Candidate?',
                    fontFamily: AppFonts.gilroySemiBold,
                    size: 14,
                    paddingBottom: 5,
                  ),
                  if (isExpanded)
                    MyText(
                      text: widget.desc ?? 'Working towards APC qualification',
                      size: 13,
                      color: Colors.grey,
                      paddingTop: 3,
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
           Image.asset(Assets.imagesGoldbulb,width: 24,height: 24,)
          ],
        ),
      ),
    );
  }
}
