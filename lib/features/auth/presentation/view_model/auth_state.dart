part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//signin
final class SigninLoading extends AuthState {}

final class SigninSuccess extends AuthState {}

final class SigninFailure extends AuthState {
  final String errorMessage;

  SigninFailure(this.errorMessage);
}

//signup
final class SignupLoading extends AuthState {}

final class SignupSuccess extends AuthState {}

final class SignupFailure extends AuthState {
  final String errorMessage;

  SignupFailure(this.errorMessage);
}

//forgetPassword
final class ForgetPasswordLoading extends AuthState {}

final class ForgetPasswordSuccess extends AuthState {
  final String responseMessage;

  ForgetPasswordSuccess({required this.responseMessage});
}

final class ForgetPasswordFailure extends AuthState {
  final String errorMessage;

  ForgetPasswordFailure(this.errorMessage);
}
//verify otp
final class VerifyOtpLoading extends AuthState {}

final class VerifyOtpSuccess extends AuthState {
  final String responseMessage;

  VerifyOtpSuccess({required this.responseMessage});
}

final class VerifyOtpFailure extends AuthState {
  final String errorMessage;

  VerifyOtpFailure(this.errorMessage);
}
//reset password
final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccess extends AuthState {
}

final class ResetPasswordFailure extends AuthState {
  final String errorMessage;

  ResetPasswordFailure(this.errorMessage);
}