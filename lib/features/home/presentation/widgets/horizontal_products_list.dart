import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_project/features/home/presentation/widgets/product_card.dart';

import '../../data/model/product_model.dart';
import '../../logic/home_cubit.dart';
import '../product_details_screen.dart';

class HorizontalProductsList extends StatelessWidget {
  const HorizontalProductsList({
    super.key,
    this.isEvent = false,
    required this.products,
  });

  final bool isEvent;

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return SizedBox(
      height: 230.h,
      child: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            ProductCard(
              title: products[index].title!,
              image: products[index].image!,
              price: products[index].price!.toString(),
              event: 'NEW ARRIVAL',
              isEvent: isEvent,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsScreen(
                          products: products,
                          product: products[index],
                        ),
                  ),
                );
              },
            ),
      ),
    );
  }
}
