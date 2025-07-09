import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/model/wash_list_request.dart';

abstract class AddFavoritesDataSource {
  Future<Either<Failure,void>>addFavorites(WashListRequest washListRequest);
  Future<Either<Failure,void>>removeFavorites(String productID);

}