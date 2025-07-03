import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/api_service/api_service.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:ecommerce_app/features/auth/data/model/signin_request.dart';
import 'package:ecommerce_app/features/auth/data/model/signin_response.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_request.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_response.dart';
import 'package:ecommerce_app/features/auth/data/model/user_DM.dart';

class AuthApiDataSource extends AuthDataSource {
  Future<Either<Failure, SignupResponse>> signUp(
      SignupRequest signupRequest) async {
    try {
      var response = await ApiService.post(
          ApiConstant.signupEndpoint, signupRequest.toJson());
     SignupResponse signupResponse =  SignupResponse.fromJson(response);
      UserDm.currentUser = signupResponse.user;
      return Right(signupResponse);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, SigninResponse>> signin(
      SigninRequest signinRequest) async {
    try {
      var response = await ApiService.post(
          ApiConstant.signinEndpoint, signinRequest.toJson());
      SigninResponse signinResponse = SigninResponse.fromJson(response);
      UserDm.currentUser = signinResponse.user;
      return Right(signinResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
