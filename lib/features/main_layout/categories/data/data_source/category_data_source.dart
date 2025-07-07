import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/category_dm/category_response.dart';
import 'package:ecommerce_app/core/model/subcategory_dm/Subcategory_dm.dart';

abstract class CategoryDataSource {
  Future<Either<Failure, CategoryResponse>> getAllCategory();

  Future<Either<Failure, SubcategoryResponseDm>> getSubCategory(String categoryID);
}
