// import 'package:flutter/material.dart';
// import 'package:apc_pro/consts/app_colors.dart';
// import 'package:apc_pro/main.dart';
// import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
// import 'package:apc_pro/view/widgets/custome_comtainer.dart';
// import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
// import 'package:apc_pro/view/widgets/expandable_text.dart';
// import 'package:apc_pro/view/widgets/my_text_field.dart';
// import 'package:apc_pro/view/widgets/my_text_widget.dart';
// import 'package:apc_pro/view/widgets/star_ratings.dart';
// import 'package:get/get.dart';

// class CustomerReviewCard extends StatelessWidget {
//   final bool? hasExpandedtext;
//   final String? name, date, img, review;
//   final Color? bgColor;
//   const CustomerReviewCard(
//       {super.key,
//       this.hasExpandedtext = false,
//       this.name,
//       this.date,
//       this.img,
//       this.review,
//       this.bgColor});

//   @override
//   Widget build(BuildContext context) {
//     final RxBool reply=false.obs;
//     return Obx(
//       ()=> CustomeContainer(
//         radius: 10,
//         borderColor: kborder,
//         hasShadow: true,
//         color: bgColor ?? kfill,
//         widget: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CommonImageView(
//                   url: img ?? dummyImage,
//                   radius: 100,
//                   width: 32,
//                   height: 32,
//                 ),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Expanded(
//                     child: DiffTextsTxt(
//                   align: TextAlign.start,
//                   text1: name ?? 'Alex',
//                   size: 18,
//                   weight1: FontWeight.w500,
//                   color1: kgrey,
//                   text2: '  • ${date ?? '22 May'}',
//                   size2: 16,
//                   color2: kgrey,
//                   weight2: FontWeight.normal,
//                 )),
//                 StarRating(rating: 5)
//               ],
//             ),
//             if (hasExpandedtext == false)
//               MyText(
//                 paddingTop: 5,
//                 text: review ??
//                     'Jacob is an absolute pro! I booked a strength training session and felt super comfortable from start to finish. He listened to my goals and adjusted the workout in real-time to fit my needs.',
//                 size: 14,
//                 color: kgrey,
//                 lineHeight: 1.6,
//               ),
//             if (hasExpandedtext == true)
//               Padding(
//                   padding: const EdgeInsets.only(top: 5),
//                   child: MyText(
//                     text: review ??
//                         'Jacob is an absolute pro! I booked a strength training session and felt super comfortable from start to finish. He listened to my goals and adjusted the workout in real-time to fit my needs.',
//                     size: 14,
//                     color: kgrey,
//                     lineHeight: 1.6,
//                   )
//                   // ExpandableText(
//                   //   Readcolor: ksecondary,
//                   //     text: review ??
//                   //         'Jacob is an absolute pro! I booked a strength training session and felt super comfortable from start to finish.'),
//                   ),
//          if(reply.value==false)
//                       MyText(
//                         text: review ?? 'Reply',
//                         size: 14,
//                         color: ksecondary,
//                         lineHeight: 1.6,
//                         onTap: () {
//                           reply.value=!reply.value;
//                         },
//                       ),
//                   if(reply.value==true)...{
//                     SizedBox(height: 10,),
//                   MyTextField2(
//                     hintColor: kgrey.withOpacity(0.5),
//                     hintSize: 12,
//                     hint: 'Write your reply here',
//                     maxLines: 4,
//                   ),

//                   }
//           ],
//         ),
//       ),
//     );
//   }
// }
