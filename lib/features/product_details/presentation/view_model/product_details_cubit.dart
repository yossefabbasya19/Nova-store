import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/product_details/data/model/add_cart/add_to_cart_request.dart';
import 'package:ecommerce_app/features/product_details/data/model/set_product_count/set_product_count_request.dart';
import 'package:ecommerce_app/features/product_details/data/repo/product_details_repo.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.productDetailsRepo) : super(ProductDetailsInitial());
  int counter = 0;
  final ProductDetailsRepo productDetailsRepo;

  calculatePriceBaseCounterOfSpecificProductIncrease(
      int oneItemPrice, int quantity) {
    if (counter == quantity) {
      emit(TotalPriceFailure(message: "The quantity is not enough"));
      return;
    }
    counter++;
    int totalPrice = oneItemPrice * counter;
    emit(TotalPriceSuccess(totalPrice: totalPrice));
  }

  calculatePriceBaseCounterOfSpecificProductDecrease(int oneItemPrice) {
    if (counter == 0) {
      emit(TotalPriceFailure(message: "miniMun one item"));
      return;
    }
    counter--;
    int totalPrice = oneItemPrice * counter;
    emit(TotalPriceSuccess(totalPrice: totalPrice));
  }

  Future<void> addProductToCart(AddToCartRequest addToCartRequest) async {
    emit(AddProductToCartLoading());
    if(counter == 0 ){
      emit(AddProductToCartFailure(errorMessage: "increase amount of product"));
      return;
    }
    var result = await productDetailsRepo.addItemToCart(
        addToCartRequest, SetProductCountRequest(count: counter));
    result.fold(
      (failure) {
        emit(AddProductToCartFailure(errorMessage: failure.errorMessage));
      },
      (result) {
        emit(AddProductToCartSuccess());
      },
    );
  }
}
