import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/core/constants/colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.asset,
    required this.title,
    required this.subTitle,
  });

  final String asset;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          asset,
          width: 299.w,
          height: 299.h,
        ),
        SizedBox(height: 40.h),
        SizedBox(
          height: 164.h,
          width: 287.w,
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  color: TColors.textPrimary,
                  fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: 28.sp,
                  letterSpacing: 0,
                ),
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: 16.h),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: TextStyle(
                  color: TColors.textSecondary,
                  fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  letterSpacing: 0,
                ),
                overflow: TextOverflow.visible,
              )
            ],
          ),
        ),
      ],
    );
  }
}
