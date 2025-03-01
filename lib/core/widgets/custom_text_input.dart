import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/core/constants/colors.dart';

class CustomTextInput extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  final Icon? icon;
  final void Function(String)? onChanged;

  const CustomTextInput({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.isPassword = false,
    this.icon,
    this.onChanged,
  });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty)
          Text(
            widget.labelText,
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
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: isVisible,
          decoration: InputDecoration(
            prefixIcon: widget.icon,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                    icon: isVisible
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: TColors.primary,
                          )
                        : Icon(
                            Icons.remove_red_eye_outlined,
                            color: TColors.primary,
                          ),
                  )
                : null,
            contentPadding: EdgeInsets.all(16.sp),
            hintText: widget.hintText,
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
