part of 'main_layout_cubit.dart';

@immutable
sealed class MainLayoutState {}

final class MainLayoutInitial extends MainLayoutState {}
final class MainLayoutSuccess extends MainLayoutState {}
final class MainLayoutFailure extends MainLayoutState {
  final String errorMessage;

  MainLayoutFailure({required this.errorMessage});
}
final class MainLayoutLoading extends MainLayoutState {}
