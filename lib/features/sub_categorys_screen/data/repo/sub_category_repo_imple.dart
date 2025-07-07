import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/product_dm/Product_response.dart';
import 'package:ecommerce_app/features/sub_categorys_screen/data/data_source/subcategory_data_source.dart';
import 'package:ecommerce_app/features/sub_categorys_screen/data/repo/sub_category_repo.dart';

 class SubCategoryRepoImple extends SubCategoryRepo {
   final SubcategoryDataSource subcategoryDataSource ;

  SubCategoryRepoImple({required this.subcategoryDataSource});
  Future<Either<Failure, ProductResponse>> getProductBySubCategory(
      String subCategoryID) async{
    return await subcategoryDataSource.getProductBySubCategory(subCategoryID);
  }
}