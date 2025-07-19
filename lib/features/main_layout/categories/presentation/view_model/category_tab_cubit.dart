import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/model/category_dm/category_details_dm.dart';
import 'package:ecommerce_app/core/model/subcategory_dm/Data.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/repo/category_repo.dart';
import 'package:meta/meta.dart';

part 'category_tab_state.dart';

class CategoryTabCubit extends Cubit<CategoryTabState> {
  CategoryTabCubit(this.categoryRepo) : super(CategoryTabInitial());
  final CategoryRepo categoryRepo;
  List<CategoryDetailsDm> categorys = [];

  Future<void> getAllCategory() async {
    emit(CategoryTabLoading());
    var result = await categoryRepo.getAllCategory();
    result.fold(
      (failure) {
        emit(CategoryTabFailure(errorMessage: failure.errorMessage));
      },
      (categoryResponse) {
        categorys = categoryResponse.categorys;
        emit(CategoryTabSuccess());
      },
    );
  }

  int selectedIndex = 0;

  onItemClick(int index) async{
    selectedIndex = index;
    await getSubCategory(categorys[selectedIndex].id!);
    emit(CategoryTabSuccess());
  }
  List<SubcategoryDetails> subCategory=[];
  Future<void> getSubCategory(String categoryID) async {
    emit(SubCategoryTabLoading());
    var result = await categoryRepo.getSubCategory(categoryID);
    result.fold(
      (failure) {
        emit(SubCategoryTabFailure(errorMessage: failure.errorMessage));
      },
      (subCategorys) {
        subCategory = subCategorys.data!;
        emit(SubCategoryTabSuccess());
      },
    );
  }
}
