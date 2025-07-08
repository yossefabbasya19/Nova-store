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
