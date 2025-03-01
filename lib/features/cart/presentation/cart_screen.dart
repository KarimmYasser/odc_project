import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/core/constants/colors.dart';
import 'package:odc_project/features/cart/presentation/widgets/empty_cart_widget.dart';

import '../../../core/widgets/custom_button.dart';
import '../data/models/product_cart_model.dart';
import '../logic/cubit/cart_cubit.dart';
import 'checkout_cart_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartProducts(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(
                          color: const Color(0xFFEAEAEA), width: 1.w),
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: TColors.textPrimary,
                    size: 20,
                  ),
                ),
                Text(
                  'Cart',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.44.h,
                  ),
                ),
                Container(
                  width: 44.w,
                )
              ],
            ),
            SizedBox(height: 44.h),
            BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is CartInitial) {
                  return const EmptyCartBody();
                }
                if (state is CartLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CartLoaded &&
                    context.read<CartCubit>().cartProducts.isEmpty) {
                  return const EmptyCartBody();
                }
                if (state is CartLoaded &&
                    context.read<CartCubit>().cartProducts.isNotEmpty) {
                  List<ProductCartModel> products =
                      context.read<CartCubit>().cartProducts;
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Container(
                                      width: 108.w,
                                      height: 108.h,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFF3F6FB),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                                          products[index].id!,
                                                          index);
                                                },
                                                child: Container(
                                                  width: 28.w,
                                                  height: 28.h,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1.w,
                                                          color: const Color(
                                                              0xFFEAEAEA)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      '-',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                style:
                                                    GoogleFonts.plusJakartaSans(
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
                                                          products[index].id!,
                                                          index);
                                                },
                                                child: Container(
                                                  width: 28.w,
                                                  height: 28.h,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1.w,
                                                          color: const Color(
                                                              0xFFEAEAEA)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      '+',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<CartCubit>()
                                                      .deleteProductFromCart(
                                                          products[index].id!,
                                                          index);
                                                },
                                                child: Container(
                                                  width: 28.w,
                                                  height: 28.h,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFEAEAEA),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1.w,
                                                          color: const Color(
                                                              0xFFEAEAEA)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons
                                                          .delete_outline_outlined,
                                                      color: Colors.red,
                                                      size: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 1,
                                  color: TColors.grey,
                                );
                              },
                              itemCount: products.length),
                        ),
                        CustomButton(
                            label: 'Checkout',
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const CheckoutCartScreen();
                              })).then((value) {
                                if (value == true) {
                                  context.read<CartCubit>().getCartProducts();
                                }
                              });
                            })
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
