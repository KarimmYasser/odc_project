import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_project/features/home/presentation/widgets/product_card.dart';

import '../../logic/home_cubit.dart';

class HorizontalProductsList extends StatelessWidget {
  const HorizontalProductsList({
    super.key,
    this.isEvent = false,
  });

  final bool isEvent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.separated(
        itemCount: context.read<HomeCubit>().products.length,
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ProductCard(
          title: context.read<HomeCubit>().products[index].title!,
          image: context.read<HomeCubit>().products[index].image!,
          price: context.read<HomeCubit>().products[index].price!.toString(),
          event: 'NEW ARRIVAL',
          isEvent: isEvent,
          onTap: () {},
        ),
      ),
    );
  }
}
