import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/api_service/api_service.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/product_dm/Product_response.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/products_screen_data_source.dart';

class ProductsScreenApiDataSource extends ProductsScreenDataSource {
  Future<Either<Failure, ProductResponse>> fetchData(
      {required bool isCategory,String? categoryID, String? brandID}) async {
    try {
      var response = await ApiService.get(ApiConstant.getProductEndpoint,
          queryParameters:
              isCategory ? {"category[in]": categoryID} : {"brand": brandID});
      ProductResponse productResponse = ProductResponse.fromJson(response);
      return Right(productResponse);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
