import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_project/core/helpers/device/device_utility.dart';
import 'package:odc_project/features/home/presentation/widgets/product_card.dart';

import '../../logic/home_cubit.dart';

class GridViewProductsList extends StatelessWidget {
  const GridViewProductsList({
    super.key,
    this.isEvent = false,
  });

  final bool isEvent;

  @override
  Widget build(BuildContext context) {
    final products = context.read<HomeCubit>().products;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (TDeviceUtils.getScreenWidth(context) / 160).round(),
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 24.h,
        childAspectRatio: 0.65,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          title: products[index].title!,
          image: products[index].image!,
          price: products[index].price!.toString(),
          event: 'NEW ARRIVAL',
          isEvent: isEvent,
          onTap: () {},
        );
      },
    );
  }
}
