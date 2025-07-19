import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/auth/data/model/signin_request.dart';
import 'package:ecommerce_app/features/auth/data/model/signin_response.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_request.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_response.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignupResponse>> signUp(SignupRequest signupRequest);

  Future<Either<Failure, SigninResponse>> signin(SigninRequest signinRequest);
  Future<Either<Failure, String>> forgetPassword(String email);
  Future<Either<Failure, String>> verifyCode(String otp);
  Future<Either<Failure, void>> resetPassword(String email,String newPassword);

}