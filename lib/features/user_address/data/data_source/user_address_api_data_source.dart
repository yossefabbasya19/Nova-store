import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/api_service/api_service.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/features/user_address/data/data_source/user_address_data_source.dart';
import 'package:ecommerce_app/features/user_address/data/model/Address_response.dart';

class UserAddressApiDataSource extends UserAddressDataSource {
  @override
  Future<Either<Failure, AddressResponse>> getAllUserAddress() async {
    try {
      var response = await ApiService.get(ApiConstant.addressEndpoint,
          token: SharedPref().getToken());
      AddressResponse addressResponse = AddressResponse.fromJson(response);
      return Right(addressResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
