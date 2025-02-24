import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/core/constants/text_strings.dart';
import 'package:odc_project/generated/assets.dart';

import '../../../../core/constants/colors.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text(
                    TTexts.skip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        letterSpacing: 0,
                        color: TColors.textPrimary),
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
            SizedBox(
              height: 550.h,
              width: double.infinity,
              child: PageView(
                controller: _pageController,
                children: [
                  OnboardingPage(
                    title: TTexts.onBoardingTitle1,
                    subTitle: TTexts.onBoardingSubTitle1,
                    asset: Assets.svgsOnboardingImage1,
                  ),
                  OnboardingPage(
                    title: TTexts.onBoardingTitle2,
                    subTitle: TTexts.onBoardingSubTitle2,
                    asset: Assets.svgsOnboardingImage2,
                  ),
                  OnboardingPage(
                    title: TTexts.onBoardingTitle3,
                    subTitle: TTexts.onBoardingSubTitle3,
                    asset: Assets.svgsOnboardingImage3,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    return CircularProgressIndicator(
                      value: _pageController.hasClients
                          ? (((_pageController.page ??
                                      _pageController.initialPage) +
                                  1) /
                              3)
                          : 1.0 / 3,
                      strokeWidth: 2,
                      color: TColors.primary,
                      constraints: BoxConstraints(
                        minHeight: 94.h,
                        minWidth: 94.w,
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        if (_pageController.positions.isNotEmpty) {
                          if (_pageController.page == 2) {
                          } else {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.linear);
                          }
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: TColors.primary,
                        foregroundColor: TColors.white,
                        child: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
