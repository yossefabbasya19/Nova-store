part of 'category_tab_cubit.dart';

@immutable
sealed class CategoryTabState {}

final class CategoryTabInitial extends CategoryTabState {}
final class CategoryTabLoading extends CategoryTabState {}
final class CategoryTabSuccess extends CategoryTabState {
}
final class CategoryTabFailure extends CategoryTabState {
  final String errorMessage;

  CategoryTabFailure({required this.errorMessage});

}
final class SubCategoryTabLoading extends CategoryTabState {}
final class SubCategoryTabSuccess extends CategoryTabState {
}
final class SubCategoryTabFailure extends CategoryTabState {
  final String errorMessage;

  SubCategoryTabFailure({required this.errorMessage});
}