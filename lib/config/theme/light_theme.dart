import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:flutter/material.dart';

// final ThemeData lightTheme = ThemeData(
//   scaffoldBackgroundColor: kwhite,
//   fontFamily: AppFonts.gilroyRegular,
//   appBarTheme: AppBarTheme(
//     elevation: 0,
//     backgroundColor: ksecondaryy,
//   ),
//   useMaterial3: false,
//   splashColor: kwhite.withOpacity(0.10),
//   highlightColor: kwhite.withOpacity(0.10),
//   colorScheme: ColorScheme.fromSwatch().copyWith(
//       secondary: kblack, primary: kwhite, tertiary: kdgreysubtext),
//   textSelectionTheme: TextSelectionThemeData(
//     cursorColor: kdgreysubtext,
//   ),
// );

///
final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: kbackground,
    brightness: Brightness.dark,
    fontFamily: AppFonts.gilroyRegular,
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
    useMaterial3: false,
    splashColor: kblack,
    highlightColor: kblack.withOpacity(0.10),
    colorScheme: ColorScheme.dark().copyWith(
        primary: kblack,
        tertiary: kgrey,
        secondary: kwhite,
        onPrimary:
            Color(0xff3B3B3B), // Used for text/icons on top of primary color
        onSecondary: kblackfill
        // You might want to add additional dark theme configurations, such as:
// Used for text/icons on top of secondary color
        ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kblack,
    ));
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: AppFonts.gilroyRegular,
  appBarTheme: AppBarTheme(
    elevation: 0,
  ),
  useMaterial3: false,
  splashColor: kwhite,
  highlightColor: kwhite.withOpacity(0.10),
  colorScheme: ColorScheme.fromSwatch().copyWith(
      onPrimary: kwhite,
      primary: kwhite,
      secondary: kblack,
      onSecondary: Color(0xffF1F1F1),
      tertiary: kgrey),
  textSelectionTheme: TextSelectionThemeData(cursorColor: kblack),
);
