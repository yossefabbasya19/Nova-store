import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/product_dm/Product_response.dart';

abstract class SubCategoryRepo {
  Future<Either<Failure, ProductResponse>> getProductBySubCategory(
      String subCategoryID) ;
}