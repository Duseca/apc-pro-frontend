import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/jobs_widgets/jobs_cards.dart';
import 'package:flutter/material.dart';

class SavedJobs extends StatelessWidget {
  const SavedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Saved Jobs', centerTitle: true),
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
                  ExpandedRow(
                    text1: '8 saved jobs',
                    text2: 'Clear all',
                    size1: 14,
                    size2: 14,
                    fontFamily2: AppFonts.gilroyMedium,
                    fontFamily: AppFonts.gilroyMedium,
                    color1: getTertiary(context),
                    color2: getTertiary(context),
                  ),
                     SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: jobs_container(
                          hasIcon: true,
                          icon: Assets.imagesCross,
                          pButColor: ktransparent,
                          postingTime: 'Saved 2w ago',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
