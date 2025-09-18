import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/view/screens/Navbar/bottom_navbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewProfile extends StatelessWidget {
  const ReviewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SurveyController>();

    List<Map<String, dynamic>> career = [
      {
        'title': 'Personal Information',
        'detail1': 'Sarah John',
        'detail2': 'SarahJohn@gmail.com',
      },
      {
        'title': 'Pathway & Location',
        'detail1': 'Quantity Surveying and Construction',
        'detail2': 'England, United Kingdom',
      },
      {
        'title': 'Career Details',
        'detail1': 'APC Candidate',
        'detail2': 'Software Development Specialist',
      },
      {
        'title': 'CPD Status',
        'detail1': '6 hours completed',
        'detail2': 'Target: 20 hours',
      }
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: career.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: career[index]['title'],
                      size: 16,
                      weight: FontWeight.bold,
                      paddingBottom: 8,
                    ),
                    MyText(
                      text: career[index]['detail1'],
                      size: 12,
                      weight: FontWeight.w400,
                      paddingBottom: 8,
                    ),
                    MyText(
                      text: career[index]['detail2'],
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                  ],
                ));
          },
        ),
        MyText(
          text: 'Selected Competencies',
          size: 16,
          weight: FontWeight.bold,
          paddingBottom: 10,
        ),
        Row(
          spacing: 12,
          children: [
            buttonContainer(
              borderColor: ksecondary,
              bgColor: kbackground,
              text: 'Core : 3',
              radius: 6,
              vPadding: 8,
              hPadding: 15,
            ),
            buttonContainer(
              borderColor: ksecondary,
              bgColor: kbackground,
              text: 'Optional : 2',
              radius: 6,
              vPadding: 8,
              hPadding: 15,
            )
          ],
        ),
        MyText(
          paddingTop: 20,
          text: 'Goals',
          size: 16,
          weight: FontWeight.bold,
          paddingBottom: 8,
        ),
        MyText(
          text: 'Improve Technical Knowledge',
          size: 12,
          weight: FontWeight.w400,
          paddingBottom: 8,
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
                  Get.to(()=>BottomNavBar());
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
