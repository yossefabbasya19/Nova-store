import 'package:ecommerce_app/core/model/category_dm/category_details_dm.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/products_screen/data/model/categoryId_and_brandId_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryWidget extends StatelessWidget {
  final CategoryDetailsDm categoryDetailsDm;

  const CustomCategoryWidget({super.key, required this.categoryDetailsDm});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.productsScreenRoute,
            arguments:
                CategoryIdAndBrandIdDm(categoryID: categoryDetailsDm.id));
      },
      child: Column(
        children: [
          // CachedNetworkImage(
          //   height: 100,
          //   width: 100,
          //   fit: BoxFit.cover,
          //   imageUrl: ImageAssets.categoryHomeImage,
          //   placeholder: (context, url) =>
          //       const Center(child: CircularProgressIndicator()),
          //   errorWidget: (context, url, error) =>
          //       const Center(child: Icon(Icons.error)),
          //   imageBuilder: (context, imageProvider) {
          //     return Container(
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         image: DecorationImage(
          //           image: imageProvider,
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     );
          //   },
          // ),

          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                categoryDetailsDm.image!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Image(image: AssetImage(ImageAssets.noImage)),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          FittedBox(
            child: Text(
              categoryDetailsDm.name!,
              style: getRegularStyle(
                  color: ColorManager.darkBlue, fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
