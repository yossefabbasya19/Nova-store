part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

//categoryBrands
final class GetAllCategorySuccess extends HomeState {
  final List<CategoryDetailsDm> categorys;

  GetAllCategorySuccess({required this.categorys});
}

final class GetAllCategoryLoading extends HomeState {}

final class GetAllCategoryFailure extends HomeState {
  final String errorMessage;

  GetAllCategoryFailure({required this.errorMessage});
}

//brands
final class GetAllBrandsSuccess extends HomeState {
  final List<BrandsDetailsDm> brands;

  GetAllBrandsSuccess({required this.brands});
}

final class GetAllBrandsLoading extends HomeState {}

final class GetAllBrandsFailure extends HomeState {
  final String errorMessage;

  GetAllBrandsFailure({required this.errorMessage});
}

//best seller product
final class GetBestSellerSuccess extends HomeState {
  final List<ProductDetailsDM> products;

  GetBestSellerSuccess({required this.products});
}

final class GetBestSellerLoading extends HomeState {}

final class GetBestSellerFailure extends HomeState {
  final String errorMessage;

  GetBestSellerFailure({required this.errorMessage});
}

