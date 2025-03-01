import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/features/cart/presentation/widgets/payment_method_container.dart';

import '../../../core/constants/colors.dart';
import '../../../generated/assets.dart';

class SelectPaymentScreen extends StatelessWidget {
  const SelectPaymentScreen({super.key});

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
                  side: BorderSide(color: const Color(0xFFEAEAEA), width: 1.w),
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
          'Payment Method',
          style: GoogleFonts.plusJakartaSans(
            color: TColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            height: 1.44.h,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaymentMethodContainer(
                iconUrl: Assets.paymentMethodsMasterCard,
                title: 'MasterCard',
                subtitle: '**** **** 0783 7873',
              ),
              SizedBox(height: 20.h),
              PaymentMethodContainer(
                iconUrl: Assets.paymentMethodsPaypal,
                title: 'Paypal',
                subtitle: '**** **** 0582 4672',
              ),
              SizedBox(height: 24.h),
              Text(
                'Add Another Method',
                style: GoogleFonts.plusJakartaSans(
                  color: TColors.textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.44.h,
                ),
              ),
              SizedBox(height: 16.h),
              PaymentMethodContainer(
                iconUrl: Assets.paymentMethodsCreditCard,
                title: 'Credit or Debit Card',
                subtitle: 'Pay with your Visa or Mastercard ',
              ),
              SizedBox(height: 16.h),
              PaymentMethodContainer(
                iconUrl: Assets.paymentMethodsPaypal,
                title: 'Paypal',
              ),
              SizedBox(height: 16.h),
              PaymentMethodContainer(
                iconUrl: Assets.paymentMethodsApplePay,
                title: 'Apple Pay',
              ),
              SizedBox(height: 24.h),
              Text(
                'Pay Later',
                style: GoogleFonts.plusJakartaSans(
                  color: TColors.textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.44.h,
                ),
              ),
              SizedBox(height: 16.h),
              PaymentMethodContainer(
                iconUrl: Assets.paymentMethodsPaystack,
                title: 'Kredivo',
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
