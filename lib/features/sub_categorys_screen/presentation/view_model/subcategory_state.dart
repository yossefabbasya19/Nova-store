part of 'subcategory_cubit.dart';

@immutable
sealed class SubcategoryState {}

final class SubcategoryInitial extends SubcategoryState {}
final class SubcategoryLoading extends SubcategoryState {}
final class SubcategorySuccess extends SubcategoryState {}
final class SubcategoryFailure extends SubcategoryState {
  final String errorMessage;

  SubcategoryFailure({required this.errorMessage});
}
