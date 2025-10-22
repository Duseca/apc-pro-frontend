import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/community/mandatory_competencies.dart';
import 'package:apc_pro/view/widgets/community_widgets/community_main_widget.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForumDiscussion extends StatelessWidget {
  const ForumDiscussion({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> forumList = [
      {
        "title": "Mandatory Competencies",
        "desc": "Discuss professional ethics, conduct, and communication",
        "text3": "3245 members | 1325 posts",
      },
      {
        "title": "Case Study Help",
        "desc": "Get help with your APC case study projects",
        "text3": "3245 members | 1325 posts",
      },
      {
        "title": "Interview Preparation",
        "desc": "Get help with your APC case study projects",
        "text3": "3245 members | 1325 posts",
      },
      {
        "title": "CPD Advice",
        "desc": "Continuing Professional Development guidance",
        "text3": "3245 members | 1325 posts |  Active 2 minutes ago",
      },
      {
        "title": "General Chat",
        "desc": "Open discussions about APC and surveying",
        "text3": "3245 members | 1325 posts |  Active 2 minutes ago",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Forums and Discussions',
          size: 22,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 25,
        ),
        MyTextField2(
          hint: 'Search Here',
          hintColor: klighblue,
          bordercolor: ksecondary,
          prefixIcon: Image.asset(
            Assets.imagesSearch,
            color: klighblue,
            width: 17,
          ),
        ),
        Row(
          spacing: 15,
          children: [
            Expanded(
                child: CustomDropDown(
                    hint: 'All Topics',
                    hintColor: klighblue,
                    bordercolor: ksecondary,
                    items: [
                      'All Topics',
                      'Case Study',
                      'Interviews',
                      'CPD',
                      'Ethics'
                    ],
                    selectedValue: 'All Topics',
                    iconColor: klighblue,
                    onChanged: (y) {})),
            Expanded(
                child: CustomDropDown(
                    hintColor: klighblue,
                    bordercolor: ksecondary,
                    hint: 'Latest',
                    items: ['Latest', 'Popular', 'Most Replies', 'Solved'],
                    selectedValue: 'Latest',
                    iconColor: klighblue,
                    onChanged: (y) {}))
          ],
        ),
        ListView.builder(
          padding: EdgeInsets.only(top: 8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: forumList.length,
          itemBuilder: (context, index) {
            final item = forumList[index];
            return forumCard(
              title: item["title"]!,
              desc: item["desc"]!,
              text3: item["text3"]!,
              ontap: () {
                Get.to(() => MandatoryCompetencies());
              },
            );
          },
        ),
      ],
    );
  }
}
