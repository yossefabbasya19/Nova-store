import 'package:ecommerce_app/core/helper/snack_bar.dart';
import 'package:ecommerce_app/core/model/product_dm/Data.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/view_model/shared_cubit/shared_logic_cubit.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_source/favorites_api_data_source.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/repo/favorites_repo_imple.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/view_model/favorites_cubit.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/views/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late FavoritesCubit favoritesCubit;

  @override
  void initState() {
    favoritesCubit = FavoritesCubit(
        FavoritesRepoImple(favoritesDataSource: FavoritesApiDataSource()));
    getFavorites();
    super.initState();
  }

  getFavorites() async {
    await favoritesCubit.getAllFavorites();
  }

  List<ProductDetailsDM> favoritesProduct = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: favoritesCubit,
      child: BlocBuilder<SharedLogicCubit, SharedLogicState>(
        builder: (context, state) {
          if(state is AddFavoritesSuccess ){
            getFavorites();
          }
          return BlocConsumer<FavoritesCubit, FavoritesState>(
            listener: (context, state) {
              if (state is FavoritesFailure) {
                snackBar(context, state.errorMessage);
              } else if (state is FavoritesSuccess) {
                favoritesProduct = state.favoritesProduct;
              }
            },
            builder: (context, state) {
              if (state is FavoritesLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.darkBlue,
                  ),
                );
              }
              return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
                  child: ListView.builder(
                    itemCount:
                    favoritesProduct.isNotEmpty ? favoritesProduct.length : 1,
                    itemBuilder: (context, index) {
                      return favoritesProduct.isNotEmpty
                          ? Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: AppSize.s12.h),
                        child: FavoriteItem(
                            onTap: () {
                              setState(() {

                              });
                            },
                            product: favoritesProduct[index]),
                      )
                          : Center(
                        child: Text("FavoriteList is empty"),
                      );
                    },
                  ));
            },
          );
        },
      ),
    );
  }
}
