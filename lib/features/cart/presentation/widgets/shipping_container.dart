import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/colors.dart';

class ShippingContainer extends StatelessWidget {
  const ShippingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping',
          style: GoogleFonts.plusJakartaSans(
            color: TColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            height: 1.44.h,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          width: 335.w,
          height: 54.h,
          padding: EdgeInsets.only(
            // top: 16.h,
            left: 16.w,
            right: 16.w,
            // bottom: 16.h,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r),
                ),
                side: const BorderSide(
                  color: TColors.softGrey,
                )),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                width: 44.w,
                height: 30.h,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/j&t.png'),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r)),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Text(
                  'J&T Express',
                  style: GoogleFonts.plusJakartaSans(
                    color: TColors.textPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.43.h,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 14,
              ),
            ],
          ),
        ),
        Container(
          width: 335.w,
          height: 68.h,
          padding: EdgeInsets.only(
            top: 8.h,
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
                side: const BorderSide(
                  color: TColors.softGrey,
                )),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Regular(\$8)',
                style: GoogleFonts.plusJakartaSans(
                  color: TColors.textPrimary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.43.h,
                ),
              ),
              Text(
                'Estimate time 01 - 03 November',
                style: GoogleFonts.plusJakartaSans(
                  color: TColors.textSecondary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.67.h,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
