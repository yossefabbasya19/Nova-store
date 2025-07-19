import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/brands_dm/brands_response.dart';
import 'package:ecommerce_app/core/model/category_dm/category_response.dart';
import 'package:ecommerce_app/core/model/product_dm/Product_response.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_source/home_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/model/wash_list_request.dart';
import 'package:ecommerce_app/features/main_layout/home/data/repo/home_repo.dart';

class HomeRepoImple extends HomeRepo {
  final HomeDataSource dataSource;

  HomeRepoImple({required this.dataSource});

  @override
  Future<Either<Failure, CategoryResponse>> getAllCategory() async {
    return await dataSource.getAllCategory();
  }

  @override
  Future<Either<Failure, BrandsResponse>> getAllBrands(
      {int pageNumber = 1}) async {
    return await dataSource.getBrands();
  }

  @override
  Future<Either<Failure, ProductResponse>> getBestSeller() async {
    return await dataSource.getBestSeller();
  }


}
