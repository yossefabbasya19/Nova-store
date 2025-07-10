import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/cart/data/model/Cart_data_response.dart';

abstract class CartDataSource {
  Future<Either<Failure,CartDataResponse>>getCartData();
  Future<Either<Failure,CartDataResponse>>removeSpecificItemCart(String productID);

}