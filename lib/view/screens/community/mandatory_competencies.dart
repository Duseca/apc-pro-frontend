import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/community_widgets/community_main_widget.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class MandatoryCompetencies extends StatelessWidget {
  const MandatoryCompetencies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            toolbarHeight: 65,
            context: context,
            title: 'Mandatory Competencies',
            centerTitle: true),
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
                  MyText(
                    text:
                        'Discuss professional ethics, conduct, and communication required for APC.',
                    size: 14,
                    color: getTertiary(context),
                    fontFamily: AppFonts.gilroyMedium,
                    paddingBottom: 10,
                  ),
                  CustomeContainer(
                    vpad: 11,
                    hpad: 10,
                    radius: 8,
                    borderColor: getSecondaryColor(context),
                    widget: MyText(
                      text: '3245 members | 1325 posts | Active 2 minutes ago',
                      size: 11,
                      fontFamily: AppFonts.gilroyMedium,
                      color: getTertiary(context),
                    ),
                  ),
                  MyButton(mTop: 15,
                    outlineColor: getSecondaryColor(context),
                    fontColor: getSecondaryColor(context),
                    backgroundColor: ktransparent,
                    buttonText: ' Start new discussion',
                    image: Assets.imagesAdd,
                    imgColor: getSecondaryColor(context),
                    mBottom: 36,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: community_recent_activity_card(
                          hasComments: true,
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
