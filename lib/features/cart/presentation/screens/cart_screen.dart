import 'package:ecommerce_app/core/helper/snack_bar.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/cart/data/model/Cart_data_response.dart';
import 'package:ecommerce_app/features/cart/data/model/Products.dart';
import 'package:ecommerce_app/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartDataResponse? productsResponse;
  late int productCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
        //
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartFailure) {
            snackBar(context, state.errorMessage);
          } else if (state is CartSuccess) {
            productsResponse = state.products;
          }
        },
        builder: (context, state) {
          if (state is CartLoading && productsResponse == null) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorManager.darkBlue,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      List<Products> products =
                          productsResponse!.data!.products!;
                      productCount = products[index].count!;
                      return CartItemWidget(
                        loading: state is IncrementItemLoading ||state is CartLoading,
                        imagePath: products[index].product!.imageCover!,
                        title: products[index].product!.title!,
                        price: products[index].price!,
                        quantity: productCount,
                        onDeleteTap: () async {
                          await BlocProvider.of<CartCubit>(context)
                              .removeSpecificItemCart(
                                  products[index].product!.id!);
                        },
                        onDecrementTap: (value) async {
                          await BlocProvider.of<CartCubit>(context)
                              .decrementProductCount(products[index].count!,
                                  products[index].product!.id!);
                        },
                        onIncrementTap: (value) async {
                          await BlocProvider.of<CartCubit>(context)
                              .incrementProductCount(products[index].count!,
                                  products[index].product!.id!);
                        },
                        size: 40,
                        color: Colors.black,
                        colorName: 'Black',
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSize.s12.h),
                    itemCount: productsResponse!.data!.products!.length,
                  ),
                ),
                TotalPriceAndCheckoutBotton(
                  totalPrice: productsResponse!.data!.totalCartPrice!,
                  checkoutButtonOnTap: () {},
                ),
                SizedBox(height: 10.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
