import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/api_service/api_service.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/features/auth/data/model/user_DM.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/data_source/profile_data_source.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/model/UpdateUserInfoRequest.dart';

 class ProfileApiDataSource extends ProfileDataSource {
  @override
  Future<Either<Failure, void>> updateUserProfileData(
     Map<String,dynamic> data) async {
    try {
      await ApiService.put(
        token: SharedPref().getToken(),
          ApiConstant.updateEndpoint, data);
      UserDm.currentUser!.userName = data["name"]??UserDm.currentUser!.userName;
      UserDm.currentUser!.email = data['email']??UserDm.currentUser!.email;
      return Right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
