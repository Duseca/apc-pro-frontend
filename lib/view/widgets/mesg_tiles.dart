
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MessageTile extends StatelessWidget {
//   final bool isSentBy;
//   final String message;

//   const MessageTile({Key? key, required this.isSentBy, required this.message})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
//       child: Column(
//         crossAxisAlignment:
//             isSentBy ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment:
//                 isSentBy ? MainAxisAlignment.end : MainAxisAlignment.start,
//             children: [
//               // if (!isSentBy) ...[
//               //   Center(
//               //       child: CommonImageView(
//               //     url: dummyImage,
//               //     fit: BoxFit.cover,
//               //     width: 36,
//               //     height: 36,
//               //     radius: 36,
//               //   )),
//               // ],

//               // Message container
//               Flexible(
//                 child: Container(
//                   constraints: BoxConstraints(maxWidth: 250),
//                   child: Column(
//                     crossAxisAlignment: isSentBy
//                         ? CrossAxisAlignment.end
//                         : CrossAxisAlignment.start,
//                     children: [
//                       Stack(
//                         clipBehavior: Clip.none,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: isSentBy ? ksecondary : kgrey,
//                                 // gradient: isSentBy ? kbuttongrad : null,
//                                 borderRadius: BorderRadius.circular(10)
//                                 // borderRadius: BorderRadius.only(
//                                 //   bottomRight: Radius.circular(10),
//                                 //   bottomLeft: Radius.circular(10),
//                                 //   topLeft: isSentBy
//                                 //       ? Radius.circular(10)
//                                 //       : Radius.circular(0),
//                                 //   topRight: isSentBy
//                                 //       ? Radius.circular(0)
//                                 //       : Radius.circular(10),
//                                 // )
//                                 ),
//                             child: Padding(
//                               padding: EdgeInsets.all(8),
//                               child: Column(
//                                 crossAxisAlignment: isSentBy ?CrossAxisAlignment.end: CrossAxisAlignment.start,
//                                 children: [
//                                   MyText(
//                                     text: message,
//                                     color: isSentBy ? kprimary : ktertiary,
//                                     size: 14,
//                                     weight: FontWeight.w400,
//                                     paddingBottom: 5,
//                                   ),
//                                         Align(
//                             alignment: isSentBy
//                                 ? Alignment.bottomLeft
//                                 : Alignment.bottomRight,
//                             child: row_widget(
//                               title: '12:20 AM',
//                               texSize: 9,
//                               weight: FontWeight.bold,
//                               textColor:  isSentBy ? kprimary : ktertiary,
//                               iconSize: 12,
//                               isIconRight: true,
//                             ),
//                           )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 0,
//                             right:isSentBy ? -3.5:null,
//                             left: isSentBy?null:-3.5,
//                             child: Image.asset(isSentBy ?Assets.imagesTrianglegreen:Assets.imagesTrainglegrey,width:20 ,height: 18,))
//                         ],
//                       ),
                   
                
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


// ///chats container

