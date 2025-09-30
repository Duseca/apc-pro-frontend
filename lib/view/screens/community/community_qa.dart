import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/community_widgets/community_main_widget.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class CommunityQA extends StatelessWidget {
  const CommunityQA({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<Map<String, String>> upcomingEvents = [
      {
        "title": "AMA with Senior Partners - Career Progression",
        "desc":
            "Join our panel of senior partners as they share insights about career progression post-APC",
        "text3": "by Sarah Chen | 2 hours ago |  18 answers  |  234 ",
      },
      {
        "title": "Final Assessment Preparation Workshop",
        "desc":
            "Interactive workshop covering presentation techniques and competency questions",
        "text3": "by Sarah Chen | 2 hours ago |  18 answers  |  234 ",
      },
            {
        "title": "AMA with Senior Partners - Career Progression",
        "desc":
            "Join our panel of senior partners as they share insights about career progression post-APC",
        "text3": "by Sarah Chen | 2 hours ago |  18 answers  |  234 ",
      },
      {
        "title": "Final Assessment Preparation Workshop",
        "desc":
            "Interactive workshop covering presentation techniques and competency questions",
        "text3": "by Sarah Chen | 2 hours ago |  18 answers  |  234 ",
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
               MyText(
          text: 'Q&A Platform',
          size: 22,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 25,
        ),
             ListView.builder(
          padding: EdgeInsets.only(top: 0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: upcomingEvents.length,
          itemBuilder: (context, index) {
            final item = upcomingEvents[index];
            return forumCard(
              title: item["title"]!,
              desc: item["desc"]!,
              text3: item["text3"]!,
              ontap: () {},
              hasIcon: false,
            );
          },
        ),
      ],
    );
  }
}