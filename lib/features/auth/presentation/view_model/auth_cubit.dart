import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/data/model/signin_request.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_request.dart';
import 'package:ecommerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  GlobalKey<FormState> formKey = GlobalKey();

  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> signUp(SignupRequest signupRequest) async {
    if (!formKey.currentState!.validate()) return;
    emit(SignupLoading());
    var result = await authRepo.signUp(signupRequest);
    result.fold(
      (failure) {
        emit(SignupFailure(failure.errorMessage));
      },
      (result) {
        emit(SignupSuccess());
      },
    );
  }

  signIn(SigninRequest signinRequest) async {
    if (!formKey.currentState!.validate()) return;
    emit(SigninLoading());
    var result = await authRepo.signin(signinRequest);
    result.fold(
      (failure) {
        emit(SigninFailure(failure.errorMessage));
      },
      (result) {
        emit(SigninSuccess());
      },
    );
  }

  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    var result = await authRepo.forgetPassword(email);
    result.fold(
      (l) {
        emit(ForgetPasswordFailure(l.errorMessage));
      },
      (r) {
        emit(ForgetPasswordSuccess(responseMessage: r));
      },
    );
  }
  Future<void> verifyCode(String otp) async {
    emit(VerifyOtpLoading());
    var result = await authRepo.verifyCode(otp);
    result.fold(
          (l) {
        emit(VerifyOtpFailure(l.errorMessage));
      },
          (r) {
        emit(VerifyOtpSuccess(responseMessage: r));
      },
    );
  }
  Future<void> resetPassword(String email,String newPassword) async {
    emit(ResetPasswordLoading());
    var result = await authRepo.resetPassword(email,newPassword);
    result.fold(
          (l) {
        emit(ResetPasswordFailure(l.errorMessage));
      },
          (r) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
