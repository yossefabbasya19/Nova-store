import 'package:ecommerce_app/features/main_layout/categories/data/data_source/category_api_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/repo/category_repo_imple.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/view_model/category_tab_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_source/home_api_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/repo/home_repo_imple.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/view_model/home_cubit.dart';
import 'package:ecommerce_app/features/product_details/data/data_source/product_details_api_data_source.dart';
import 'package:ecommerce_app/features/product_details/data/repo/product_details_repo.dart';
import 'package:ecommerce_app/features/product_details/data/repo/product_details_repo_imple.dart';
import 'package:ecommerce_app/features/product_details/presentation/view_model/product_details_cubit.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/products_screen_api_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/repo/products_screen_repo_impe.dart';
import 'package:ecommerce_app/features/products_screen/presentation/view_model/products_cubit.dart';
import 'package:ecommerce_app/features/sub_categorys_screen/data/data_source/sub_category_api_data_source.dart';
import 'package:ecommerce_app/features/sub_categorys_screen/data/repo/sub_category_repo_imple.dart';
import 'package:ecommerce_app/features/sub_categorys_screen/presentation/view_model/subcategory_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HomeCubit>(
      HomeCubit(HomeRepoImple(dataSource: HomeApiDataSource())));
  getIt.registerSingleton<ProductsCubit>(ProductsCubit(ProductsScreenRepoImpe(
      productsScreenDataSource: ProductsScreenApiDataSource())));
  getIt.registerSingleton<CategoryTabCubit>(CategoryTabCubit(
      CategoryRepoImple(categoryDataSource: CategoryApiDataSource())));
  getIt.registerSingleton<SubcategoryCubit>(SubcategoryCubit(
      SubCategoryRepoImple(subcategoryDataSource: SubCategoryApiDataSource())));
  getIt.registerSingleton<ProductDetailsCubit>(ProductDetailsCubit(ProductDetailsRepoImple(
      productDetailsDataSource: ProductDetailsApiDataSource())));
}
