import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:odc_project/core/constants/colors.dart';
import 'package:odc_project/core/widgets/custom_text_input.dart';
import 'package:odc_project/features/home/presentation/widgets/grid_view_products_list.dart';

import '../logic/home_cubit.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  final controller = TextEditingController();

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
                CustomTextInput(
                  hintText: 'Search laptop, headset..',
                  labelText: '',
                  controller: controller,
                  icon: Icon(
                    Iconsax.search_normal,
                    color: TColors.primary,
                  ),
                  onChanged: (_) {
                    setState(() {});
                  },
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
                            ? GridViewProductsList(
                                isEvent: false,
                                searchFilter: controller.text,
                              )
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
