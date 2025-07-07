import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/model/product_dm/Data.dart';
import 'package:ecommerce_app/features/products_screen/data/repo/products_screen_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsScreenRepo) : super(ProductsInitial());
  final ProductsScreenRepo productsScreenRepo;

  getProducts(
      {required bool isCategory, String? categoryID, String? brandID}) async {
    emit(ProductsLoading());
    var result = await productsScreenRepo.fetchData(
        isCategory: isCategory, categoryID: categoryID, brandID: brandID);
    result.fold(
      (failure) {
        emit(ProductsFailure(errorMessage: failure.errorMessage));
      },
      (products) {
        emit(ProductsSuccess(products: products.products!));
      },
    );
  }
}
