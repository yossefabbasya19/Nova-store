import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/api_service/api_service.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/brands_dm/brands_response.dart';
import 'package:ecommerce_app/core/model/category_dm/category_response.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_source/home_data_source.dart';

class HomeApiDataSource extends HomeDataSource {
  Future<Either<Failure, CategoryResponse>> getAllCategory() async {
    try {
      var response = await ApiService.get(ApiConstant.getAllCategoryEndpoint);
      CategoryResponse categoryResponse = CategoryResponse.fromJson(response);
      return Right(categoryResponse);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExption(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BrandsResponse>> getBrands({int pageNumber =1}) async{
    try{
    var response =  await ApiService.get(ApiConstant.getAllBrandsEndpoint,pageNumber: pageNumber);
    BrandsResponse brandsResponse = BrandsResponse.fromJson(response);
    return Right(brandsResponse);
    }on Exception catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioExption(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
