import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/job_posting/job_posting_dashboard.dart';
import 'package:apc_pro/view/screens/jobs/saved_jobs.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/jobs_widgets/jobs_cards.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Job extends StatelessWidget {
  const Job({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
          context: context,
          title: 'Jobs',
          actions: [
            Bounce(
              onTap: () {
                Get.to(() => SavedJobs());
              },
              child: Image.asset(
                Assets.imagesBookmark2,
                width: 18,
                height: 19,
                color: getSecondaryColor(context),
              ),
            ),
            SizedBox(
              width: 15,
            )
          ],
          centerTitle: true,
          haveBackButton: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                MyTextField2(
                  hint: 'Search jobs, companies...',
                  bordercolor: getTertiary(context),
                  filledColor: getfillcolor(context),
                  prefixIcon: Image.asset(
                    Assets.imagesSearch,
                    width: 20,
                    color: getTertiary(context),
                  ),
                ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                        child: CustomDropDown(
                            vpad: 6,
                            hint: 'San Francisco',
                            items: ['San Francisco', 'USA'],
                            value: 'San Francisco',
                            bordercolor: getSecondaryColor(context),
                            onChanged: (s) {})),
                    Expanded(
                        child: CustomDropDown(
                            vpad: 6,
                            hint: 'Full-time',
                            items: ['Full-time', 'Part-time'],
                            value: 'Full-time',
                            bordercolor: getSecondaryColor(context),
                            onChanged: (s) {})),
                    Expanded(
                        child: CustomDropDown(
                            vpad: 6,
                            hint: '\$100k',
                            items: ['\$100k', '\$120k', '\$150k'],
                            value: '\$100k',
                            bordercolor: getSecondaryColor(context),
                            onChanged: (s) {}))
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ExpandedRow(
                        text1: 'Featured Jobs',
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
                SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: jobs_container(
                        hasIcon: true,
                      ),
                    );
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: ExpandedRow(
                        text1: 'Recent Postings',
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
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
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
                    return small_job_container(
                      hasIcon: false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Bounce(
        onTap: () {
          Get.to(() => JobPostingDashboard());
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: getSecondaryColor(context)),
          child: Image.asset(
            Assets.imagesAdd,
            width: 30,
            color: getsplashcolor(context),
          ),
        ),
      ),
    );
  }
}
