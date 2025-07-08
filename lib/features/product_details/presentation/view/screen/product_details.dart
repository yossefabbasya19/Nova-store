import 'package:ecommerce_app/core/model/product_dm/Data.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/product_details/presentation/view/widgets/product_color.dart';
import 'package:ecommerce_app/features/product_details/presentation/view/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/view/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/view/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/view/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/view/widgets/product_size.dart';
import 'package:ecommerce_app/features/product_details/presentation/view/widgets/product_slider.dart';
import 'package:ecommerce_app/features/product_details/presentation/view_model/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  final ProductDetailsDM productDetailsDM;

  const ProductDetails({super.key, required this.productDetailsDM});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primary,
              )),
        ],
      ),
      body: BlocProvider(
        create: (context) => ProductDetailsCubit(),
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductSlider(
                        items: widget.productDetailsDM.images!.map(
                          (e) {
                            return ProductItem(imageUrl: e);
                          },
                        ).toList(),
                        initialIndex: 0),
                    SizedBox(
                      height: 24.h,
                    ),
                    ProductLabel(
                        productName: widget.productDetailsDM.title!,
                        productPrice:
                            "${widget.productDetailsDM.price!.toString()} \$"),
                    SizedBox(
                      height: 16.h,
                    ),
                    ProductRating(
                      quantity: widget.productDetailsDM.quantity!,
                        price: widget.productDetailsDM.price!,
                        productBuyers: widget.productDetailsDM.sold!.toString(),
                        productRating:
                            "${widget.productDetailsDM.ratingsAverage}(${widget.productDetailsDM.ratingsQuantity})"),
                    SizedBox(
                      height: 16.h,
                    ),
                    ProductDescription(
                        productDescription: widget.productDetailsDM.description!),
                    ProductSize(
                      size: const [35, 38, 39, 40],
                      onSelected: () {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text('Color',
                        style:
                            getMediumStyle(color: ColorManager.appBarTitleColor)
                                .copyWith(fontSize: 18.sp)),
                    ProductColor(color: const [
                      Colors.red,
                      Colors.blueAccent,
                      Colors.green,
                      Colors.yellow,
                    ], onSelected: () {}),
                    SizedBox(
                      height: 48.h,
                    ),
                    BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
                      listener: (context, state) {
                        if(state is TotalPriceSuccess){
                          totalPrice = state.totalPrice;
                        }
                      },
                      builder: (context, state) {
                        return Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Total price',
                                  style: getMediumStyle(
                                      color: ColorManager.primary
                                          .withOpacity(.6))
                                      .copyWith(fontSize: 18.sp),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text('EGP $totalPrice',
                                    style: getMediumStyle(
                                        color:
                                        ColorManager.appBarTitleColor)
                                        .copyWith(fontSize: 18.sp))
                              ],
                            ),
                            SizedBox(
                              width: 33.w,
                            ),
                            Expanded(
                              child: CustomElevatedButton(
                                label: 'Add to cart',
                                onTap: () {},
                                prefixIcon: Icon(
                                  Icons.add_shopping_cart_outlined,
                                  color: ColorManager.white,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    )
                  ]),
            ),
          );
        }),
      ),
    );
  }
}
