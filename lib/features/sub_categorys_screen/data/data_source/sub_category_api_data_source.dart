import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/api_service/api_service.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/product_dm/Product_response.dart';
import 'package:ecommerce_app/features/sub_categorys_screen/data/data_source/subcategory_data_source.dart';

class SubCategoryApiDataSource extends SubcategoryDataSource {
  @override
  Future<Either<Failure, ProductResponse>> getProductBySubCategory(
      String subCategoryID) async {
    try {
      var response = await ApiService.get(ApiConstant.getProductEndpoint,
          queryParameters: {"subcategory": subCategoryID});
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
