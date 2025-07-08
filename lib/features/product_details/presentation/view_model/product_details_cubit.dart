import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  int counter = 0;

  calculatePriceBaseCounterOfSpecificProductIncrease(int oneItemPrice,int quantity) {
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
}
