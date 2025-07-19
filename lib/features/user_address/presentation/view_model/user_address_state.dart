part of 'user_address_cubit.dart';

@immutable
sealed class UserAddressState {}

final class UserAddressInitial extends UserAddressState {}
final class UserAddressLoading extends UserAddressState {}
final class UserAddressSuccess extends UserAddressState {
  final AddressResponse addressResponse;

  UserAddressSuccess({required this.addressResponse});

}
final class UserAddressFailure extends UserAddressState {
  final String errorMessage;

  UserAddressFailure({required this.errorMessage});
}
