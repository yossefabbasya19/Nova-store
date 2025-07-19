import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/api_service/api_service.dart';
import 'package:ecommerce_app/core/data/data_source/add_favorited_data_source.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/features/main_layout/home/data/model/wash_list_request.dart';

class AddFavoritedApiDataSource extends AddFavoritesDataSource {
  Future<Either<Failure, void>> addFavorites(
      WashListRequest washListRequest) async {
    try {
      await ApiService.post(
          ApiConstant.washListEndpoint, washListRequest.toJson(),
          token: SharedPref().getToken());
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorites(String productID) async {
    try {
      await ApiService.delete("${ApiConstant.washListEndpoint}/$productID",
          token: SharedPref().getToken());
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
