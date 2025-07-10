import 'package:ecommerce_app/core/helper/snack_bar.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/core/view_model/main_layout_cubit/main_layout_cubit.dart';
import 'package:ecommerce_app/core/widget/home_screen_app_bar.dart';
import 'package:ecommerce_app/features/auth/data/model/user_DM.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/views/categories_tab.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/views/favourite_screen.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/presentation/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/presentation/view/home_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  void initState() {
    checkVerify();
    super.initState();
  }

  void checkVerify() async {
    await BlocProvider.of<MainLayoutCubit>(context).checkTokenVerify();
  }

  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesTab(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainLayoutCubit, MainLayoutState>(
      listener: (context, state) {
        if (state is MainLayoutFailure) {
          snackBar(context, state.errorMessage);
          SharedPref().removeToken();
          Navigator.pushReplacementNamed(context, Routes.signInRoute);
        }
      },
      builder: (context, state) {
        if (state is MainLayoutLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: ColorManager.darkBlue,
              ),
            ),
          );
        }
        return Scaffold(
          appBar: const HomeScreenAppBar(),
          extendBody: false,
          body: tabs[currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: BottomNavigationBar(
                selectedFontSize: 0,
                currentIndex: currentIndex,
                onTap: (value) => changeSelectedIndex(value),
                backgroundColor: ColorManager.primary,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: ColorManager.primary,
                unselectedItemColor: ColorManager.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  CustomBottomNavBarItem(IconsAssets.icHome, "Home"),
                  CustomBottomNavBarItem(IconsAssets.icCategory, "Category"),
                  CustomBottomNavBarItem(IconsAssets.icWithList, "WishList"),
                  CustomBottomNavBarItem(IconsAssets.icProfile, "Profile"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  changeSelectedIndex(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;

  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
          label: title,
          icon: ImageIcon(
            AssetImage(iconPath),
            color: ColorManager.white,
          ),
          activeIcon: CircleAvatar(
            backgroundColor: ColorManager.white,
            child: ImageIcon(
              AssetImage(iconPath),
              color: ColorManager.primary,
            ),
          ),
        );
}
