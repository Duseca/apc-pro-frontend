// import 'package:flutter/material.dart';
// import 'package:apc_pro/consts/app_colors.dart';
// import 'package:apc_pro/generated/assets.dart';
// import 'package:apc_pro/view/widgets/dialogboxes.dart';
// import 'package:apc_pro/view/widgets/home_widgets.dart';
// import 'package:get/get.dart';

// class MenuButton extends StatelessWidget {
//   final Color? border, bgColor;
//   final String? icon, text;
//   final double? vpad, hpad;

//   const MenuButton({
//     super.key,
//     this.border,
//     this.bgColor,
//     this.icon,
//     this.text,
//     this.vpad,
//     this.hpad,
//   });

//   void _showCustomPopup(BuildContext context) {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     final position = renderBox.localToGlobal(Offset.zero);

//     showDialog(
//       context: context,
//       barrierColor: Colors.transparent,
//       builder: (_) => Stack(
//         children: [
//           Positioned(
//             top: position.dy - 180, // Position it just above the icon
//             left: position.dx, // Align it with the icon's x-coordinate
//             right: 0,
//             child: Material(
//               color: Colors.transparent,
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: List.generate(3, (index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 12),
//                       child: NotchedCard(), // your custom card widget
//                     );
//                   }),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _showCustomPopup(context),
//       child: EventsPopups(
//         bgColor: bgColor,
//         border: border,
//         text: text,
//         icon: icon,
//         vpad: vpad,
//         hpad: hpad,
//       ),
//     );
//   }
// }

// //
// class FilterMenu extends StatefulWidget {
//   const FilterMenu({super.key});

//   @override
//   State<FilterMenu> createState() => _FilterMenuState();
// }

// class _FilterMenuState extends State<FilterMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       shadowColor: ktransparent,
//       surfaceTintColor: ktransparent,
//       padding: EdgeInsets.all(0),
//       menuPadding: EdgeInsets.all(0),
//       color: ktransparent,
//       icon: Image.asset(
//         Assets.imagesFilter,
//         width: 27,
//         height: 27,
//       ),
//       offset: const Offset(0, 100),
//       position: PopupMenuPosition.over,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       itemBuilder: (BuildContext context) {
//         return [
//           PopupMenuItem<String>(
//               value: 'not_interested',
//               padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
//               child: SizedBox(width: Get.width, child: FiltersDialog())),
//         ];
//       },
//     );
//   }
// }



// // class MenuButton extends StatelessWidget {
// //   final Color? border, bgColor;
// //   final String? icon, text;
// //   final double? vpad, hpad;

// //   const MenuButton({
// //     super.key,
// //     this.border,
// //     this.bgColor,
// //     this.icon,
// //     this.text,
// //     this.vpad,
// //     this.hpad,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return PopupMenuButton<String>(
// //       shadowColor: ktransparent,
// //       surfaceTintColor: ktransparent,
// //       padding: EdgeInsets.all(0),
// //       menuPadding: EdgeInsets.all(0),
// //       color: ktransparent,
// //       icon: EventsPopups(
// //         bgColor: bgColor,
// //         border: border,
// //         text: text,
// //         icon: icon,
// //         vpad: vpad,
// //         hpad: hpad,
// //       ),
// //       offset: const Offset(0, -200),
// //       position: PopupMenuPosition.over,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(8),
// //       ),
// //       itemBuilder: (BuildContext context) {
// //         return [
// //           PopupMenuItem<String>(
// //             value: 'not_interested',
// //             padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
// //             child: SizedBox(
// //               width: Get.width,               child: SingleChildScrollView(
// //                 scrollDirection: Axis.horizontal,
// //                 physics: const BouncingScrollPhysics(),
// //                 child: Row(
// //                   children: List.generate(3, (index) {
// //                     return Padding(
// //                       padding: const EdgeInsets.only(right: 8),
// //                       child: NotchedCard(),
// //                     );
// //                   }),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ];
// //       },
// //     );
// //   }
// // },