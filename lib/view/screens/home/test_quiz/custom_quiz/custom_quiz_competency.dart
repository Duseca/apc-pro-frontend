import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
    List selectComp = [
      'Ethics Rules of Conduct ',
      'Client Care ',
      'Communication and Negotiation',
      'Health and Safety',
      'Accounting Principles ',
      'Conflict Avoidance ',
      'Business Planning',
      'Data Management','Sustainability ','Teamworking '
    ];
    List techCore = [
      'Project Management',
      'Procurement and Tendering',
      'Contract Practice',
    ];
    List techOpt = [
      'Construction Technology and Environmental Services',
      'Legal/Regulatory Compliance',
    ];
class CustomQuizCompetency extends StatelessWidget {
  const CustomQuizCompetency({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomeContainer(
      radius: 8,
      borderColor: getSecondaryColor(context),
      color: getfillcolor(context),
     widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _selectAll_text_row(),
          ListView.builder(
            padding: EdgeInsets.only(top: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: selectComp.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: checkbox_row(
                  title: selectComp[index],
                  hasSecText: true,
                  
                  cbg: getfillcolor(context),
                  radius: 3.5,
                ),
              );
            },
          ),
          _selectAll_text_row(
            title: 'Technical Core Competencies',
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: techCore.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: checkbox_row(
                  title: techCore[index],
                  hasSecText: true,
                  
                  cbg: getfillcolor(context),
                  radius: 3.5,
                ),
              );
            },
          ),
          SizedBox(height: 10,),
          _selectAll_text_row(
            title: 'Technical Optional Competencies',
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: techOpt.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: checkbox_row(
                  title: techOpt[index],
                  hasSecText: true,
                  
                  cbg: getfillcolor(context),
                  radius: 3.5,
                ),
              );
            },
          ),
      
              MyButton(
            buttonText: 'Continue',
            mTop: 40,
            outlineColor: getSecondaryColor(context),
            backgroundColor: ktransparent,
            fontColor: getSecondaryColor(context),
          ),
        ],
      ),
    );
  }
}

class _selectAll_text_row extends StatelessWidget {
  final String? title;
  const _selectAll_text_row({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyText(
            text: title ?? 'Select Competencies',
            size: 15,
            fontFamily: AppFonts.gilroyBold,
          ),
        ),
        row_widget(
          customWidget: CustomCheckBox(
            isActive: false,
            onTap: () {},
            size: 14,
          ),
          title: 'Select All',
          textColor: getTertiary(context),
          texSize: 12,
        ),
      ],
    );
  }
}
