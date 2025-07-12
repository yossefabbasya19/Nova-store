import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/home_screen_app_bar.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAddress extends StatefulWidget {
  const UserAddress({super.key});

  @override
  State<UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  FocusNode phoneNode = FocusNode();

  FocusNode addressNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
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
            SizedBox(height: 16.h,),
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
        ),
      ),
    );
  }
}
