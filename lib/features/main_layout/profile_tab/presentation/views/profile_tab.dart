import 'package:ecommerce_app/core/helper/snack_bar.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/data/model/user_DM.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/data_source/profile_api_data_source.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/repo/profile_repo_imple.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/widget/main_text_field.dart';
import '../../../../../core/widget/validators.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  ProfileTabState createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  bool loading = false;
  FocusNode userNameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    userNameController.text = UserDm.currentUser!.userName;
    emailController.text = UserDm.currentUser!.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(
          ProfileRepoImple(profileDataSource: ProfileApiDataSource())),
      child: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    SvgAssets.routeLogo,
                    height: AppSize.s40,
                    colorFilter: ColorFilter.mode(
                      ColorManager.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(height: AppSize.s20.h),
                  Text(
                    'Welcome, ${UserDm.currentUser!.userName}',
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18),
                  ),
                  Text(
                    UserDm.currentUser!.email,
                    style: getRegularStyle(
                        color: ColorManager.primary.withOpacity(.5),
                        fontSize: FontSize.s14),
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BlocConsumer<ProfileCubit, ProfileState>(
                    listener: (context, state) {
                      if (state is NameUpdateFailure) {
                        snackBar(context, state.errorMessage);
                      }
                      if (state is NameUpdateSuccess) {
                        snackBar(context, "user Name updated");
                      }
                    },
                    builder: (context, state) {
                      return BuildTextField(
                        onEditingCompletet: () async {
                          userNameNode.unfocus();
                          FocusScope.of(context).requestFocus(emailNode);
                          if (UserDm.currentUser!.userName ==
                              userNameController.text) return;
                          await BlocProvider.of<ProfileCubit>(context)
                              .updateUserData(
                                  {"name": userNameController.text});
                        },
                        focusNode: userNameNode,
                        nextFocus: emailNode,
                        borderBackgroundColor:
                            ColorManager.primary.withOpacity(.5),
                        readOnly: false,
                        backgroundColor: ColorManager.white,
                        hint: 'Enter your full name',
                        label: 'Full Name',
                        controller: userNameController,
                        labelTextStyle: getMediumStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s18),
                        suffixIcon: Padding(
                          padding: EdgeInsetsGeometry.all(12),
                          child: SvgPicture.asset(SvgAssets.edit),
                        ),
                        textInputType: TextInputType.text,
                        validation: AppValidators.validateFullName,
                        hintTextStyle:
                            getRegularStyle(color: ColorManager.primary)
                                .copyWith(fontSize: 18.sp),
                      );
                    },
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BlocConsumer<ProfileCubit, ProfileState>(
                    listener: (context, state) {
                      if (state is EmailUpdateFailure) {
                        snackBar(context, state.errorMessage);
                      }
                      if (state is EmailUpdateSuccess) {
                        snackBar(context, "email updated");
                      }
                    },
                    builder: (context, state) {
                      return BuildTextField(
                        onEditingCompletet: () async {
                          emailNode.unfocus();
                          if (UserDm.currentUser!.email == emailController.text)
                            return;
                          await BlocProvider.of<ProfileCubit>(context)
                              .updateUserData({"email": emailController.text});
                        },
                        focusNode: emailNode,
                        borderBackgroundColor:
                            ColorManager.primary.withOpacity(.5),
                        readOnly: false,
                        backgroundColor: ColorManager.white,
                        hint: 'Enter your email address',
                        label: 'E-mail address',
                        controller: emailController,
                        labelTextStyle: getMediumStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s18),
                        suffixIcon: Padding(
                          padding: EdgeInsetsGeometry.all(12),
                          child: SvgPicture.asset(SvgAssets.edit),
                        ),
                        textInputType: TextInputType.emailAddress,
                        validation: AppValidators.validateEmail,
                        hintTextStyle:
                            getRegularStyle(color: ColorManager.primary)
                                .copyWith(fontSize: 18.sp),
                      );
                    },
                  ),
                  SizedBox(height: AppSize.s18.h),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.userAddressScreen);
                    },
                    child: Text(
                      "Address Settings",
                      style: getSemiBoldStyle(
                          color: ColorManager.primary, fontSize: 16),
                    ),
                  ),
                  CustomElevatedButton(
                    isLoading: loading,
                    backgroundColor: ColorManager.error,
                    label: "exit",
                    onTap: () async {
                      loading = true;
                      setState(() {});
                      await SharedPref().removeToken();
                      loading = false;
                      setState(() {});
                      Navigator.pushReplacementNamed(
                          context, Routes.signInRoute);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
