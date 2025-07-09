import 'dart:async';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/helper/snack_bar.dart';
import 'package:ecommerce_app/core/model/brands_dm/brands_details_dm.dart';
import 'package:ecommerce_app/core/model/category_dm/category_details_dm.dart';
import 'package:ecommerce_app/core/model/product_dm/Data.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/widget/product_card.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/view/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/view/widgets/custom_category_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/view_model/home_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;
  List<CategoryDetailsDm> categorys = [];
  List<BrandsDetailsDm> brands = [];
  List<ProductDetailsDM> products = [];
  late HomeCubit homeCubit;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    homeCubit = getIt<HomeCubit>();
    loadCategory();
    super.initState();
    _startImageSwitching();
  }

  loadCategory() async {
    await homeCubit.getAllCategory();
    await homeCubit.getAllBrands();
    await homeCubit.getBestSeller();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeCubit,
      child: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAdsWidget(
                adsImages: adsImages,
                currentIndex: _currentIndex,
                timer: _timer,
              ),
              Column(
                children: [
                  CustomSectionBar(sectionNname: 'Categories', function: () {}),
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {
                      if (state is GetAllCategoryFailure) {
                        snackBar(context, state.errorMessage);
                      } else if (state is GetAllCategorySuccess) {
                        categorys.addAll(state.categorys);
                      }
                    },
                    builder: (context, state) {
                      return state is GetAllCategoryLoading
                          ? Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.darkBlue,
                        ),
                      )
                          : SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryWidget(
                              categoryDetailsDm: categorys[index],
                            );
                          },
                          itemCount: categorys.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 12.h),
                  CustomSectionBar(sectionNname: 'Brands', function: () {}),
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {
                      if (state is GetAllBrandsFailure) {
                        snackBar(context, state.errorMessage);
                      } else if (state is GetAllBrandsSuccess) {
                        brands.addAll(state.brands);
                      }
                    },
                    builder: (context, state) {
                      return state is GetAllCategoryLoading
                          ? Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.darkBlue,
                        ),
                      )
                          : SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomBrandWidget(
                              brandsDetailsDm: brands[index],
                            );
                          },
                          itemCount: brands.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      );
                    },
                  ),
                  CustomSectionBar(
                    sectionNname: 'Most Selling Products',
                    function: () {},
                  ),
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {
                     if(state is GetBestSellerFailure){
                       snackBar(context, state.errorMessage);
                     }else if(state is GetBestSellerSuccess){
                       products.addAll(state.products);
                     }
                    },
                    builder: (context, state) {
                      return state is GetBestSellerLoading?Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.darkBlue,
                        ),
                      ):SizedBox(
                        child: SizedBox(
                          height: 310.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return  Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: CustomProductWidget(

                                  width: MediaQuery.sizeOf(context).width,
                                  height: MediaQuery.sizeOf(context).height,
                                 productDetailsDM: products[index],
                                ),
                              );
                            },
                            itemCount: products.length,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 12.h),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
