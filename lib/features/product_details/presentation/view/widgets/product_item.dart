import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/api_service/api_constant/api_constant.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.imageUrl, this.onTap});
  final String imageUrl;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl.contains(AppConstants.apiBase)?imageUrl:"${AppConstants.apiBase}$imageUrl",
    );
  }
}
