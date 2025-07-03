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
