import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc_project/core/constants/colors.dart';
import 'package:odc_project/generated/assets.dart';

class EmptyCartBody extends StatelessWidget {
  const EmptyCartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.svgsCart),
        SizedBox(height: 24.h),
        Text(
          'Your cart is empty',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: TColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            letterSpacing: 0,
          ),
        ),
        SizedBox(height: 24.h),
        SizedBox(
          width: 265.w,
          child: Text(
            'Looks like you haven\'t added anything to your cart yet',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TColors.textSecondary,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              letterSpacing: 0,
            ),
          ),
        ),
      ],
    );
  }
}