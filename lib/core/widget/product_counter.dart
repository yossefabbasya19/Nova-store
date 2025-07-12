import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProductCounter extends StatelessWidget {
  final bool loading;
  final int productCounter;
  final void Function(int) add;
  final void Function(int) remove;

  const ProductCounter({super.key,
    required this.add,
    required this.remove,
    required this.productCounter, required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                remove.call(productCounter);
              },
              child: Icon(
                Icons.remove_circle_outline,
                size: 20.w,
                color: ColorManager.white,
              )),
          SizedBox(
            width: 18.w,
          ),
          loading? SizedBox(
            height: MediaQuery.sizeOf(context).height*0.01,
            width: MediaQuery.sizeOf(context).width*0.009,
            child: LoadingAnimationWidget.fourRotatingDots(
              color: Colors.white,
              size: 10,
            ),
          ):Text(
            '$productCounter',
            style: getMediumStyle(color: ColorManager.white)
                .copyWith(fontSize: 18.sp),
          ),
          SizedBox(
            width: 18.w,
          ),
          InkWell(
              onTap: () {
                add.call(productCounter);
              },
              child: Icon(
                Icons.add_circle_outline,
                color: ColorManager.white,
                size: 20.w,
              )),
        ],
      ),
    );
  }
}
