import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/user_address/data/model/Address_response.dart';

abstract class UserAddressDataSource {
  Future<Either<Failure,AddressResponse>>getAllUserAddress();
}