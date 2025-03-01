import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_project/features/home/presentation/widgets/product_card.dart';

import '../../logic/home_cubit.dart';

class GridViewProductsList extends StatelessWidget {
  const GridViewProductsList({
    super.key,
    this.isEvent = false,
    this.searchFilter = '',
  });

  final bool isEvent;
  final String searchFilter;

  @override
  Widget build(BuildContext context) {
    final products = context.read<HomeCubit>().products;
    final filteredProducts = products.where((product) {
      return product.title!.toLowerCase().contains(searchFilter.toLowerCase());
    }).toList();
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 24.h,
        childAspectRatio: 0.65,
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        return ProductCard(
          title: filteredProducts[index].title!,
          image: filteredProducts[index].image!,
          price: filteredProducts[index].price!.toString(),
          event: 'NEW ARRIVAL',
          isEvent: isEvent,
          onTap: () {},
        );
      },
    );
  }
}
