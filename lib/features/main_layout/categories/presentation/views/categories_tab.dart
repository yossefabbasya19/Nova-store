import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/helper/snack_bar.dart';
import 'package:ecommerce_app/core/model/category_dm/category_details_dm.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/view_model/category_tab_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/views/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  late CategoryTabCubit categoryTabCubit;

  List<CategoryDetailsDm> category = [];

  @override
  void initState() {
    categoryTabCubit = getIt<CategoryTabCubit>();
    loadData();
    super.initState();
  }

  loadData() async {
    await categoryTabCubit.getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: categoryTabCubit,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: BlocConsumer<CategoryTabCubit, CategoryTabState>(
          listener: (context, state) {
            if (state is CategoryTabFailure) {
              snackBar(context, state.errorMessage);
            } else if (state is CategoryTabSuccess) {
              category = categoryTabCubit.categorys;
            }
          },
          builder: (context, state) {
            if (state is CategoryTabLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.darkBlue,
                ),
              );
            }
            return Row(
              children: [
                CategoriesList(
                  categoryTabCubit: categoryTabCubit,
                  categoryDetailsDm: category,
                ),
                SizedBox(
                  width: AppSize.s16,
                ),
                SubCategoriesList(
                  categoryTabCubit: categoryTabCubit,
                  categoryDetailsDm: category[categoryTabCubit.selectedIndex],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
