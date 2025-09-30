import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/community/community_mesg.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_text_field.dart';

class Notificationss extends StatelessWidget {
  const Notificationss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackground,
        appBar: simpleAppBar(
            context: context, title: 'Notifications', centerTitle: true),
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
                    spacing: 8,
                    children: [
                      Expanded(
                        flex: 3,
                        child: MyTextField(
                          hint: 'Search Here',
                          hintColor: klighblue,
                          bordercolor: ksecondary,
                          prefixIcon: Image.asset(
                            Assets.imagesSearch,
                            color: klighblue,
                            width: 17,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomDropDown(
                          vpad: 14,
                          hint: 'All Categories',
                          hintColor: klighblue,
                          bordercolor: ksecondary,
                          items: [
                            'All Categories',
                            'System',
                            'Community',
                            'AI',
                            'Account',
                            'Operational'
                          ],
                          selectedValue: 'All Categories',
                          onChanged: (value) {},
                          iconSize: 15,
                        ),
                      )
                    ],
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: mesg_tile(
                          title: 'Task Reminder',
                          desc:
                              'Don’t forget! Your weekly diary entry is due today. Log now to stay on track.',
                          icon: Assets.imagesNotifi,
                          hasTime: false,
                          borderColor: ktransparent,
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
