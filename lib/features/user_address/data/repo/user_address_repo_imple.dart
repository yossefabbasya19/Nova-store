import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/user_address/data/data_source/user_address_data_source.dart';
import 'package:ecommerce_app/features/user_address/data/model/Address_response.dart';
import 'package:ecommerce_app/features/user_address/data/repo/user_address_repo.dart';

class UserAddressRepoImple extends UserAddressRepo {
  final UserAddressDataSource userAddressDataSource;

  UserAddressRepoImple({required this.userAddressDataSource});

  Future<Either<Failure, AddressResponse>> getAllUserAddress() async {
    return await userAddressDataSource.getAllUserAddress();
  }
}
