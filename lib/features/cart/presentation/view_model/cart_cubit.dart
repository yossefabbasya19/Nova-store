import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/cart/data/data_source/cart_data_source.dart';
import 'package:ecommerce_app/features/cart/data/model/Cart_data_response.dart';
import 'package:ecommerce_app/features/cart/data/model/Products.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartDataSource) : super(CartInitial());
  final CartDataSource cartDataSource;

  Future<void> getUserCart() async {
    emit(CartLoading());
    var result = await cartDataSource.getCartData();
    result.fold(
      (l) {
        emit(CartFailure(errorMessage: l.errorMessage));
      },
      (r) {
        emit(CartSuccess(products: r));
      },
    );
  }

  Future<void> removeSpecificItemCart(String productID) async {
    emit(CartLoading());
    var result = await cartDataSource.removeSpecificItemCart(productID);
    result.fold(
      (l) {
        emit(CartFailure(errorMessage: l.errorMessage));
      },
      (r) {
        emit(CartSuccess(products: r));
      },
    );
  }
}
