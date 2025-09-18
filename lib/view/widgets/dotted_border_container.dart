// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';

// class DottedBorderContainer extends StatelessWidget {
//   final String? title,icon;
//   final VoidCallback? ontap;
//   final double? vpad,hpad;
//   const DottedBorderContainer({
//     super.key, this.title, this.icon, this.ontap, this.vpad, this.hpad,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Bounce_widget(
//       ontap: ontap??(){},
//       widget: DottedBorder(
//           borderType: BorderType.RRect,
//           dashPattern: [15, 9],
//           color: ktertiary,
//           radius: Radius.circular(15),
//           padding:
//               EdgeInsets.symmetric(vertical:vpad?? 20, horizontal:hpad?? 15),
//           child: Row(
//             children: [
//               if(icon!=null)
//               Image.asset(
//               icon??  Assets.imagesLinktree,
//                 width: 35,
//                 height: 35,
//               ),
//               Expanded(
//                   child: MyText(
//                 text:title?? 'Import from LinkTree',
//                 size: 15,
//                 fontFamily: AppFonts.gilroyMedium,
//                 paddingLeft: 15,
//                 color: kblue,
//               )),
//             ],
//           )),
//     );
//   }
// }
