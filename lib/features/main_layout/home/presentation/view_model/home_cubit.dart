import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/model/brands_dm/brands_details_dm.dart';
import 'package:ecommerce_app/core/model/category_dm/category_details_dm.dart';
import 'package:ecommerce_app/core/model/product_dm/Data.dart';
import 'package:ecommerce_app/core/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/features/main_layout/home/data/model/wash_list_request.dart';
import 'package:ecommerce_app/features/main_layout/home/data/repo/home_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

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
    var result = await homeRepo.getAllBrands();
    result.fold(
      (failure) {
        emit(GetAllBrandsFailure(errorMessage: failure.errorMessage));
      },
      (brandsResponse) {
        emit(GetAllBrandsSuccess(brands: brandsResponse.brandsDetailsDm));
      },
    );
  }

  Future<void> getBestSeller() async {
    emit(GetBestSellerLoading());
    var result = await homeRepo.getBestSeller();
    result.fold(
      (failure) {
        emit(GetBestSellerFailure(errorMessage: failure.errorMessage));
      },
      (product) {
        emit(GetBestSellerSuccess(products: product.products!));
      },
    );
  }


}
