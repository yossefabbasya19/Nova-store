import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/data/data_source/add_favorited_data_source.dart';
import 'package:ecommerce_app/features/auth/data/model/user_DM.dart';
import 'package:ecommerce_app/features/main_layout/home/data/model/wash_list_request.dart';
import 'package:meta/meta.dart';

part 'shared_logic_state.dart';

class SharedLogicCubit extends Cubit<SharedLogicState> {
  final AddFavoritesDataSource addFavoritesDataSource;

  SharedLogicCubit(this.addFavoritesDataSource) : super(SharedLogicInitial());

  Future<void> addFavorites(WashListRequest washListRequest) async {
    if (UserDm.currentUser!.washList.contains(washListRequest.productID)) {
      return;
    }
    emit(AddFavoritesLoading());
    var response = await addFavoritesDataSource.addFavorites(washListRequest);
    response.fold(
      (failure) {
        emit(AddFavoritesFailure(errorMessage: failure.errorMessage));
      },
      (result) {
        UserDm.currentUser!.washList.add(washListRequest.productID);
        emit(AddFavoritesSuccess());
      },
    );
  }
  Future<void> removeFavorites(String productID) async {

    emit(AddFavoritesLoading());
    var response = await addFavoritesDataSource.removeFavorites(productID);
    response.fold(
          (failure) {
        emit(AddFavoritesFailure(errorMessage: failure.errorMessage));
      },
          (result) {
        UserDm.currentUser!.washList.remove(productID);
        emit(AddFavoritesSuccess());
      },
    );
  }
}
