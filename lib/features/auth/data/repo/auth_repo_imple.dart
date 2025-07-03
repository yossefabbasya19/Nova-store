import 'package:dartz/dartz.dart';
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
}
