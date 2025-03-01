import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/features/home/logic/home_cubit.dart';
import 'package:odc_project/features/home/presentation/widgets/checkout_button.dart';
import 'package:odc_project/features/home/presentation/widgets/horizontal_products_list.dart';

import '../../../core/constants/colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../data/model/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  final List<ProductModel> products;

  const ProductDetailsScreen(
      {super.key, required this.product, required this.products});

  List<ProductModel> getRelatedProducts(
      List<ProductModel> products, String category) {
    return products.where((product) => product.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    getRelatedProducts(products, product.category!);
    num priceBefore = product.price! + 20.0;
    return Scaffold(
      backgroundColor: TColors.white,
      appBar: AppBar(
        backgroundColor: TColors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: 84.w,
                    height: 21.h,
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    decoration: ShapeDecoration(
                        color: Color(0xFFFF9C44),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r))),
                    child: Text(
                      'NEW ARRIVAL',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
                    child: Text(
                      product.title!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        color: TColors.textPrimary,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.25.h,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$ ${product.price!.toString()}',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 20.sp,
                          color: Color(0xFF1B5EC9),
                          fontWeight: FontWeight.w700,
                          height: 1.20.h,
                        ),
                      ),
                      Text(
                        ' \$ $priceBefore',
                        style: GoogleFonts.plusJakartaSans(
                          color: Color(0xFF76777C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                          height: 1.33.h,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  SizedBox(
                      width: 303.w,
                      height: 285.h,
                      child: Image.network(
                        product.image!,
                        fit: BoxFit.contain,
                      )),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Space Grey',
                    style: GoogleFonts.plusJakartaSans(
                      color: Color(0xFF959699),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.33.h,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProductColorsOption(
                        color: const Color(0xFFA6A5AA),
                        isSelected: true,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      ProductColorsOption(
                        color: const Color(0xFFE8E8EA),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      ProductColorsOption(
                        color: const Color(0xFFF2E0CC),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Container(
                    width: 375,
                    height: 4,
                    decoration: const BoxDecoration(color: Color(0xFFF0F1F5)),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            ),
            BlocProvider(
              create: (context) => HomeCubit(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Description',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18.sp,
                        color: TColors.textPrimary,
                        fontWeight: FontWeight.w600,
                        height: 1.44.h,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    ExpandableText(
                      product.description!,
                      style: GoogleFonts.plusJakartaSans(
                        color: TColors.textSecondary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.43.h,
                      ),
                      maxLines: 3,
                      expandText: 'Read More',
                      collapseText: 'Show Less',
                      linkColor: Color(0xFF1B5EC9),
                      linkStyle: GoogleFonts.plusJakartaSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.43.h,
                      ),
                    ),
                    SizedBox(
                      height: 52.h,
                    ),
                    Text(
                      'Product Related',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18.sp,
                        color: TColors.textPrimary,
                        fontWeight: FontWeight.w600,
                        height: 1.44.h,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    HorizontalProductsList(
                        products:
                            getRelatedProducts(products, product.category!)),
                    SizedBox(
                      height: 13.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 112.h,
                      decoration: BoxDecoration(
                          color: TColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CheckoutButton(product: product),
                          SizedBox(
                              width: 267.w,
                              child: CustomButton(
                                  label: 'Checkout', onPressed: () {})),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductColorsOption extends StatelessWidget {
  Color color;
  bool isSelected;

  ProductColorsOption(
      {super.key, required this.color, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40.w,
        height: 40.w,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: OvalBorder(
            side: isSelected
                ? BorderSide(
                    width: 3,
                    color: color,
                  )
                : BorderSide.none,
          ),
        ),
        child: Center(
          child: Container(
            width: 32.w,
            height: 32.w,
            decoration: ShapeDecoration(
                color: color,
                shape: const OvalBorder(
                  side: BorderSide(
                    width: 3,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.white,
                  ),
                )),
          ),
        ));
  }
}
