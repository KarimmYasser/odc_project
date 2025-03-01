import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/features/auth/presentation/success_modal.dart';

import '../../../core/constants/colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../generated/assets.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColors.white,
        appBar: AppBar(
          backgroundColor: TColors.white,
          centerTitle: true,
          title: Text(
            'OTP',
            style: GoogleFonts.plusJakartaSans(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                height: 1.44.h,
                color: TColors.textPrimary),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(),
              SvgPicture.asset(Assets.svgsOtp),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Verification code',
                style: GoogleFonts.plusJakartaSans(
                  color: TColors.textPrimary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.25.h,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'We have sent the code verification to you',
                style: GoogleFonts.plusJakartaSans(
                  color: TColors.textSecondary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.43.h,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WhatsApp Number ',
                    style: GoogleFonts.plusJakartaSans(
                      color: TColors.textSecondary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.43.h,
                    ),
                  ),
                  Text(
                    ' +62812 788 6XXXX',
                    style: GoogleFonts.plusJakartaSans(
                      color: TColors.textPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.43.h,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 75.w,
                    height: 72.h,
                    padding: EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1.w, color: TColors.softGrey),
                            borderRadius: BorderRadius.circular(12.r))),
                    child: Center(
                      child: Text(
                        '2',
                        style: GoogleFonts.plusJakartaSans(
                            color: TColors.textPrimary,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.25.h),
                      ),
                    ),
                  ),
                  Container(
                    width: 75.w,
                    height: 72.h,
                    padding: EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1.w, color: TColors.softGrey),
                            borderRadius: BorderRadius.circular(12.r))),
                    child: Center(
                      child: Text(
                        '0',
                        style: GoogleFonts.plusJakartaSans(
                            color: TColors.textPrimary,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.25.h),
                      ),
                    ),
                  ),
                  Container(
                    width: 75.w,
                    height: 72.h,
                    padding: EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1.w, color: TColors.softGrey),
                            borderRadius: BorderRadius.circular(12.r))),
                    child: Center(
                      child: Text(
                        '0',
                        style: GoogleFonts.plusJakartaSans(
                            color: TColors.textPrimary,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.25.h),
                      ),
                    ),
                  ),
                  Container(
                    width: 75.w,
                    height: 72.h,
                    padding: EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1.w, color: TColors.softGrey),
                            borderRadius: BorderRadius.circular(12.r))),
                    child: Center(
                      child: Text(
                        '3',
                        style: GoogleFonts.plusJakartaSans(
                            color: TColors.textPrimary,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.25.h),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Recent code in 5s',
                style: GoogleFonts.plusJakartaSans(
                  color: TColors.textPrimary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.50.h,
                ),
              ),
              SizedBox(
                height: 71.h,
              ),
              CustomButton(
                  label: 'Continue',
                  onPressed: () {
                    showModalBottomSheet(
                      showDragHandle: false,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => RegisterSuccessModal()
                    );
                  })
            ],
          ),
        ));
  }
}
