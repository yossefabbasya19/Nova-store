import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/data/main_layout_data/main_layout_data_source.dart';
import 'package:meta/meta.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit(this.mainLayoutDataSource) : super(MainLayoutInitial());
  final MainLayoutDataSource mainLayoutDataSource;

  Future<void> checkTokenVerify() async {
    emit(MainLayoutLoading());
    var result = await mainLayoutDataSource.verifyToken();
    result.fold(
      (l) {
        emit(MainLayoutFailure(errorMessage: l.errorMessage));
      },
      (r) {
        emit(MainLayoutSuccess());
      },
    );
  }
}
