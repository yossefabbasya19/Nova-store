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
import 'package:ecommerce_app/features/auth/data/repo/auth_repo.dart';

class AuthRepoImple extends AuthRepo {
  final AuthDataSource dataSource;

  AuthRepoImple({required this.dataSource});

  Future<Either<Failure, SignupResponse>> signUp(
      SignupRequest signupRequest) async {
    return await dataSource.signUp(signupRequest);
  }

  Future<Either<Failure, SigninResponse>> signin(
      SigninRequest signinRequest) async {
    return await dataSource.signin(signinRequest);
  }

  @override
  Future<Either<Failure, String>> forgetPassword(String email) async {
    try {
      var response = await ApiService.post(
          ApiConstant.forgetPasswordEndpoint, {"email": email});
      return Right(response["message"]);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> verifyCode(String otp) async {
    try {
      var response = await ApiService.post(
          ApiConstant.verifyResetPasswordEndpoint, {"resetCode": otp});
      return Right(response["status"]);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email, String newPassword) async{
    try {
      var response = await ApiService.put(
          ApiConstant.resetPasswordEndpoint, {
        "email":email,
        "newPassword": newPassword
      });
      return Right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExption(e));
      }
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
