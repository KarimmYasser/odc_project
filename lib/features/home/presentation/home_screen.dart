import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_project/features/home/presentation/home_body.dart';

import '../../../core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -1031.h,
            left: -535.w,
            child: Container(
              width: 1352.w,
              height: 1352.h,
              decoration: BoxDecoration(
                  color: TColors.bot,
                  borderRadius: BorderRadius.circular(676.r)),
            ),
          ),
          Positioned(
            top: -1076.h,
            left: -600.w,
            child: Container(
              width: 1352.w,
              height: 1352.h,
              decoration: BoxDecoration(
                  color: TColors.mid,
                  borderRadius: BorderRadius.circular(676.r)),
            ),
          ),
          Positioned(
            top: -1126.h,
            left: -665.w,
            child: Container(
              width: 1352.w,
              height: 1352.h,
              decoration: BoxDecoration(
                  gradient: TColors.top,
                  borderRadius: BorderRadius.circular(676.r)),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              color: Colors.transparent, // Adjust opacity as needed
            ),
          ),
          HomeBody()
        ],
      ),
    );
  }
}
