import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/api_service/api_service.dart';
import 'package:ecommerce_app/core/data/main_layout_data/main_layout_data_source.dart';
import 'package:ecommerce_app/core/data/main_layout_data/model/verfiy_token_response/Verfiy_token_respose.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/features/auth/data/model/user_DM.dart';

class MainLayoutApiDataSource extends MainLayoutDataSource {
  @override
  Future<Either<Failure, void>> verifyToken() async {
    try {
      var response = await ApiService.get(ApiConstant.verifyTokenEndpoint,
          token: SharedPref().getToken());
      VerfiyTokenRespose verifyTokenResponse =
          VerfiyTokenRespose.fromJson(response);
      var responseFormUsers = await ApiService.get(ApiConstant.usersEndpoint,
          queryParameters: {"_id": verifyTokenResponse.decoded!.id!});
      UserDm.currentUser = UserDm.fromJson(responseFormUsers["users"][0]);
      var responseFromWashList = await ApiService.get(
          ApiConstant.washListEndpoint,
          token: SharedPref().getToken());
      for (var item in responseFromWashList["data"]) {
        UserDm.currentUser!.washList.add(item["_id"]);
      }
      return Right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
