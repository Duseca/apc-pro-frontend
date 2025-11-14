import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/job_posting/post_new_job.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobPostingDashboard extends StatelessWidget {
  const JobPostingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Job Dashboard',
            centerTitle: true,
            haveBackButton: false),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: CustomeContainer(
                          radius: 8,
                          borderColor: getfifth(context),
                          color: getfillcolor(context),
                          widget: TwoTextedColumn(
                            text1: '12',
                            text2: 'Active Jobs',
                            size1: 28,
                            size2: 12,
                            fontFamily: AppFonts.gilroySemiBold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomeContainer(
                          radius: 8,
                          borderColor: getfifth(context),
                          color: getfillcolor(context),
                          widget: TwoTextedColumn(
                            text1: '248',
                            text2: 'Clicks on Posts',
                            size1: 28,
                            size2: 12,
                            fontFamily: AppFonts.gilroySemiBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: CustomeContainer(
                          radius: 8,
                          borderColor: getfifth(context),
                          color: getfillcolor(context),
                          widget: TwoTextedColumn(
                            text1: '18',
                            text2: 'Total Applications',
                            size1: 28,
                            size2: 12,
                            fontFamily: AppFonts.gilroySemiBold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomeContainer(
                          radius: 8,
                          borderColor: getfifth(context),
                          color: getfillcolor(context),
                          widget: TwoTextedColumn(
                            text1: '3',
                            text2: 'Successful Hires',
                            size1: 28,
                            size2: 12,
                            fontFamily: AppFonts.gilroySemiBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  MyText(
                    text: 'Quick Actions',
                    size: 16,
                    fontFamily: AppFonts.gilroySemiBold,
                    paddingBottom: 16,
                    paddingTop: 16,
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      Expanded(
                        child: MyButton(
                          buttonText: ' Post New Job',
                          image: Assets.imagesAdd,
                          iconSize: 15,
                          imgColor: getsplashcolor(context),
                          fontFamily: AppFonts.gilroyMedium,
                          fontSize: 14,
                          mBottom: 16,
                          onTap: () {
                            Get.to(()=>PostNewJob());
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          buttonText: ' View Last Post',
                          image: Assets.imagesEye,
                          iconSize: 15,
                          imgColor: getSecondaryColor(context),
                          fontFamily: AppFonts.gilroyMedium,
                          fontColor: getSecondaryColor(context),
                          backgroundColor: ktransparent,
                          outlineColor: getTertiary(context),
                          fontSize: 14,
                          mBottom: 16,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ExpandedRow(
                          text1: 'Performance',
                          text2: 'See all',
                          size1: 16,
                          fontFamily: AppFonts.gilroyBold,
                          size2: 14,
                          fontFamily2: AppFonts.gilroyMedium,
                          color2: getTertiary(context),
                        ),
                      ),
                      Image.asset(
                        Assets.imagesForward,
                        width: 15,
                        color: getTertiary(context),
                      )
                    ],
                  ),
                  CustomeContainer(
                    mtop: 16,
                    radius: 8,
                    color: getfillcolor(context),
                    borderColor: getfifth(context),
                    vpad: 17,
                    hpad: 17,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExpandedRow(
                          text1: "This Week's Views",
                          text2: '1,247',
                          size1: 12,
                          size2: 14,
                          fontFamily2: AppFonts.gilroyMedium,
                          color1: getTertiary(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        linearProgressIndicatorr(
                          height: 3,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        ExpandedRow(
                          text1: "Application Rate",
                          text2: '19.8%',
                          size1: 12,
                          size2: 14,
                          fontFamily2: AppFonts.gilroyMedium,
                          color1: getTertiary(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        linearProgressIndicatorr(
                          height: 3,
                        ),
                      ],
                    ),
                  ),
                  MyText(
                    text: 'My Posted Jobs',
                    size: 16,
                    fontFamily: AppFonts.gilroySemiBold,
                    paddingBottom: 16,
                    paddingTop: 16,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return posted_jobs_card(
                        status: index == 2 ? 'Paused' : 'Active',
                      );
                    },
                  ),
                  MyText(
                    text: 'Recent Activity',
                    size: 16,
                    fontFamily: AppFonts.gilroySemiBold,
                    paddingBottom: 16,
                    paddingTop: 16,
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) {
                   return   Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Divider(
                          color: getSecondaryColor(context),
                        ),
                      );
                    },
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Image.asset(
                            isDarkMode
                                ?index==1?Assets.imagesScheduled: Assets.imagesUserd
                                :index==1?Assets.imagesSchedulel: Assets.imagesUserl,
                            width: 32,
                            height: 32,
                          ),
                          Expanded(
                            child: TwoTextedColumn(
                              text1:
                                  'New application for Senior Frontend Developer',
                              text2: '2 hours ago',
                              size1: 14,
                              size2: 12,
                              fontFamily: AppFonts.gilroyMedium,
                              maxLines: 2,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                 Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Divider(
                          color: getSecondaryColor(context),
                        ),
                      )
                ],
              ),
            ),
          ],
        ));
  }
}

class posted_jobs_card extends StatelessWidget {
  final String? title, desc, applications, status;
  const posted_jobs_card({
    super.key,
    this.title,
    this.desc,
    this.applications,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
        mbott: 12,
        radius: 8,
        color: getfillcolor(context),
        borderColor: getfifth(context),
        vpad: 17,
        hpad: 17,
        widget: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            spacing: 12,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TwoTextedColumn(
                    text1: title ?? 'Senior Frontend Developer',
                    text2: desc ?? 'TechCorp • Remote • Posted 3 days ago',
                    size1: 16,
                    size2: 12,
                    color2: getTertiary(context),
                    fontFamily: AppFonts.gilroySemiBold,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      MyText(
                        text: '${applications ?? '42'} Applications',
                        size: 12,
                        color: getTertiary(context),
                        paddingLeft: 10,
                      ),
                      TagsWidget(
                        status ?? 'Active',
                        vpad: 6,
                        borderColor: getTertiary(context),
                      )
                    ],
                  )
                ],
              )),
              Image.asset(
                Assets.imagesMore,
                height: 14,
              )
            ],
          )
        ]));
  }
}
