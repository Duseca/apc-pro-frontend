import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class StackHintContainer extends StatelessWidget {
  final String?hint;
final Widget? widget;
  const StackHintContainer({super.key, this.hint, this.widget});

  @override
  Widget build(BuildContext context) {
    return   Stack(
                 clipBehavior: Clip.none,
                    children: [
                 
                      CustomeContainer(
                        mbott: 20,
                        radius: 8,
                        borderColor: kblueBorder,
                        widget:widget?? Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                buttonContainer(
                                  imagePath: Assets.imagesMinus,
                                  radius: 6,
                                  vPadding: 5,
                                  hPadding: 16,
                                  bgColor: kbackground,
                                  borderColor: kblueBorder,
                                ),
                                Expanded(
                                  child: CustomeContainer(
                                    vpad: 5,
                                    borderColor: kblueBorder,
                                    radius: 6,
                                    widget: Center(child: MyText(text: '1')),
                                  ),
                                ),
                                buttonContainer(
                                  imagePath: Assets.imagesAdd,
                                  radius: 6,
                                  vPadding: 5,
                                  hPadding: 16,
                                  bgColor: kbackground,
                                  borderColor: kblueBorder,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                           Positioned(
                        left: 13.5,
                        top: -9,
                        child: MyText(
                          bgColor: kbackground,
                          text:hint?? 'Days Committed *',
                          size: 14,
                        ),
                      ),
                    ],
                  );
  }
}