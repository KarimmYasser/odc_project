import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/db/local_db/local_db_helper.dart';
import '../../data/models/product_cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  List<ProductCartModel> cartProducts = [];
  double totalPrice = 0;
  double totalPriceWithShipping = 0;
  CartCubit() : super(CartInitial());

  Future<void> getCartProducts() async {
    emit(CartLoading());

    try {
      await SQLHelper.get().then((value) {
        cartProducts =
            value.map((product) => ProductCartModel.fromJson(product)).toList();
        calculateTotalPrice();
        emit(CartLoaded());
      });
    } catch (error) {
      print(error.toString());
      emit(CartError(error.toString()));
    }
  }

  Future<void> deleteProductFromCart(String id, int index) async {
    emit(CartLoading());
    try {
      await SQLHelper.delete(id);
      cartProducts.removeAt(index);
      calculateTotalPrice();
      emit(CartLoaded());
    } catch (error) {
      emit(CartError(error.toString()));
    }
  }

  Future<void> incrementProductQuantity(String id, int index) async {
    // emit(CartLoading());
    try {
      cartProducts[index].quantity = cartProducts[index].quantity! + 1;

      await SQLHelper.update(
        id,
        cartProducts[index].title!,
        cartProducts[index].description!,
        cartProducts[index].image!,
        cartProducts[index].quantity!,
        cartProducts[index].price!.toDouble(),
      );
      // print('Updated product');
      calculateTotalPrice();
      emit(CartLoaded());
    } catch (error) {
      emit(CartError(error.toString()));
    }
  }

  Future<void> decrementProductQuantity(String id, int index) async {
    // emit(CartLoading());
    try {
      if (cartProducts[index].quantity! > 1) {
        cartProducts[index].quantity = cartProducts[index].quantity! - 1;

        await SQLHelper.update(
          id,
          cartProducts[index].title!,
          cartProducts[index].description!,
          cartProducts[index].image!,
          cartProducts[index].quantity!,
          cartProducts[index].price!.toDouble(),
        );
        calculateTotalPrice();
        emit(CartLoaded());
      }
    } catch (error) {
      emit(CartError(error.toString()));
    }
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    for (var product in cartProducts) {
      totalPrice += product.price! * product.quantity!;
    }
    totalPriceWithShipping = totalPrice + 5;
  }
}
