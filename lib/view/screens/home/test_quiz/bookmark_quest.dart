import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkQuest extends StatelessWidget {
  const BookmarkQuest({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> quizTags = [
      'Ethics, Rules of Conduct and Professionalism',
      'Hard',
      '3pts',
    ];
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Bookmarked Questions', centerTitle: true),
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
                  MyTextField2(
                    hint: 'Search questions',
                    prefixIcon: Image.asset(
                      Assets.imagesSearch,
                      width: 18,
                      
                      color: getSecondaryColor(context),
                    ),
                  hintColor: getSecondaryColor(context),
                  ),
                  Row(
                    spacing: 6,
                    children: [
                      Expanded(
                          child: CustomDropDown(
                              bordercolor: getSecondaryColor(context),
                              hint: 'All Reason',
                              hintsize: 10,
                              iconSize: 12,
                              hpad: 5,
                              items: ['All Reason', 'All Reason 2'],
                              value: 'All Reason',
                              onChanged: (w) {})),
                      Expanded(
                          child: CustomDropDown(
                              hintsize: 10,
                              iconSize: 12,
                              hpad: 5,
                              bordercolor: getSecondaryColor(context),
                              hint: 'All Tags',
                              items: ['All Tags', 'All Tags 2'],
                              value: 'All Tags',
                              onChanged: (w) {})),
                      Expanded(
                          child: CustomDropDown(
                              hintsize: 10,
                              iconSize: 12,
                              hpad: 2,
                              bordercolor: getSecondaryColor(context),
                              hint: 'Date Added',
                              items: ['Date Added', 'Date Added 2'],
                              value: 'Date Added',
                              onChanged: (w) {}))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      row_widget(
                        customWidget: CustomCheckBox(
                          isActive: false,
                          onTap: () {},
                          size: 16,
                        ),
                        title: 'Select All',
                      ),
                      MyText(
                        text: '1/1 bookmarks',
                        size: 11,
                        fontFamily: AppFonts.gilroyMedium,
                      )
                    ],
                  ),
                  CustomeContainer(
                      radius: 8,
                     borderColor: getSecondaryColor(context),
                      color: getfillcolor(context),
                      vpad: 17,
                      hpad: 13,
                      mbott: 20,
                      mtop: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 8,
                              runSpacing: 6,
                              children: quizTags.map((tag) {
                                return TagsWidget(tag);
                              }).toList(),
                            ),
                            MyText(
                              paddingTop: 10,
                              text:
                                  'Critically assess the long-term impacts of Ethics, Rules of Conduct and Professionalism strategies',
                              size: 16,
                              fontFamily: AppFonts.gilroyBold,
                              paddingBottom: 20,
                            ),
                            MyTextField2(
                              hint:
                                  'Need to review RICS guidance on this topic',
                              label: 'Notes',
                              maxLines: 5,
                             
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buttonContainer(
                                  radius: 50,
                                  text: 'Edit',
                                  onTap: () {
                                    Get.dialog(EditDialog());
                                  },
                                  fontFamily: AppFonts.gilroyMedium,
                                  bgColor: getfifth(context),
                                 borderColor: getSecondaryColor(context),
                                 imageSize: 12,
                                  imagePath: Assets.imagesEdit2,
                                  iconColor: getSecondaryColor(context),
                                  txtColor: getSecondaryColor(context),
                                  vPadding: 3,
                                  hPadding: 10,
                                ),
                                Bounce(
                                    child: Image.asset(
                                  Assets.imagesTrash,
                                  width: 20,
                                  color: getSecondaryColor(context),
                                ))
                              ],
                            )
                          ]))
                ],
              ),
            ),
          ],
        ));
  }
}

class EditDialog extends StatelessWidget {
  const EditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return dialogBoxBody(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30,
              ),
              MyText(
                text: 'Edit Bookmark',
                size: 20,
                fontFamily: AppFonts.gilroyBold,
              ),
              Bounce(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    Assets.imagesCross,
                    width: 18,
                    color: getSecondaryColor(context),
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          MyTextField2(
            hint: 'Need to review RICS guidance on this topic',
            label: 'Notes',
            maxLines: 5,
           
            marginBottom: 23,
          ),
          Row(
            spacing: 20,
            children: [
              Expanded(
                  child: MyButton(
                backgroundColor: getfillcolor(context),
                fontColor: getSecondaryColor(context),
                outlineColor: getSecondaryColor(context),
                buttonText: 'Cancel',
                height: 48,
                fontSize: 12,
                onTap: () {
                  Get.back();
                },
              )),
              Expanded(
                  child: MyButton(
                buttonText: 'Save Changes',
                height: 48,
                fontSize: 12,
              ))
            ],
          )
        ],
      ),
    );
  }
}
