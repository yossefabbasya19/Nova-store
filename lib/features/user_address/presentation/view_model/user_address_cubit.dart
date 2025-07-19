import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/user_address/data/model/Address_response.dart';
import 'package:ecommerce_app/features/user_address/data/repo/user_address_repo.dart';
import 'package:meta/meta.dart';

part 'user_address_state.dart';

class UserAddressCubit extends Cubit<UserAddressState> {
  UserAddressCubit(this.userAddressRepo) : super(UserAddressInitial());
  final UserAddressRepo userAddressRepo;
  Future<void> getUserAddress()async{
    emit(UserAddressLoading());
   var result = await userAddressRepo.getAllUserAddress();
   result.fold((l) {
     emit(UserAddressFailure(errorMessage: l.errorMessage));
   }, (r) {
     emit(UserAddressSuccess(addressResponse: r));
   },);
  }
}
