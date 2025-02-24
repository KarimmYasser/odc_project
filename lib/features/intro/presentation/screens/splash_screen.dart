import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/assets.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.white,
            body: FlutterSplashScreen.fadeIn(
              nextScreen: OnboardingScreen(),
              backgroundColor: Colors.white,
              duration: const Duration(seconds: 3),
              onInit: () async {
                debugPrint("onInit");
              },
              onEnd: () async {
                debugPrint("onEnd");
              },
              childWidget: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.logosZaladaLogo),
                    SizedBox(height: 34.h),
                    SvgPicture.asset(Assets.logosZalada),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
