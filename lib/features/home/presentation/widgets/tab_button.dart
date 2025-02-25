import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_project/core/constants/colors.dart';

class TabButton extends StatefulWidget {
  final String title;
  bool isSelected;
  final IconData icon;

  TabButton({
    super.key,
    required this.title,
    this.isSelected = false,
    required this.icon,
  });

  @override
  State<TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(4.w, 4.h, 20.w, 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44.r),
          color: widget.isSelected ? TColors.primary : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                color: TColors.white,
              ),
              child: Center(
                child: Icon(
                  widget.icon,
                  color: TColors.textPrimary,
                  size: 24,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.isSelected ? TColors.white : TColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
