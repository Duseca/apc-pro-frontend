import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Future.delayed(const Duration(seconds: 2), () {
        Get.to(() => Onboarding(), transition: Transition.fadeIn);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Image.asset(
            Assets.imagesLogo1,
            height: 59,
          ),
        )
      ],
    ));
  }
}
