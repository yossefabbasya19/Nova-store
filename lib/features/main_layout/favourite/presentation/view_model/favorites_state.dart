part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesSuccess extends FavoritesState {
  final List<ProductDetailsDM> favoritesProduct;

  FavoritesSuccess({required this.favoritesProduct});
}

final class FavoritesFailure extends FavoritesState {
  final String errorMessage;

  FavoritesFailure({required this.errorMessage});
}
