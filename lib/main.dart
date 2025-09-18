import 'package:apc_pro/core/bindings.dart';
import 'package:apc_pro/view/screens/Navbar/bottom_navbar.dart';
import 'package:apc_pro/view/screens/auth/login/login.dart';
import 'package:apc_pro/view/screens/onboarding/splash.dart';
import 'package:apc_pro/view/screens/survey/survey_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}
final String dummyImage2 =
    'https://plus.unsplash.com/premium_photo-1661766718556-13c2efac1388?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZG9jdG9yc3xlbnwwfHwwfHx8MA%3D%3D';

final String dummyImage =
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:BottomNavBar(),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
    );
  }
}
