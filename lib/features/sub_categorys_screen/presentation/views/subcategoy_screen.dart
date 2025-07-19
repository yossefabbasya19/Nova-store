import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/helper/snack_bar.dart';
import 'package:ecommerce_app/core/model/product_dm/Data.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:ecommerce_app/features/sub_categorys_screen/data/data_source/sub_category_api_data_source.dart';
import 'package:ecommerce_app/features/sub_categorys_screen/data/repo/sub_category_repo_imple.dart';
import 'package:ecommerce_app/features/sub_categorys_screen/presentation/view_model/subcategory_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class SubcategoryScreen extends StatefulWidget {
  final String subCategoryID;

  const SubcategoryScreen({super.key, required this.subCategoryID});

  @override
  State<SubcategoryScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<SubcategoryScreen> {
  List<ProductDetailsDM> products = [];
  late SubcategoryCubit subcategoryCubit;

  @override
  void initState() {
    subcategoryCubit = getIt<SubcategoryCubit>();
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: BlocProvider.value(
  value: subcategoryCubit,
  child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: BlocConsumer<SubcategoryCubit, SubcategoryState>(
          listener: (context, state) {
            if (state is SubcategoryFailure) {
              snackBar(context, state.errorMessage);
            } else if (state is SubcategorySuccess) {
              products.addAll(subcategoryCubit.products);
            }
          },
          builder: (context, state) {
            if (state is SubcategoryLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.darkBlue,
                ),
              );
            }
            return products.isNotEmpty?Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 7 / 10,
                    ),
                    itemBuilder: (context, index) {
                      return CustomProductWidget(
                          productDetailsDM: products[index],
                          height: height,
                          width: width,
                          );
                    },
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ],
            ):Center(child: Text("no item for this category"),);
          },
        ),
      ),
),
    );
  }

  void loadData() async {
    await subcategoryCubit.getProductBySubcategory(widget.subCategoryID);
  }
}
