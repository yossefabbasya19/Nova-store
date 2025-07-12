import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/cart/data/model/Cart_data_response.dart';
import 'package:ecommerce_app/features/product_details/data/model/set_product_count/set_product_count_request.dart';

abstract class CartDataSource {
  Future<Either<Failure,CartDataResponse>>getCartData();
  Future<Either<Failure,CartDataResponse>>removeSpecificItemCart(String productID);
  Future<Either<Failure,void>>editProductInCartQuantity(String productID, SetProductCountRequest setProductCountRequest);
}