import 'package:ecommerce_app/core/helper/snack_bar.dart';
import 'package:ecommerce_app/core/model/category_dm/category_details_dm.dart';
import 'package:ecommerce_app/core/model/subcategory_dm/Data.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/view_model/category_tab_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/views/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatefulWidget {
  final CategoryTabCubit categoryTabCubit;
  final CategoryDetailsDm categoryDetailsDm;

  const SubCategoriesList(
      {super.key,
      required this.categoryDetailsDm,
      required this.categoryTabCubit});

  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    await widget.categoryTabCubit.getSubCategory(widget.categoryDetailsDm.id!);
  }

  List<SubcategoryDetails> subCategory = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryTabCubit, CategoryTabState>(
      listener: (context, state) {
        if (state is SubCategoryTabFailure) {
          snackBar(context, state.errorMessage);
        } else if (state is SubCategoryTabSuccess) {
          subCategory = widget.categoryTabCubit.subCategory;
        }
      },
      builder: (context, state) {
        if (state is SubCategoryTabLoading) {
          return Expanded(
            flex: 2,
            child: Center(
              child: CircularProgressIndicator(
                color: ColorManager.darkBlue,
              ),
            ),
          );
        }
        return subCategory.isNotEmpty
            ? Expanded(
                flex: 2,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Text(
                        widget.categoryDetailsDm.name!,
                        style: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s14),
                      ),
                    ),
                    // the category card
                    SliverToBoxAdapter(
                      child: CategoryCardItem(
                          widget.categoryDetailsDm.name!,
                          ImageAssets.categoryCardImage,
                          goToCategoryProductsListScreen),
                    ),
                    // the grid view of the subcategories
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: subCategory.length,
                          (context, index) => SubCategoryItem(
                              subCategory[index].name!,
                              ImageAssets.subcategoryCardImage,
                              subCategory[index].id!),
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: AppSize.s8,
                          crossAxisSpacing: AppSize.s8,
                        ))
                  ],
                ),
              )
            : Expanded(
                flex: 2,
                child: Center(
                  child: Text("no sub category"),
                ));
      },
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
