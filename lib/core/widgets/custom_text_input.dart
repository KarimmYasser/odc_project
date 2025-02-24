import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/core/constants/colors.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextInput(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 12.sp,
            color: TColors.textSecondary,
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
            fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            suffixIcon: isPassword
                ? Icon(
                    Icons.remove_red_eye_outlined,
                    color: TColors.primary,
                  )
                : null,
            contentPadding: EdgeInsets.all(16.sp),
            hintText: hintText,
            hintStyle: TextStyle(
              color: TColors.softGrey,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              letterSpacing: 0,
              fontSize: 16.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: TColors.lightGrey,
                width: 1.sp,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: TColors.lightGrey,
                width: 1.sp,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.sp,
              ),
            ),
          ),
        )
      ],
    );
  }
}
