import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/brands_dm/brands_response.dart';
import 'package:ecommerce_app/core/model/category_dm/category_response.dart';

abstract class HomeDataSource {
  Future<Either<Failure,CategoryResponse>>getAllCategory();
  Future<Either<Failure,BrandsResponse>>getBrands({int pageNumber});
}