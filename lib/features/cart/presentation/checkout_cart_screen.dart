import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/features/cart/presentation/select_address_screen.dart';
import 'package:odc_project/features/cart/presentation/select_payment_screen.dart';
import 'package:odc_project/features/cart/presentation/widgets/payment_method_container.dart';
import 'package:odc_project/features/cart/presentation/widgets/paymet_modal_sheet.dart';
import 'package:odc_project/generated/assets.dart';

import '../../../core/constants/colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../data/models/product_cart_model.dart';
import '../logic/cubit/cart_cubit.dart';

class CheckoutCartScreen extends StatelessWidget {
  const CheckoutCartScreen({super.key});

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
              // padding: EdgeInsets.symmetric(horizontal: 20.w),
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
          'Order',
          style: GoogleFonts.plusJakartaSans(
            color: TColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            height: 1.44.h,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: BlocProvider(
          create: (context) => CartCubit()..getCartProducts(),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              List<ProductCartModel> products =
                  context.read<CartCubit>().cartProducts;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Address',
                          style: GoogleFonts.plusJakartaSans(
                            color: TColors.textPrimary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.44.h,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SelectAddressScreen();
                            }));
                          },
                          child: Text(
                            'Edit',
                            style: GoogleFonts.plusJakartaSans(
                              color: Color(0xFF1B5EC9),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.43.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      '🏠 Home',
                      style: GoogleFonts.plusJakartaSans(
                        color: TColors.textPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.43.h,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      '10th of ramadan City',
                      style: GoogleFonts.plusJakartaSans(
                        color: TColors.textSecondary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.67.h,
                      ),
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                    Text(
                      'Items',
                      style: GoogleFonts.plusJakartaSans(
                        color: TColors.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.44.h,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 4.h,
                      decoration: BoxDecoration(color: Color(0xFFF0F1F5)),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(children: [
                            Container(
                              width: 108.w,
                              height: 108.h,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF3F6FB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Image.network(
                                products[index].image!,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text(
                                    products[index].title!,
                                    maxLines: 2,
                                    style: GoogleFonts.plusJakartaSans(
                                      color: TColors.textPrimary,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 1.43.h,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    '\$ ${products[index].price.toString()}',
                                    style: GoogleFonts.plusJakartaSans(
                                      color: TColors.textPrimary,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      height: 1.43.h,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<CartCubit>()
                                              .decrementProductQuantity(
                                                  products[index].id!, index);
                                        },
                                        child: Container(
                                          width: 28.w,
                                          height: 28.h,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.w,
                                                  color:
                                                      const Color(0xFFEAEAEA)),
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '-',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        context
                                            .watch<CartCubit>()
                                            .cartProducts[index]
                                            .quantity
                                            .toString(),
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<CartCubit>()
                                              .incrementProductQuantity(
                                                  products[index].id!, index);
                                        },
                                        child: Container(
                                          width: 28.w,
                                          height: 28.h,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.w,
                                                  color:
                                                      const Color(0xFFEAEAEA)),
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 26.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<CartCubit>()
                                              .deleteProductFromCart(
                                                  products[index].id!, index);
                                        },
                                        child: Container(
                                          width: 28.w,
                                          height: 28.h,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFEAEAEA),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.w,
                                                  color:
                                                      const Color(0xFFEAEAEA)),
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.delete_outline_outlined,
                                              color: Colors.red,
                                              size: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                          'x${products[index].quantity!.toString()}',
                                          style: GoogleFonts.plusJakartaSans(
                                            color: TColors.textPrimary,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            height: 1.43.h,
                                          )),
                                    ],
                                  )
                                ]))
                          ]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 16.h,
                          );
                        },
                        itemCount: products.length),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 4.h,
                      decoration: BoxDecoration(color: Color(0xFFF0F1F5)),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Column(
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: Image.asset(Assets.contentJt),
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
                                'Regular(\$2)',
                                style: GoogleFonts.plusJakartaSans(
                                  color: TColors.textPrimary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 1.43.h,
                                ),
                              ),
                              Text(
                                'Estimate time',
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
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 4.h,
                      decoration: BoxDecoration(color: Color(0xFFF0F1F5)),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Payment Summary',
                      style: GoogleFonts.plusJakartaSans(
                        color: TColors.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.44.h,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price',
                          style: GoogleFonts.plusJakartaSans(
                            color: TColors.textSecondary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.43.h,
                          ),
                        ),
                        Text(
                          '\$${context.read<CartCubit>().totalPrice.round()}',
                          style: GoogleFonts.plusJakartaSans(
                            color: TColors.textPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.43.h,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee',
                          style: GoogleFonts.plusJakartaSans(
                            color: TColors.textSecondary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.43.h,
                          ),
                        ),
                        Text(
                          '\$5.00',
                          style: GoogleFonts.plusJakartaSans(
                            color: TColors.textPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.43.h,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xFFF0F1F5),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Payment',
                          style: GoogleFonts.plusJakartaSans(
                            color: TColors.textPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.43.h,
                          ),
                        ),
                        Text(
                          '\$ ${context.read<CartCubit>().totalPriceWithShipping.round()}',
                          style: GoogleFonts.plusJakartaSans(
                            color: TColors.textPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.43.h,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 4.h,
                      decoration: BoxDecoration(color: Color(0xFFF0F1F5)),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Payment Method',
                      style: GoogleFonts.plusJakartaSans(
                        color: TColors.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.44.h,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    GestureDetector(
                      child: PaymentMethodContainer(
                        title: 'MasterCard',
                        iconUrl: Assets.paymentMethodsMasterCard,
                        subtitle: '**** **** 0783 7873',
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectPaymentScreen()));
                      },
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomButton(
                        label:
                            'Pay \$ ${context.read<CartCubit>().totalPriceWithShipping.round()}',
                        onPressed: () {
                          showModalBottomSheet(
                              showDragHandle: false,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return PaymentModalSheet();
                              });
                        })
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
