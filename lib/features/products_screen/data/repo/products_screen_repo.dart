import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/model/product_dm/Product_response.dart';

abstract class ProductsScreenRepo {
  Future<Either<Failure,ProductResponse>>fetchData(
      {required bool isCategory,String? categoryID, String? brandID});

}