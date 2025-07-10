import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/model/product_dm/Data.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/repo/favorites_repo.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoritesRepo) : super(FavoritesInitial());
  final FavoritesRepo favoritesRepo;

  Future<void> getAllFavorites() async {
    emit(FavoritesLoading());
    var result = await favoritesRepo.getAllFavorites();
    result.fold(
      (failure) {
        emit(FavoritesFailure(errorMessage: failure.errorMessage));
      },
      (r) {
        emit(FavoritesSuccess(favoritesProduct: r.data!));
      },
    );
  }
}
