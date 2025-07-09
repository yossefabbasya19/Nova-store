import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/brands_dm/brands_response.dart';
import 'package:ecommerce_app/core/model/category_dm/category_response.dart';
import 'package:ecommerce_app/core/model/product_dm/Product_response.dart';
import 'package:ecommerce_app/features/main_layout/home/data/model/wash_list_request.dart';

abstract class HomeRepo {
  Future<Either<Failure,CategoryResponse>>getAllCategory();
  Future<Either<Failure,BrandsResponse>>getAllBrands();
  Future<Either<Failure, ProductResponse>> getBestSeller();

}