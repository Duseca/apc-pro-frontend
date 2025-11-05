import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/screens/community/community_event.dart';
import 'package:apc_pro/view/screens/community/community_mesg.dart';
import 'package:apc_pro/view/screens/community/community_qa.dart';
import 'package:apc_pro/view/screens/community/create_new_post.dart';
import 'package:apc_pro/view/screens/community/forum_discussion.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/community_widgets/community_main_widget.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> icons = [
      Assets.imagesUserTag,
      Assets.imagesCbook,
      Assets.imagesCquestion,
      Assets.imagesCalender2,
      Assets.imagesMesg2
    ];
    final List<Widget> tabContents = [
      CommunityHome(),
      ForumDiscussion(),
      CommunityQA(),
      CommunityEvent(),
      CommunityMesg(),
    ];
    final RxInt currentIndex = 0.obs;
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Community',
            centerTitle: true,
            haveBackButton: false),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  Obx(
                    () => TabsWidget(
                      items: ["", "", "", '', ''],
                      iconItems: icons,
                      currentindex: currentIndex.value,
                      ontap: (i) => currentIndex.value = i,
                      isexpanded: true,
                      useIcons: true,
                      iconSize: 20,
                      bgColor: getfillcolor(context),
                    ),
                  ),
                  Obx(() => tabContents[currentIndex.value]),
                ],
              ),
            ),
          ],
        ));
  }
}

class CommunityHome extends StatelessWidget {
  const CommunityHome({super.key});

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
    ];

    final List<Map<String, String>> upcomingEvents = [
      {
        "title": "AMA with Senior Partners - Career Progression",
        "desc":
            "Join our panel of senior partners as they share insights about career progression post-APC",
        "text3": "2024-02-15 at 19:00  |   234 attending",
      },
      {
        "title": "Final Assessment Preparation Workshop",
        "desc":
            "Interactive workshop covering presentation techniques and competency questions",
        "text3": "2024-02-15 at 19:00  |   234 attending",
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomeContainer(
          mtop: 10,
          color: getfillcolor(context),
          vpad: 20,
          hpad: 15,
          radius: 8,
       widget: Row(
            children: [
              CommonImageView(
                url: dummyImage2,
                radius: 100,
                width: 50,
                height: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TwoTextedColumn(
                text1: 'Robert Smith',
                text2: 'APC Candidate\nQuantity Surveying and Construction',
                size1: 14,
                fontFamily: AppFonts.gilroyBold,
                color2: getTertiary(context),
                size2: 12,
              ))
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: new_post_container(
              ontap: () {
                Get.dialog(CreateNewPost());
              },
            )),
            Expanded(
              child: new_post_container(
                icon: Assets.imagesCalendar,
                text1: 'Events',
                text2: 'Join & Learn',
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ExpandedRow(
                text1: 'Popular Forums',
                text2: 'View all',
                size1: 16,
                fontFamily: AppFonts.gilroyBold,
                size2: 12,
                fontFamily2: AppFonts.gilroyMedium,
                color2: getTertiary(context),
              ),
            ),
            Image.asset(
              Assets.imagesForward2,
              width: 18,
              color: getTertiary(context),
            )
          ],
        ),
        ListView.builder(
          padding: EdgeInsets.only(top: 20),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: forumList.length,
          itemBuilder: (context, index) {
            final item = forumList[index];
            return forumCard(
              title: item["title"]!,
              desc: item["desc"]!,
              text3: item["text3"]!,
              ontap: () {},
            );
          },
        ),
        MyText(
          paddingTop: 8,
          text: 'Recent Activity',
          size: 16,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 15,
        ),
        ListView.builder(
          padding: EdgeInsets.only(bottom: 8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return community_recent_activity_card();
          },
        ),
        Row(
          children: [
            Expanded(
              child: ExpandedRow(
                text1: 'Upcoming Events',
                text2: 'View all',
                size1: 16,
                fontFamily: AppFonts.gilroyBold,
                size2: 12,
                fontFamily2: AppFonts.gilroyMedium,
                color2: getTertiary(context),
              ),
            ),
            Image.asset(
              Assets.imagesForward2,
              width: 18,
              color: getTertiary(context),
            )
          ],
        ),
        ListView.builder(
          padding: EdgeInsets.only(top: 20),
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
            );
          },
        ),
      ],
    );
  }
}
