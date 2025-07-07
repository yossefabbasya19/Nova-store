import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/product_dm/Product_response.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/products_screen_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/repo/products_screen_repo.dart';

class ProductsScreenRepoImpe extends ProductsScreenRepo {
  final ProductsScreenDataSource productsScreenDataSource;

  ProductsScreenRepoImpe({required this.productsScreenDataSource});

  @override
  Future<Either<Failure, ProductResponse>> fetchData(
      {required bool isCategory, String? categoryID, String? brandID}) async {
    return await productsScreenDataSource.fetchData(
        isCategory: isCategory, brandID: brandID, categoryID: categoryID);
  }
}
