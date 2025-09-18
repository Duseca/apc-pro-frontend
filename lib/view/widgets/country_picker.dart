
// import 'package:country_picker/country_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';



// class CountryPickerButton extends StatelessWidget {
//   final RxString? selectedFlag;
//   RxString? countryName;
//    CountryPickerButton({super.key,  this.selectedFlag, this.countryName});
//   @override
//   Widget build(BuildContext context) {
//     return  Bounce_widget(
//         ontap: () {
//           showCountryPicker(
//             context: context,
//             countryListTheme: CountryListThemeData(
//               padding: EdgeInsets.all(0),
//               bottomSheetHeight: 500,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(6.0),
//                 topRight: Radius.circular(6.0),
//               ),
//               searchTextStyle: TextStyle(fontSize: 12, color:ktertiary),
//               inputDecoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 15),
//                 fillColor:kfill,
//                 filled: true,
//                 hintText: "search".tr,
//                 hintStyle: TextStyle(
//                   fontSize: 12,
//                   color:ktertiary.withOpacity(0.4),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: kgrey2, width: 1),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: kgrey2, width: 1),
//                 ),
//               ),
//             ),
//             onSelect: (Country country) {
//               selectedFlag?.value = country.flagEmoji;
//                 countryName?.value = country.displayName;
//             },
//           );
//         },
//         child: Container(
//           height: 48,
//           padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
//           decoration: BoxDecoration(
//            color:ktransparent,
//            border: Border.all(color: kdivider),
//            borderRadius: BorderRadius.circular(6)
//           ),
//           child: Row(
//             children: [
//               //Image.asset(Assets.imagesLocation,width: 15,),
//               Expanded(
//                 child: MyText(
//                   text: 'Select Country',
//                   color:ktertiary,
//                   size: 14,
//                   paddingRight: 3,
//                   paddingLeft: 6,
//                   maxLines: 1,
//                   textOverflow: TextOverflow.ellipsis,
//                 ),
//               ),
//              Icon(Icons.keyboard_arrow_down_rounded,color: ksecondary,),
//               SizedBox(width: 6),
//             ],
//           ),
//         ),
    
//     );
//   }
// }