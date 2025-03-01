import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/colors.dart';

class PaymentMethodContainer extends StatelessWidget {
  String iconUrl;
  String title;
  String subtitle;
  PaymentMethodContainer(
      {super.key,
      required this.iconUrl,
      required this.title,
      this.subtitle = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 76.h,
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.w,
        right: 16.w,
        bottom: 16.h,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: const BorderSide(
              color: TColors.softGrey,
            )),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.h,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(iconUrl),
                fit: BoxFit.contain,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r)),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: subtitle != ''
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.plusJakartaSans(
                          color: TColors.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.43.h,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.plusJakartaSans(
                          color: TColors.textSecondary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.33.h,
                        ),
                      )
                    ],
                  )
                : Text(
                    title,
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
    );
  }
}
