import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/features/home/presentation/tabs_screen.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/assets.dart';

class PaymentModalSheet extends StatelessWidget {
  const PaymentModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 590.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 4.h,
                width: 66.67.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    color: TColors.softGrey),
              ),
              SizedBox(
                height: 24.h,
              ),
              SvgPicture.asset(Assets.svgsSuccess),
              Text(
                'Order Successful!',
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
                'You have successfully made order',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  color: TColors.textSecondary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.43.h,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomButton(label: 'Continue', onPressed: () {}),
              SizedBox(
                height: 12.h,
              ),
              CustomButton(
                  label: 'Back to home ',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => TabsScreen()),
                        (predicate) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
