import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/model/brands_dm/brands_details_dm.dart';
import 'package:ecommerce_app/core/model/category_dm/category_details_dm.dart';
import 'package:ecommerce_app/features/main_layout/home/data/repo/home_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  ScrollController brandsScrollController = ScrollController();
  int brandPage = 1;
  Future<void> getAllCategory() async {
    emit(GetAllCategoryLoading());
    var result = await homeRepo.getAllCategory();
    result.fold(
      (failure) {
        emit(GetAllCategoryFailure(errorMessage: failure.errorMessage));
      },
      (categoryResponse) {
        emit(GetAllCategorySuccess(categorys: categoryResponse.categorys));
      },
    );
  }

  Future<void> getAllBrands() async {
    emit(GetAllBrandsLoading());
    var result = await homeRepo.getAllBrands(pageNumber: brandPage);
    result.fold(
      (failure) {
        emit(GetAllBrandsFailure(errorMessage: failure.errorMessage));
      },
      (brandsResponse) {
        emit(GetAllBrandsSuccess(brands: brandsResponse.brandsDetailsDm));
      },
    );
  }
  brandsPagination(){
    brandsScrollController.addListener(() async{
      if(brandsScrollController.position.atEdge){
        bool isTop = brandsScrollController.position.pixels!=0;
        if(isTop){
          brandPage ++;
          await getAllBrands();
        }
      }
    },);

  }
}
