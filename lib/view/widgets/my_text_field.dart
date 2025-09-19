import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'my_text_widget.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  MyTextField({
    Key? key,
    this.controller,
    this.hint,
    this.label,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 15.0,
    this.maxLines,
    this.isFilled = true,
    this.filledColor,
    this.focusedFilledColor,
    this.fhintColor,
    this.hintColor,
    this.bordercolor,
    this.isright,
    this.radius = 8,
    this.haveLabel = true,
    this.labelSize,
    this.prefixIcon,
    this.suffixtext,
    this.suffixIcon,
    this.suffixTap,
    this.keyboardType,
    this.showFlag,
    this.labelColor,
    this.labelWeight,
    this.validator,
    this.textColor,
    this.fbordercolor,
    this.focusedLabelColor,
    this.focusNode,
    this.hintSize,
    this.ontapp,
    this.useCountryCodePicker = false,
    this.isoptional = true,
    this.floating,
    this.readOnly,
    this.textAlign,
    this.borderRadius,
    this.cursorColor,
    this.hpad,
    this.isCollapsed,
    this.hintWeight,
    this.hasShadow = true,
    this.vpad,
    this.useOutlinedBorder =
        true, // true for outlined border, false for underline
  }) : super(key: key);

  String? label, hint, suffixtext;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  bool? isObSecure,
      readOnly,
      haveLabel,
      isFilled,
      isright,
      useCountryCodePicker,
      showFlag,
      useOutlinedBorder,
      isoptional,
      isCollapsed,
      hasShadow; // Added this flag for choosing border style
  double? marginBottom;
  int? maxLines;
  double? labelSize, radius, hintSize, vpad, hpad;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Color? filledColor,
      focusedFilledColor,
      focusedLabelColor,
      hintColor,
      bordercolor,
      fbordercolor,
      fhintColor,
      textColor,
      labelColor,
      cursorColor;
  TextAlign? textAlign;
  BorderRadius? borderRadius;
  FontWeight? labelWeight, hintWeight;
  TextInputType? keyboardType;
  VoidCallback? suffixTap, ontapp;
  FocusNode? focusNode;
  String? Function(String?)? validator;
  FloatingLabelBehavior? floating;
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late FocusNode _focusNode;
  final ValueNotifier<bool> _focusNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _focusNotifier.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    _focusNotifier.value = _focusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.marginBottom!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // if (widget.label != null)
          //   ValueListenableBuilder(
          //     valueListenable: _focusNotifier,
          //     builder: (_, isFocused, child) {
          //       return Row(
          //         children: [
          //           MyText(
          //               text: widget.label ?? '',
          //               size: widget.labelSize ?? 16,
          //               paddingBottom: 8,
          //               weight: widget.labelWeight ?? FontWeight.w500,
          //               color: isFocused
          //                   ? widget.focusedLabelColor ?? kheading
          //                   : widget.labelColor ?? kheading),
          //           if (widget.isoptional == false)
          //             MyText(
          //               text: '*',
          //               size: widget.labelSize,
          //               color: ksecondary,
          //               paddingBottom: 8,
          //               paddingLeft: 1,
          //             )
          //         ],
          //       );
          //     },
          //   ),
          ValueListenableBuilder(
            valueListenable: _focusNotifier,
            builder: (_, isFocused, child) {
              return TextFormField(
                onTapOutside: (event) {
                  _focusNode.unfocus();
                },
                cursorColor: widget.cursorColor ?? kwhite,
                keyboardType: widget.keyboardType,
                maxLines: widget.maxLines ?? 1,
                controller: widget.controller,
                onChanged: widget.onChanged,
                onTap: widget.ontapp,
                readOnly: widget.readOnly ?? false,
                textInputAction: TextInputAction.next,
                obscureText: widget.isObSecure!,
                obscuringCharacter: '*',
                style: TextStyle(
                  fontFamily: AppFonts.gilroyRegular,
                  fontSize: 15,
                  color: widget.textColor ?? kwhite,
                  fontWeight: FontWeight.w400,
                ),
                validator: widget.validator,
                textAlign: widget.textAlign ?? TextAlign.left,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  prefixIcon: widget.prefixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          child: widget.prefixIcon,
                        )
                      : null,
                  hintText: widget
                      .hint, // 👈 stays as hint (inside the box when empty)
                  hintStyle: TextStyle(
                    fontFamily: AppFonts.gilroyRegular,
                    fontSize: widget.hintSize ?? 12,
                    color: widget.hintColor ?? kwhite.withOpacity(0.6),
                    fontWeight: widget.hintWeight ?? FontWeight.w400,
                  ),
                  labelText:
                      widget.label, // 👈 separate label, always floating
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  floatingLabelStyle: TextStyle(
                    fontFamily: AppFonts.gilroyRegular,
                    fontSize: widget.labelSize ?? 18,
                    color: widget.focusedLabelColor ?? kwhite,
                    fontWeight: widget.labelWeight ?? FontWeight.w500,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: widget.hpad ?? 15,
                    vertical: widget.vpad ?? 5,
                  ),
                  isCollapsed: widget.isCollapsed ?? false,
                  suffixIcon: widget.suffixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: widget.suffixTap,
                            child: widget.suffixIcon,
                          ),
                        )
                      : null,
                  suffixText: widget.suffixtext,
                  suffixStyle: TextStyle(
                    fontFamily: AppFonts.gilroyRegular,
                    fontSize: 16,
                    color: isFocused
                        ? widget.fhintColor ?? kwhite
                        : widget.hintColor ?? kwhite,
                  ),
                  filled: true,
                  fillColor: isFocused
                      ? widget.focusedFilledColor ?? ktransparent
                      : widget.filledColor ?? ktransparent,
                  enabledBorder: widget.useOutlinedBorder == true
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.bordercolor ??
                                  const Color(0xff263238),
                              width: 1),
                          borderRadius: widget.borderRadius ??
                              BorderRadius.circular(widget.radius ?? 8),
                        )
                      : UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.bordercolor ??
                                  const Color(0xff263238),
                              width: 1),
                        ),
                  focusedBorder: widget.useOutlinedBorder == true
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.fbordercolor ??
                                  const Color(0xff263238),
                              width: 1),
                          borderRadius: widget.borderRadius ??
                              BorderRadius.circular(widget.radius ?? 8),
                        )
                      : UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.bordercolor ??
                                  const Color(0xff263238),
                              width: 1),
                        ),
                         prefixIconConstraints: BoxConstraints.tightFor(),
                      suffixIconConstraints: BoxConstraints.tightFor()
                ),
                
              );
            },
          ),
        ],
      ),
    );
  }
}

///
///
// class MyTextField2 extends StatefulWidget {
//   MyTextField2({
//     Key? key,
//     this.controller,
//     this.hint,
//     this.label,
//     this.onChanged,
//     this.isObSecure = false,
//     this.marginBottom = 15.0,
//     this.maxLines,
//     this.isFilled = true,
//     this.filledColor,
//     this.focusedFilledColor = ktransparent,
//     this.fhintColor,
//     this.hintColor,
//     this.bordercolor,
//     this.isright,
//     this.radius = 6,
//     this.haveLabel = true,
//     this.labelSize,
//     this.prefixIcon,
//     this.suffixtext,
//     this.suffixIcon,
//     this.suffixTap,
//     this.keyboardType,
//     this.showFlag,
//     this.labelColor,
//     this.useCountryCodePicker = false,
//     this.isOutline = false,
//     this.isEditable = true,
//     this.labelWeight,
//   }) : super(key: key);

//   String? label, hint, suffixtext;
//   TextEditingController? controller;
//   ValueChanged<String>? onChanged;
//   bool? isObSecure,
//       haveLabel,
//       isFilled,
//       isright,
//       useCountryCodePicker,
//       showFlag;
//   double? marginBottom;
//   int? maxLines;
//   double? labelSize, radius;
//   Widget? suffixIcon;
//   Widget? prefixIcon;
//   Color? filledColor,
//       focusedFilledColor,
//       hintColor,
//       bordercolor,
//       fhintColor,
//       labelColor;
//   TextInputType? keyboardType;
//   VoidCallback? suffixTap;
//   FontWeight? labelWeight;
//   bool isOutline;
//   bool isEditable;

//   @override
//   _MyTextField2State createState() => _MyTextField2State();
// }

// class _MyTextField2State extends State<MyTextField2> {
//   late FocusNode _focusNode;
//   final ValueNotifier<bool> _focusNotifier = ValueNotifier<bool>(false);

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();
//     _focusNode.addListener(_onFocusChange);
//   }

//   @override
//   void dispose() {
//     _focusNode.removeListener(_onFocusChange);
//     _focusNode.dispose();
//     _focusNotifier.dispose();
//     super.dispose();
//   }

//   void _onFocusChange() {
//     _focusNotifier.value = _focusNode.hasFocus;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: widget.marginBottom!),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // if (widget.label != null)
//           //   MyText(
//           //     text: widget.label ?? '',
//           //     size: 16,
//           //     paddingBottom: 8,
//           //     weight: widget.labelWeight ?? FontWeight.bold,
//           //     color: widget.labelColor ?? kwhite.withOpacity(0.5),
//           //   ),
//           ValueListenableBuilder(
//             valueListenable: _focusNotifier,
//             builder: (_, isFocused, child) {
//               return TextFormField(
//                 onTapOutside: (event) {
//                   _focusNode.unfocus();
//                 },
//                 keyboardType: widget.keyboardType,
//                 maxLines: widget.maxLines ?? 1,
//                 controller: widget.controller,
//                 onChanged: widget.onChanged,
//                 textInputAction: TextInputAction.next,
//                 obscureText: widget.isObSecure!,
//                 obscuringCharacter: '*',
//                 enabled: widget.isEditable,
//                 style: TextStyle(
//                   fontFamily: AppFonts.gilroy,
//                   fontSize: 15,
//                   color: kwhite,
//                   fontfontFamily: AppFonts.gilroyMedium,
//                 ),
//                 cursorColor: kwhite,
//                 textAlign:
//                     widget.isright == true ? TextAlign.right : TextAlign.left,
//                 focusNode: _focusNode,
//                 decoration: InputDecoration(
//                   prefixIcon: widget.prefixIcon,
//                   floatingLabelAlignment: FloatingLabelAlignment.start,
//                   floatingLabelBehavior: FloatingLabelBehavior.never,
//                   // contentPadding:
//                   //     const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//                   // labelText:widget.label?? widget.hint,
//                   // labelStyle: TextStyle(
//                   //   fontFamily: AppFonts.gilroy,
//                   //   color:widget.hintColor?? kwhite.withOpacity(0.8),
//                   //   fontSize: 14
//                   // ),
//                   // Use hint as label to float
//                   // label: MyText(
//                   //   text: widget.hint ?? '',
//                   //   size: widget.labelSize ?? 14,
//                   //   // paddingBottom: 8,
//                   //   weight: widget.labelWeight ?? FontWeight.w400,
//                   //   color: kwhite,
//                   // ),
//                   hintText: widget.hint,
//                   suffixIcon: widget.suffixIcon != null
//                       ? GestureDetector(
//                           onTap: widget.suffixTap,
//                           child: widget.suffixIcon,
//                         )
//                       : widget.suffixIcon,
//                   suffixStyle: TextStyle(
//                     fontFamily: AppFonts.gilroy,
//                     fontSize: 14,
//                     color: isFocused ? widget.fhintColor : widget.hintColor,
//                   ),
//                   suffixText: widget.suffixtext,

//                   hintStyle: TextStyle(
//                       fontFamily: AppFonts.gilroy,
//                       fontSize: 14,
//                       color: isFocused ? kwhite : widget.hintColor ?? kwhite,
//                       fontWeight: FontWeight.normal),
//                   filled: true,
//                   fillColor: isFocused
//                       ? widget.focusedFilledColor
//                       : widget.filledColor ?? ktransparent,
//                   enabledBorder: widget.isOutline
//                       ? OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: widget.bordercolor ?? Color(0xff263238),
//                               width: 1),
//                           borderRadius:
//                               BorderRadius.circular(widget.radius ?? 15),
//                         )
//                       : UnderlineInputBorder(
//                           borderSide: BorderSide(
//                             color: widget.bordercolor ?? ksecondary,
//                           ),
//                           borderRadius:
//                               BorderRadius.circular(widget.radius ?? 15),
//                         ),
//                   focusedBorder: widget.isOutline
//                       ? OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: widget.bordercolor ?? ksecondary,
//                           ),
//                           borderRadius:
//                               BorderRadius.circular(widget.radius ?? 15),
//                         )
//                       : UnderlineInputBorder(
//                           borderSide: BorderSide(
//                             color: widget.bordercolor ?? Color(0xff263238),
//                           ),
//                           borderRadius:
//                               BorderRadius.circular(widget.radius ?? 15),
//                         ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
