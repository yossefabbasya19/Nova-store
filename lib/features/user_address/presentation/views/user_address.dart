import 'package:ecommerce_app/core/helper/snack_bar.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/home_screen_app_bar.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/features/user_address/data/data_source/user_address_api_data_source.dart';
import 'package:ecommerce_app/features/user_address/data/model/Data.dart';
import 'package:ecommerce_app/features/user_address/data/repo/user_address_repo_imple.dart';
import 'package:ecommerce_app/features/user_address/presentation/view_model/user_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAddress extends StatefulWidget {
  const UserAddress({super.key});

  @override
  State<UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  late UserAddressCubit userAddressCubit;

  @override
  void initState() {
    userAddressCubit = UserAddressCubit(UserAddressRepoImple(
        userAddressDataSource: UserAddressApiDataSource()));
    getAllAddress();
    super.initState();
  }

  getAllAddress() async {
    await userAddressCubit.getUserAddress();
  }

  FocusNode phoneNode = FocusNode();

  FocusNode addressNode = FocusNode();
  List<Data> address = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: userAddressCubit,
      child: Scaffold(
        appBar: HomeScreenAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<UserAddressCubit, UserAddressState>(
            listener: (context, state) {
              if (state is UserAddressFailure) {
                snackBar(context, state.errorMessage);
              }
              if (state is UserAddressSuccess) {
                address = state.addressResponse.data!;
                print(address);
              }
            },
            builder: (context, state) {
              if (state is UserAddressLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                );
              }
              return ListView.builder(
                itemCount: address.isEmpty?1:address.length,
                itemBuilder: (context, index) {
                  return address.isEmpty
                      ? Center(
                          child: Text(
                          "no address",
                          style: getRegularStyle(
                              color: ColorManager.darkBlue, fontSize: 14),
                        ))
                      : Text("address[index].city!");
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
/*Column(
              children: [
                BuildTextField(
                  focusNode: phoneNode,
                  nextFocus: addressNode,
                  maxLines: 1,
                  hint: "Your mobile number",
                  label: "Your mobile number",
                  labelTextStyle:
                  getRegularStyle(color: ColorManager.primary, fontSize: 14),
                  backgroundColor: Colors.transparent,
                  borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                ),
                SizedBox(
                  height: 16.h,
                ),
                BuildTextField(
                  focusNode: addressNode,
                  maxLines: 1,
                  hint: "Your Address",
                  label: "Your Address",
                  labelTextStyle:
                  getRegularStyle(color: ColorManager.primary, fontSize: 14),
                  backgroundColor: Colors.transparent,
                  borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                ),
              ],
            )*/
