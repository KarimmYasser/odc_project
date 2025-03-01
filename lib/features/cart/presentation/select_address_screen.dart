import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/features/cart/presentation/widgets/address_card.dart';

import '../../../core/constants/colors.dart';
import '../../../core/widgets/custom_button.dart';

class SelectAddressScreen extends StatelessWidget {
  const SelectAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColors.white,
        appBar: AppBar(
          backgroundColor: TColors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: Container(
                width: 44.w,
                height: 44.h,
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side:
                        BorderSide(color: const Color(0xFFEAEAEA), width: 1.w),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: TColors.textPrimary,
                  size: 20,
                ),
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Select Address',
            style: GoogleFonts.plusJakartaSans(
              color: TColors.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              height: 1.44.h,
            ),
          ),
          actions: [
            Container(
              width: 44.w,
              height: 44.h,
              decoration: ShapeDecoration(
                shape: CircleBorder(
                  side: BorderSide(color: const Color(0xFFEAEAEA), width: 1.w),
                ),
              ),
              child: const Icon(
                Icons.add,
                color: TColors.textPrimary,
                size: 20,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          child: Column(
            children: [
              AddressContainer(
                addressEmoji: '🏠',
                addressType: 'Home',
                address: 'Jl. Pangkur, Ngaglik, Sleman, Yogyakarta',
                addressNo: '+62812 788 61 1672',
                isDefault: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              AddressContainer(
                addressEmoji: '🏢',
                addressType: 'Office',
                address: 'Jl. Pangkur, Ngaglik, Sleman, Yogyakarta',
                addressNo: '+62812 788 61 1672',
                isSelected: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              AddressContainer(
                addressEmoji: '🏬',
                addressType: 'Apartment',
                address: 'Jl. Pangkur, Ngaglik, Sleman, Yogyakarta',
                addressNo: '+62812 788 61 1672',
              ),
              Spacer(),
              CustomButton(label: 'Select Address', onPressed: () {})
            ],
          ),
        ));
  }
}
