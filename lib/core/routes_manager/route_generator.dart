import 'package:ecommerce_app/core/data/main_layout_data/main_layout_api_data_source.dart';
import 'package:ecommerce_app/core/model/product_dm/Data.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/view_model/main_layout_cubit/main_layout_cubit.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_api_data_source.dart';
import 'package:ecommerce_app/features/auth/data/repo/auth_repo_imple.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:ecommerce_app/features/cart/data/data_source/cart_api_data_source.dart';
import 'package:ecommerce_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:ecommerce_app/features/main_layout/main_layout.dart';
import 'package:ecommerce_app/features/product_details/presentation/view/screen/product_details.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/products_screen_api_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/model/categoryId_and_brandId_dm.dart';
import 'package:ecommerce_app/features/products_screen/data/repo/products_screen_repo_impe.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/products_screen.dart';
import 'package:ecommerce_app/features/products_screen/presentation/view_model/products_cubit.dart';
import 'package:ecommerce_app/features/sub_categorys_screen/presentation/views/subcategoy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.subcategoryScreen:
        return MaterialPageRoute(
          builder: (context) =>
              SubcategoryScreen(subCategoryID: settings.arguments as String),
        );
      case Routes.cartRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CartCubit(CartApiDataSource())..getUserCart(),
                  child: CartScreen(),
                ));
      case Routes.mainRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      MainLayoutCubit(MainLayoutApiDataSource()),
                  child: MainLayout(),
                ));

      case Routes.productsScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ProductsCubit(ProductsScreenRepoImpe(
                      productsScreenDataSource: ProductsScreenApiDataSource())),
                  child: ProductsScreen(
                    categoryIdAndBrandIdDm:
                        settings.arguments as CategoryIdAndBrandIdDm,
                  ),
                ));

      case Routes.productDetails:
        return MaterialPageRoute(
            builder: (_) => ProductDetails(
                  productDetailsDM: settings.arguments as ProductDetailsDM,
                ));

      case Routes.signInRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) =>
                    AuthCubit(AuthRepoImple(dataSource: AuthApiDataSource())),
                child: const SignInScreen()));

      case Routes.signUpRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) =>
                    AuthCubit(AuthRepoImple(dataSource: AuthApiDataSource())),
                child: const SignUpScreen()));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
