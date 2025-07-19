import 'package:ecommerce_app/core/model/category_dm/category_details_dm.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/view_model/category_tab_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  final CategoryTabCubit categoryTabCubit;
  final List<CategoryDetailsDm> categoryDetailsDm;

  const CategoriesList(
      {super.key,
      required this.categoryTabCubit,
      required this.categoryDetailsDm});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: ColorManager.containerGray,
        border: Border(
            top: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withOpacity(0.3)),
            left: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withOpacity(0.3)),
            bottom: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withOpacity(0.3))),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s12),
          bottomLeft: Radius.circular(AppSize.s12),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s12),
          bottomLeft: Radius.circular(AppSize.s12),
        ),
        child: ListView.builder(
            itemCount: widget.categoryDetailsDm.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                  index,
                  widget.categoryDetailsDm[index].name!,
                  widget.categoryTabCubit.selectedIndex == index,
                  widget.categoryTabCubit.onItemClick);
            }),
      ),
    ));
  }
}
