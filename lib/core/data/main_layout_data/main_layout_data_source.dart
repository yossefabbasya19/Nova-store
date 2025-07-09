import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/data/main_layout_data/model/verfiy_token_response/Verfiy_token_respose.dart';
import 'package:ecommerce_app/core/failure/failure.dart';

abstract class MainLayoutDataSource {
  Future<Either<Failure,void>>verifyToken();
}