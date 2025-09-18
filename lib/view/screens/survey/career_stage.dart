import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/toolTip.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CareerStage extends StatelessWidget {
  const CareerStage({super.key});

  @override
  Widget build(BuildContext context) {
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
        'description': 'Submission window; Case study & Interview prep',
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
        'title': 'RICS Counsellor',
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
          spacing: 25,
          children: [
            Expanded(
              child: MyButton(
                mTop: 30,
                backgroundColor: klighblue,
                fontColor: ksecondary,
                buttonText: 'Back',
                onTap: () {
                  controller.previousStep();
                },
              ),
            ),
            Expanded(
              child: MyButton(
                mTop: 30,
                buttonText: 'Continue',
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

class CareerStageContainer extends StatelessWidget {
  final String? title, desc;
  final VoidCallback? ontap;
  const CareerStageContainer({
    super.key,
    this.title,
    this.desc,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      borderColor: kblueBorder,
    
      radius: 8,
      widget: Row(
        children: [
          Expanded(
              child: TwoTextedColumn(
            text1: title ?? 'APC Candidate?',
            text2: desc ?? 'Working towards APC qualification',
            size1: 16,
            size2: 12,
            weight1: FontWeight.bold,
          )),
          SizedBox(
            width: 8,
          ),
          // Image.asset(
          //   Assets.imagesQuestionmark,
          //   width: 18,
          //   height: 18,
          // ),
          TooltipIcon()
        ],
      ),
    );
  }
}
