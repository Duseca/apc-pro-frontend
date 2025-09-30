import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
    List selectComp = [
      'Ethics, Roles of Conduct and Professionalism',
      'Communication and Negotiation',
      'Health and Safety',
      'Health and Accounting Principles and Procedures',
      'Accounting Principles and Procedures',
      'Business Planning',
      'Data Management'
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

    return Column(
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
              padding: const EdgeInsets.only(bottom: 10),
              child: checkbox_row(
                title: selectComp[index],
                hasContainer: true,
                cBorder: ksecondary,
                cbg: kblackfill,
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
                hasContainer: true,
                cBorder: ksecondary,
                cbg: kblackfill,
                radius: 3.5,
              ),
            );
          },
        ),
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
                hasContainer: true,
                cBorder: ksecondary,
                cbg: kblackfill,
                radius: 3.5,
              ),
            );
          },
        ),
      ],
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
            size: 18,
          ),
          title: 'Select All',
        ),
      ],
    );
  }
}
