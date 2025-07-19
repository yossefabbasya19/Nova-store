import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/model/Favorites_response.dart';

abstract class FavoritesDataSource {
  Future<Either<Failure,FavoritesResponse>>getAllFavorites();
}