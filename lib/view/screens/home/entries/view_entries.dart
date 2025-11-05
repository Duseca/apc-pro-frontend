import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/entries/entries_detail.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewEntries extends StatelessWidget {
  const ViewEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Entries',
            centerTitle: true,
            actions: [
              Bounce(
                  child: Image.asset(
                Assets.imagesFilter,
                width: 20,
                color: getSecondaryColor(context),
              )),
              SizedBox(
                width: 14,
              )
            ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 5,
              ),
              MyTextField2(
                hint: 'Search entries... ',
                hintColor: getTertiary(context),
                prefixIcon: Image.asset(
                  Assets.imagesSearch,
                  width: 16,
                  color: getTertiary(context),
                ),
                filledColor: getfillcolor(context),
                bordercolor: ktransparent,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding:EdgeInsets.all(0),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: view_entry_card(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class view_entry_card extends StatelessWidget {
  const view_entry_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {
        Get.to(() => EntriesDetail());
      },
      child: CustomeContainer(
        radius: 10,
        hpad: 16,
        vpad: 15,borderColor: getSecondaryColor(context),
        color: getfillcolor(context),
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                buttonContainer(
                 
                  radius: 50,
                  text: 'lvl 1',
                  bgColor:getsplashcolor(context),
                  vPadding: 5,
                  hPadding: 15,
                ),
                SizedBox(
                  width: 15,
                ),
                buttonContainer(
              
                  radius: 50,
                  text: '1.5 days',
                  bgColor: getfillcolor(context),
                  txtColor: getTertiary(context),
                  vPadding: 0,
                  hPadding: 10,
                ),
                // Spacer(),
                // row_widget(
                //   title: 'Edit',
                //   fontFamily: AppFonts.gilroyBold,
                //   icon: Assets.imagesEdit,
                //   iconSize: 18,
                //   lpad: 2,
                //   texSize: 12,
                //   textColor: Color(0xff5796FF),
                // ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            TwoTextedColumn(
              text1: 'Building Surveying and Technology',
              text2:
                  'Conducted detailed survey of Victorian terraced property focusing on structural defects and dampness issue........',
              size1: 14,
              size2: 12,
              fontFamily: AppFonts.gilroyBold,
              fontFamily2: AppFonts.gilroyMedium,
              color2: getTertiary(context),
              mBottom: 8,
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                row_widget(
                    title: '25 mar 2025',
                    fontFamily: AppFonts.gilroyMedium,
                    icon: Assets.imagesCalendar,
                    iconColor: getTertiary(context),
                    iconSize: 18,
                    lpad: 2,
                    texSize: 12,
                    textColor:getTertiary(context)),

                    MyText(text: 'Edit',size: 14,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
