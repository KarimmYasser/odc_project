import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_project/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:odc_project/features/cart/presentation/widgets/empty_cart_body.dart';

import '../../../core/constants/colors.dart';
import '../logic/cart_cubit.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartData(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              final products = context.read<CartCubit>().products;
              return ConditionalBuilder(
                  condition: products.isNotEmpty,
                  fallback: (context) {
                    return EmptyCartBody();
                  },
                  builder: (context) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final item = products[index];
                        return Dismissible(
                          key: Key(item.id.toString()),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (direction) async {
                            return await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Confirm'),
                                  content: const Text(
                                      'Are you sure you want to delete this item?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          onDismissed: (direction) {
                            products.remove(item);
                          },
                          background: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.red.shade400,
                                  Colors.red.shade900
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child:
                                const Icon(Icons.delete, color: TColors.white),
                          ),
                          child: CartItemCard(item: item),
                        );
                      },
                    );
                  });
            },
          ),
          if (context.watch<CartCubit>().products.isNotEmpty)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: EGP ${context.watch<CartCubit>().totalPrice}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text('Checkout'),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
