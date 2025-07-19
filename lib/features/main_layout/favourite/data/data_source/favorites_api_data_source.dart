import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/api_service/api_service.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_source/favorites_data_source.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/model/Favorites_response.dart';

class FavoritesApiDataSource extends FavoritesDataSource {
  @override
  Future<Either<Failure, FavoritesResponse>> getAllFavorites() async {
    try {
      var response = await ApiService.get(ApiConstant.washListEndpoint,
          token: SharedPref().getToken());
      FavoritesResponse favoritesResponse =
          FavoritesResponse.fromJson(response);
      return Right(favoritesResponse);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
