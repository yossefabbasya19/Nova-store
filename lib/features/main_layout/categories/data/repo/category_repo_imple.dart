import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/category_dm/category_response.dart';
import 'package:ecommerce_app/core/model/subcategory_dm/Subcategory_dm.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_source/category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/repo/category_repo.dart';

class CategoryRepoImple extends CategoryRepo {
  final CategoryDataSource categoryDataSource;

  CategoryRepoImple({required this.categoryDataSource});

  @override
  Future<Either<Failure, CategoryResponse>> getAllCategory() async {
    return await categoryDataSource.getAllCategory();
  }

  @override
  Future<Either<Failure, SubcategoryResponseDm>> getSubCategory(
      String categoryID) async{
    return await categoryDataSource.getSubCategory(categoryID);
  }
}
