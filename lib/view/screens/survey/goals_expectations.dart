import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoalsExpectations extends StatelessWidget {
  const GoalsExpectations({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SurveyController>();
    List<Map<String, dynamic>> goals = [
      {
        'text1': 'Pass APC on First Attempt ',
        'text2': '— Focused preparation to meet all RICS requirements.',
      },
      {
        'text1': 'Improve Technical Knowledge ',
        'text2': '— Deepen understanding of technical competencies.',
      },
      {
        'text1': 'Structured Study Plan ',
        'text2': '— Clear, manageable roadmap for your APC journey.',
      },
      {
        'text1': 'Time Management ',
        'text2':
            '— Tools and techniques to study effectively within deadlines.',
      },
      {
        'text1': 'Interview Preparation ',
        'text2': '— Practice and guidance to excel in your final interview.',
      },
      {
        'text1': 'Competency Development ',
        'text2': '— Targeted resources to strengthen key competencies.',
      }
    ];
 List<Map<String, dynamic>> support = [
  {
    'text1': 'Study Planning ',
    'text2': '— Guidance on structuring your study time and topics.',
  },
  {
    'text1': 'Technical Guidance ',
    'text2': '— Expert help with technical subjects.',
  },
  {
    'text1': 'Interview Coaching ',
    'text2': '— Practice sessions, QGA, and feedback.',
  },
  {
    'text1': 'Time Management ',
    'text2': '— Reminders and progress tracking to stay on track.',
  },
  {
    'text1': 'Motivation & Accountability ',
    'text2': '— Strategies to balance work, study and life.',
  },
  {
    'text1': 'Peer Support ',
    'text2': '— Connect with other candidates for shared learning.',
  },
  {
    'text1': 'Export Feedback ',
    'text2': '— Reviews of submissions and competency responses.',
  }
];


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DiffTextsTxt(
          align: TextAlign.start,
          text1: 'Primary Goals ',
          text2: '(Select all that apply) ',
          text3: '*',
          size: 16,
          weight1: FontWeight.bold,
          color1: kwhite,
          color2: kwhite,
          weight2: FontWeight.normal,
          size2: 16,
        ),
        MyText(
          text: 'What are your main objectives with APC Pro',
          size: 12,
          paddingTop: 6,
          paddingBottom: 15,
        ),
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: goals.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: diffTextcheckboxRow(
                text1: goals[index]['text1'],
                text2: goals[index]['text2'],
              ),
            );
          },
        ),
        SizedBox(
          height: 30,
        ),
        MyTextField(
          label: 'Final Assessment Date',
          hint: 'mm/dd/yyyy',
          suffixIcon: Image.asset(
            Assets.imagesCalendar,
            width: 18,
          ),
          marginBottom: 30,
        ),
        DiffTextsTxt(
          align: TextAlign.start,
          text1: 'Support Needs ',
          text2: '(Select all that apply)',
          size: 16,
          weight1: FontWeight.bold,
          color1: kwhite,
          color2: kwhite,
          weight2: FontWeight.normal,
          size2: 16,
        ),
        MyText(
          text: 'What kind of support do you need most?',
          size: 12,
          paddingTop: 6,
          paddingBottom: 15,
        ),
           ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: support.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: diffTextcheckboxRow(
                text1: support[index]['text1'],
                text2: support[index]['text2'],
              ),
            );
          },
        ),
        SizedBox(
          height: 15,
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
        ),
        SizedBox(height: 30,)
      ],
    );
  }
}

class diffTextcheckboxRow extends StatelessWidget {
  final String? text1, text2;
  const diffTextcheckboxRow({
    super.key,
    this.text1,
    this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(
          isActive: false,
          onTap: () {},
          size: 14,
          radius: 2,
          circleIconsize: 13,
          borderColor: kwhite,
          bordercolor2: kwhite,
        ),
        SizedBox(width: 7),
        Expanded(
          child: DiffTextsTxt(
            align: TextAlign.start,
            text1: text1 ?? 'Pass APC on First Attempt — ',
            text2:
                text2 ?? 'Focused preparation to meet all RICS requirements.',
            color1: klighblue,
            color2: kwhite,
            size2: 12,
            size: 12,
            weight2: FontWeight.normal,
          ),
        )
      ],
    );
  }
}
