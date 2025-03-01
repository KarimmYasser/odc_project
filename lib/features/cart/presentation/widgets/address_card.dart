import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/generated/assets.dart';

import '../../../../core/constants/colors.dart';

class AddressContainer extends StatelessWidget {
  final String addressEmoji;
  final String address;
  final String addressNo;
  final String addressType;
  bool isDefault;
  bool isSelected = false;

  AddressContainer(
      {super.key,
      required this.addressEmoji,
      required this.addressType,
      required this.address,
      required this.addressNo,
      this.isDefault = false,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 144.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.w,
              color: isSelected
                  ? const Color(0xFFFF9C44)
                  : const Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF3F6FB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                ),
                child: Text(addressEmoji),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                addressType,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.sp,
                  color: isSelected
                      ? const Color(0xFFFF9C44)
                      : TColors.textPrimary,
                  fontWeight: FontWeight.w400,
                  height: 1.29.h,
                ),
              ),
              const Spacer(),
              isDefault
                  ? Container(
                      width: 53.w,
                      height: 21.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF20AD20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        'Default',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  : Container()
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address,
                      style: GoogleFonts.plusJakartaSans(
                          color: TColors.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.43.h),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      addressNo,
                      style: GoogleFonts.plusJakartaSans(
                        color: TColors.textPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.43.h,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Stack(children: [
                Container(
                  width: 64.w,
                  height: 64.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                        image: AssetImage(Assets.contentMap)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(46.r),
                    ),
                  ),
                ),
                Positioned(
                    top: 16,
                    left: 16,
                    child: Image.asset(Assets.contentPin))
              ])
            ],
          )
        ],
      ),
    );
  }
}
