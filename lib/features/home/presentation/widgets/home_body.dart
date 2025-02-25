import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc_project/features/home/presentation/widgets/grid_view_products_list.dart';
import 'package:odc_project/features/home/presentation/widgets/horizontal_products_list.dart';
import 'package:odc_project/features/home/presentation/widgets/tab_button.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_strings.dart';
import '../../../../generated/assets.dart';
import '../../logic/home_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Colors.white24,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_pin,
                      size: 24.h,
                      color: TColors.white,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TTexts.location,
                      style: TextStyle(
                        color: TColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Condong Catur',
                      style: TextStyle(
                        color: TColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Colors.white24,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      size: 24.h,
                      color: TColors.white,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Colors.white24,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      size: 24.h,
                      color: TColors.white,
                    ),
                  ),
                ),
              ],
            ),
            BlocProvider(
              create: (context) => HomeCubit()..getProducts(),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  Text(
                    TTexts.homeAppbarTitle,
                    style: TextStyle(
                      color: TColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 32.sp,
                      letterSpacing: 0,
                    ),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 250.h,
                        child: SvgPicture.asset(
                          Assets.svgsHomeContainer,
                          width: 335.w,
                          height: 178.h,
                        ),
                      ),
                      Positioned(
                        top: 12.h,
                        right: 6.w,
                        child: Image.asset(
                          Assets.contentHeadphone,
                          width: 150.w,
                          height: 250.h,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        TTexts.hotDeals,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          letterSpacing: 0,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '02 : 12 : 00 ',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 12.sp,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return state is HomeProductsLoading
                          ? buildLoading()
                          : state is HomeProductsLoaded &&
                                  context.read<HomeCubit>().products.isNotEmpty
                              ? HorizontalProductsList(isEvent: true)
                              : buildError();
                    },
                  ),
                  SizedBox(height: 28.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        TTexts.categories,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 44.h,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        TabButton(
                          title: 'All',
                          isSelected: true,
                          icon: Icons.category,
                        ),
                        SizedBox(width: 12.w),
                        TabButton(
                          title: 'Laptop',
                          isSelected: false,
                          icon: Icons.laptop,
                        ),
                        SizedBox(width: 12.w),
                        TabButton(
                          title: 'Accessories',
                          isSelected: false,
                          icon: Icons.headphones,
                        ),
                        SizedBox(width: 12.w),
                        TabButton(
                          title: 'Phones',
                          isSelected: false,
                          icon: Icons.phone_android_sharp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return state is HomeProductsLoading
                          ? buildLoading()
                          : state is HomeProductsLoaded &&
                                  context.read<HomeCubit>().products.isNotEmpty
                              ? GridViewProductsList(isEvent: false)
                              : buildError();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildError() {
  return Center(
    child: Text("Error"),
  );
}
