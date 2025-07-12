part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
//for userName
final class NameUpdateLoading extends ProfileState {}
final class NameUpdateSuccess extends ProfileState {}
final class NameUpdateFailure extends ProfileState {
  final String errorMessage;

  NameUpdateFailure({required this.errorMessage});
}
//for email
final class EmailUpdateLoading extends ProfileState {}
final class EmailUpdateSuccess extends ProfileState {}
final class EmailUpdateFailure extends ProfileState {
  final String errorMessage;

  EmailUpdateFailure({required this.errorMessage});
}
