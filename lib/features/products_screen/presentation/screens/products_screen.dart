import 'package:ecommerce_app/core/helper/snack_bar.dart';
import 'package:ecommerce_app/core/model/product_dm/Data.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/products_screen/data/model/categoryId_and_brandId_dm.dart';
import 'package:ecommerce_app/features/products_screen/presentation/view_model/products_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatefulWidget {
final CategoryIdAndBrandIdDm categoryIdAndBrandIdDm;
  const ProductsScreen({super.key,required this.categoryIdAndBrandIdDm});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductDetailsDM> products = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.categoryIdAndBrandIdDm.categoryID);
    print(widget.categoryIdAndBrandIdDm.brandID);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          children: [
            BlocConsumer<ProductsCubit, ProductsState>(
              listener: (context, state) {
                if (state is ProductsFailure) {
                  snackBar(context, state.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  products.addAll(state.products);
                  return products.isNotEmpty
                      ? Expanded(
                          child: GridView.builder(
                            itemCount: products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 7 / 9,
                            ),
                            itemBuilder: (context, index) {
                              return CustomProductWidget(
                                  image: products[index].imageCover!,
                                  title: products[index].title!,
                                  price: products[index].price!.toDouble(),
                                  rating: products[index].ratingsAverage!,
                                  discountPercentage: 20,
                                  height: height,
                                  width: width,
                                  description: products[index].description!);
                            },
                            scrollDirection: Axis.vertical,
                          ),
                        )
                      : Center(
                          child: Text(
                            "no product for this category",
                            style:
                                getSemiBoldStyle(color: ColorManager.darkBlue),
                          ),
                        );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.darkBlue,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void loadData() async {
    widget.categoryIdAndBrandIdDm.categoryID != null
        ? await BlocProvider.of<ProductsCubit>(context)
            .getProducts(isCategory: true, categoryID: widget.categoryIdAndBrandIdDm.categoryID)
        : await BlocProvider.of<ProductsCubit>(context)
            .getProducts(isCategory: false, brandID: widget.categoryIdAndBrandIdDm.brandID);
  }
}
