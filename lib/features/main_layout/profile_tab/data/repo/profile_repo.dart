import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/model/UpdateUserInfoRequest.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> updateUserProfileData(
      Map<String,dynamic> data);
}