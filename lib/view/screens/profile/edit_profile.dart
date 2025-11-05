import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/profile_widgets/profile_widgets.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
          context: context,
          title: 'Profile',
          centerTitle: true,
        ),
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
                  AddProfileImg(),
                  Center(
                    child: MyText(
                      paddingTop: 12,
                      text: 'Change Photo',
                      size: 14,
                      fontFamily: AppFonts.gilroyMedium,
                      paddingBottom: 20,
                    ),
                  ),
                  MyText(
                    text: 'Personal Information',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 20,
                  ),
                  MyTextField2(
                    label: 'Full Name',
                    hint: 'Robert Fox',
                    bordercolor: getfifth(context),
                    filledColor: ktransparent,
                  ),
                  MyTextField2(
                    label: 'Email Address',
                    hint: 'robertfox@gmail.com',
                    bordercolor: getfifth(context),
                    filledColor: ktransparent,
                  ),
                  MyTextField2(
                    label: 'Phone Number',
                    hint: '+1 (555) 123-4567',
                    bordercolor: getfifth(context),
                    filledColor: ktransparent,
                  ),
                  MyText(
                    text: 'Professional Details',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 20,
                  ),
                  CustomDropDown(
                      label: 'Pathway',
                      hint: 'Project Management',
                      items: ['Project Management', 'Team Lead'],
                      value: 'Project Management',
                      bgColor: ktransparent,
                      bordercolor: getfifth(context),
                      hintColor: getTertiary(context),
                      hintsize: 14,
                      iconColor: getTertiary(context),
                      onChanged: (e) {}),
                  CustomDropDown(
                      label: 'Career Stage',
                      hint: 'APC Candidate',
                      items: ['APC Candidate', 'Team Lead'],
                      value: 'APC Candidate',
                      bgColor: ktransparent,
                      bordercolor: getfifth(context),
                      hintColor: getTertiary(context),
                      hintsize: 14,
                      iconColor: getTertiary(context),
                      onChanged: (e) {}),
                  CustomDropDown(
                      label: 'Region',
                      hint: 'North America',
                      items: ['North America', 'Team Lead'],
                      value: 'North America',
                      bgColor: ktransparent,
                      bordercolor: getfifth(context),
                      hintColor: getTertiary(context),
                      hintsize: 14,
                      iconColor: getTertiary(context),
                      onChanged: (e) {}),
                  MyTextField2(
                    label: 'Company',
                    hint: 'ABC Construction Ltd',
                    bordercolor: getfifth(context),
                    filledColor: ktransparent,
                  ),
                  MyTextField2(
                    label: 'Job Title',
                    hint: 'Senior Project Manager',
                    bordercolor: getfifth(context),
                    filledColor: ktransparent,
                  ),
                  MyText(
                    text: 'About',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 20,
                  ),
                  MyTextField2(
                    label: 'Bio',
                    hint:
                        'Experienced project manager specializing in commercial construction with 8+ years in the industry. Passionate about sustainable building practices and leading high-performing teams to deliver projects on time and within budget.',
                    bordercolor: getfifth(context),
                    filledColor: ktransparent,
                    maxLines: 6,
                    marginBottom: 4,
                  ),
                   MyText(
                    text: '180/500 characters',
                    color: getTertiary(context),
                    size: 11,
                    
                    paddingBottom: 20,
                    textAlign: TextAlign.end
                  ),
                  MyText(
                    text: 'Professional Links',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 20,
                  ),
                   MyTextField2(
                    label: 'LinkedIn URL',
                    hint: 'https://linkedin.com/in/yourprofile',
                    bordercolor: getfifth(context),
                    filledColor: ktransparent,
                  ),
                  MyTextField2(
                    label: 'Portfolio URL',
                    hint: 'https://yourportfolio.com',
                    bordercolor: getfifth(context),
                    filledColor: ktransparent,
                  ),
                      MyTextField2(
                    label: 'Website URL',
                    hint: 'https://yourwebsite.com',
                    bordercolor: getfifth(context),
                    filledColor: ktransparent,
                  ),
              
                       MyText(
                    text: 'Privacy Settings',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 20,
                  ),
                  notification_pref_row(
                    title: 'Profile Visibility',
                    desc: 'Choose who can see your profile',
                    fontFamily: AppFonts.gilroyRegular,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  notification_pref_row(
                    title: 'Show Email to Members',
                    desc: 'Let other members see your email',
                    fontFamily: AppFonts.gilroyRegular,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  notification_pref_row(
                    title: 'Let other members see your email',
                    desc: 'Let other members see your phone number',
                    fontFamily: AppFonts.gilroyRegular,
                  ),
             
                  MyButton(
                    mTop: 20,
                    buttonText: 'Save Changes',
                    mBottom: 20,
                  ),
                  MyButton(
                   
                    buttonText: 'Cancel',
                    mBottom: 20,
                    outlineColor: getfifth(context),
                    backgroundColor: getfillcolor(context),
                    fontColor: getSecondaryColor(context),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
