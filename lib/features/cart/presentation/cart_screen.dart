import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/core/constants/colors.dart';

import '../logic/cart_cubit.dart';
import 'cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartData(),
      child: Scaffold(
        backgroundColor: TColors.white,
        appBar: AppBar(
          title: const Text('Cart'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: TColors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: CartBody(),
      ),
    );
  }
}
