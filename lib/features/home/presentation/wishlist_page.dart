import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_project/features/home/presentation/widgets/grid_view_products_list.dart';

import '../../../core/constants/text_strings.dart';
import '../logic/home_cubit.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => HomeCubit()..getProducts(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      TTexts.wishlist,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.sp,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33.h),
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
    child: Text(""),
  );
}
