import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart';
import '../../../generated/assets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Colors.white24,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_pin,
                      size: 24.h,
                      color: TColors.white,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TTexts.location,
                      style: TextStyle(
                        color: TColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Condong Catur',
                      style: TextStyle(
                        color: TColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Colors.white24,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      size: 24.h,
                      color: TColors.white,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Colors.white24,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      size: 24.h,
                      color: TColors.white,
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  Text(
                    TTexts.homeAppbarTitle,
                    style: TextStyle(
                      color: TColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 32.sp,
                      letterSpacing: 0,
                    ),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 250.h,
                        child: SvgPicture.asset(
                          Assets.svgsHomeContainer,
                          width: 335.w,
                          height: 178.h,
                        ),
                      ),
                      Positioned(
                        top: 12.h,
                        right: 6.w,
                        child: Image.asset(
                          Assets.contentHeadphone,
                          width: 150.w,
                          height: 250.h,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        TTexts.hotDeals,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          letterSpacing: 0,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '02 : 12 : 00 ',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 12.sp,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
