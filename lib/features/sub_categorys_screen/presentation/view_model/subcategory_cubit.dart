import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/model/product_dm/Data.dart';
import 'package:ecommerce_app/features/sub_categorys_screen/data/repo/sub_category_repo.dart';
import 'package:meta/meta.dart';

part 'subcategory_state.dart';

class SubcategoryCubit extends Cubit<SubcategoryState> {
  SubcategoryCubit(this.subCategoryRepo) : super(SubcategoryInitial());
  final SubCategoryRepo subCategoryRepo;
  List<ProductDetailsDM>products=[];
  getProductBySubcategory(String subCategoryID)async{
    emit(SubcategoryLoading());
  var result =   await subCategoryRepo.getProductBySubCategory(subCategoryID);
  result.fold((failure) {
    emit(SubcategoryFailure(errorMessage: failure.errorMessage));
  }, (result) {
    products = result.products!;
    emit(SubcategorySuccess());
  },);
  }
}
