import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/api_service/api_service.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/category_dm/category_response.dart';
import 'package:ecommerce_app/core/model/subcategory_dm/Subcategory_dm.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_source/category_data_source.dart';

class CategoryApiDataSource extends CategoryDataSource {
  @override
  Future<Either<Failure, CategoryResponse>> getAllCategory() async {
    try {
      var response = await ApiService.get(ApiConstant.getAllCategoryEndpoint);
      CategoryResponse categoryResponse = CategoryResponse.fromJson(response);
      return Right(categoryResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SubcategoryResponseDm>> getSubCategory(
      String categoryID) async {
    try {
      var response =
          await ApiService.get("/categories/$categoryID/subcategories");
      SubcategoryResponseDm subcategoryResponseDm =
          SubcategoryResponseDm.fromJson(response);
      return Right(subcategoryResponseDm);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
