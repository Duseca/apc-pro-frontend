import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/profile/groups/rics_professionals/group_chat.dart';
import 'package:apc_pro/view/screens/profile/groups/rics_professionals/group_cpd.dart';
import 'package:apc_pro/view/screens/profile/groups/rics_professionals/group_tables.dart';
import 'package:apc_pro/view/screens/profile/groups/rics_professionals/rics_info.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RicsProfessional extends StatelessWidget {
  const RicsProfessional({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<String> tabs = ["Info", 'Chat', 'Tables', 'CPD'];

    final RxInt currentIndex = 0.obs;
    return Scaffold(
        appBar: simpleAppBar(
            context: context, centerTitle: true, title: 'RICS Professionals'),
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
                  CustomeContainer(
                    radius: 12,
                    vpad: 16,
                    hpad: 16,
                    color: getfillcolor(context),
                    widget: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: getSecondaryColor(context),
                              child: Image.asset(
                                Assets.imagesUsers,
                                color: getsplashcolor(context),
                                width: 22,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: 'RICS Professionals',
                                  size: 24,
                                  fontFamily: AppFonts.gilroyBold,
                                  paddingBottom: 4,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.imagesError,
                                      color: getSecondaryColor(context),
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: MyText(
                                        text: '24 members online',
                                        size: 14,
                                        fontFamily: AppFonts.gilroyMedium,
                                        color: getTertiary(context),
                                        paddingLeft: 6,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ))
                          ],
                        ),
                        MyText(
                          text:
                              'A collaborative group for RICS chartered surveyors to share knowledge, discuss industry trends, and work together on professional development initiatives.',
                          size: 14,
                          fontFamily: AppFonts.gilroyMedium,
                          color: getTertiary(context),
                          paddingTop: 16,
                          paddingBottom: 16,
                        ),
                        MyTextField2(
                          hint: 'Group Code',
                          hintColor: getSecondaryColor(context),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MyText(
                                text: 'R1CS24',
                                size: 12,
                                fontFamily: AppFonts.gilroyBold,
                                paddingRight: 5,
                              ),
                              Image.asset(
                                  isDarkMode
                                      ? Assets.imagesCopyd
                                      : Assets.imagesCopyd,
                                  width: 16)
                            ],
                          ),
                        )
                      ],
                    ),
                    mbott: 5,
                  ),
                  Obx(
                    () => TabsWidget(
                      bgColor: getfillcolor(context),
                      items: tabs,
                      currentindex: currentIndex.value,
                      ontap: (p0) {
                        currentIndex.value = p0;
                      },
                      isexpanded: true,
                      textSize: 11,
                      radius: 8,
                      selectedTextColor: getSecondaryColor(context),
                      unselectedTextColor: getTertiary(context),
                      selectedColor: getfifth(context),
                    ),
                  ),
                  // SizedBox(
                  //   height: 16,
                  // ),
             
                  Obx(() {
                    switch (currentIndex.value) {
                      case 0:
                        return RicsInfo();
                      case 1:
                       return GroupChat();
                      case 2:
                     return GroupTables();
                      case 3:
                         return GroupCpd();
                      default:
                         return RicsInfo();
                    }
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
