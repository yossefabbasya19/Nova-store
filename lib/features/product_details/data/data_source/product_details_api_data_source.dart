import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/api_service/api_service.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/features/product_details/data/data_source/product_details_data_source.dart';
import 'package:ecommerce_app/features/product_details/data/model/add_cart/Add_to_cart_response.dart';
import 'package:ecommerce_app/features/product_details/data/model/add_cart/add_to_cart_request.dart';
import 'package:ecommerce_app/features/product_details/data/model/set_product_count/set_product_count_request.dart';

class ProductDetailsApiDataSource extends ProductDetailsDataSource {
  @override
  Future<Either<Failure, AddToCartResponse>> addItemToCart(
      AddToCartRequest addToCartRequest,
      SetProductCountRequest setProductCountRequest) async {
    try {
      var response = await ApiService.post(
          ApiConstant.cartEndpoint, addToCartRequest.toJson(),
          token: SharedPref().getToken());
      await ApiService.put(
          "${ApiConstant.cartEndpoint}/${addToCartRequest.productID}",
          setProductCountRequest.toJson(),
          token: SharedPref().getToken());
      AddToCartResponse addToCartResponse =
          AddToCartResponse.fromJson(response);
      return Right(addToCartResponse);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(
        errorMessage: e.toString(),
      ));
    }
  }
}
