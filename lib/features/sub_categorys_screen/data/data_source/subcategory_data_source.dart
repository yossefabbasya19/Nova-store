import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/product_dm/Product_response.dart';

abstract class SubcategoryDataSource {
  Future<Either<Failure, ProductResponse>> getProductBySubCategory(
      String subCategoryID) ;
}
