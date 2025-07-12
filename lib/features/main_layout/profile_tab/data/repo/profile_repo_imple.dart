import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/data_source/profile_api_data_source.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/data_source/profile_data_source.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/model/UpdateUserInfoRequest.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/repo/profile_repo.dart';

class ProfileRepoImple extends ProfileRepo {
  final ProfileDataSource profileDataSource;

  ProfileRepoImple({required this.profileDataSource});

  Future<Either<Failure, void>> updateUserProfileData(
      Map<String,dynamic> data) async {
    return await profileDataSource.updateUserProfileData(data);
  }
}
