import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_source/favorites_data_source.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/model/Favorites_response.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/repo/favorites_repo.dart';

class FavoritesRepoImple extends FavoritesRepo {
  final FavoritesDataSource favoritesDataSource;

  FavoritesRepoImple({required this.favoritesDataSource});

  @override
  Future<Either<Failure, FavoritesResponse>> getAllFavorites() async {
    return await favoritesDataSource.getAllFavorites();
  }
}
