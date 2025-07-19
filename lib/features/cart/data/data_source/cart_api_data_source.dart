import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/api_service/api_service.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/features/cart/data/data_source/cart_data_source.dart';
import 'package:ecommerce_app/features/cart/data/model/Cart_data_response.dart';
import 'package:ecommerce_app/features/product_details/data/model/set_product_count/set_product_count_request.dart';

class CartApiDataSource extends CartDataSource {
  Future<Either<Failure, CartDataResponse>> getCartData() async {
    try {
      var response = await ApiService.get(ApiConstant.cartEndpoint,
          token: SharedPref().getToken());
      CartDataResponse cartDataResponse = CartDataResponse.fromJson(response);
      return Right(cartDataResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartDataResponse>> removeSpecificItemCart(
      String productID) async {
    try {
      var response = await ApiService.delete(
          "${ApiConstant.cartEndpoint}/$productID",
          token: SharedPref().getToken());
      CartDataResponse cartDataResponse = CartDataResponse.fromJson(response);
      return Right(cartDataResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editProductInCartQuantity(
      String productID, SetProductCountRequest setProductCountRequest) async {
    try {
      await ApiService.put("${ApiConstant.cartEndpoint}/$productID",
          setProductCountRequest.toJson(),
          token: SharedPref().getToken());
      return Right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
