part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

// total price cal
final class TotalPriceSuccess extends ProductDetailsState {
  final int totalPrice;

  TotalPriceSuccess({required this.totalPrice});
}

final class TotalPriceFailure extends ProductDetailsState {
  final String message;

  TotalPriceFailure({required this.message});
}

final class TotalPriceLoading extends ProductDetailsState {}

// add product to cart
final class AddProductToCartSuccess extends ProductDetailsState {}

final class AddProductToCartFailure extends ProductDetailsState {
  final String errorMessage;

  AddProductToCartFailure({required this.errorMessage});

}

final class AddProductToCartLoading extends ProductDetailsState {}
