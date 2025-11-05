import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';


class MessageTile extends StatelessWidget {
  final bool isSentBy;
  final String message;

  const MessageTile({Key? key, required this.isSentBy, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: Column(
        crossAxisAlignment:
            isSentBy ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                isSentBy ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isSentBy) ...[
                Center(
                    child: CommonImageView(
                 url: dummyImage,
                
                  width: 42,
                  height: 42,
                  radius: 100
                )),
              ],

              // Message container
              Flexible(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 250),
                  child: Column(
                    crossAxisAlignment: isSentBy
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: isSentBy?0:8,left: isSentBy?0:5
                        ),
                        decoration: BoxDecoration(
                            
                           
                            color: isSentBy ?  getfillcolor(context):getSecondaryColor(context),
                      
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topLeft: isSentBy
                                  ? Radius.circular(20)
                                  : Radius.circular(0),
                              topRight: isSentBy
                                  ? Radius.circular(0)
                                  : Radius.circular(20),
                            )),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: isSentBy
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              MyText(
                            
                                text: message,
                                color: isSentBy ? getSecondaryColor(context) : getsplashcolor(context),
                                size: 12,
                               fontFamily: AppFonts.gilroyMedium,
                                paddingBottom: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


///chats container

