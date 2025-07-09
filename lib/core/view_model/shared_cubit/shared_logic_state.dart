part of 'shared_logic_cubit.dart';

@immutable
sealed class SharedLogicState {}

final class SharedLogicInitial extends SharedLogicState {}
final class AddFavoritesSuccess extends SharedLogicState {}

final class AddFavoritesLoading extends SharedLogicState {}

final class AddFavoritesFailure extends SharedLogicState{
  final String errorMessage;

  AddFavoritesFailure({required this.errorMessage});
}
///remove
/*final class RemoveFavoritesSuccess extends SharedLogicState {}

final class RemoveFavoritesLoading extends SharedLogicState {}

final class RemoveFavoritesFailure extends SharedLogicState{
  final String errorMessage;

  RemoveFavoritesFailure({required this.errorMessage});
}*/