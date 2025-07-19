import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/product_details/data/model/add_cart/Add_to_cart_response.dart';
import 'package:ecommerce_app/features/product_details/data/model/add_cart/add_to_cart_request.dart';
import 'package:ecommerce_app/features/product_details/data/model/set_product_count/set_product_count_request.dart';

abstract class ProductDetailsDataSource {
  Future<Either<Failure, AddToCartResponse>> addItemToCart(
      AddToCartRequest addToCartRequest,SetProductCountRequest setProductCountRequest);
}
