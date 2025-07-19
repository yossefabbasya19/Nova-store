import 'package:ecommerce_app/core/helper/snack_bar.dart';
import 'package:ecommerce_app/core/model/product_dm/Data.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/view_model/shared_cubit/shared_logic_cubit.dart';
import 'package:ecommerce_app/features/auth/data/model/user_DM.dart';
import 'package:ecommerce_app/features/main_layout/home/data/model/wash_list_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;
  final ProductDetailsDM? productDetailsDM;

  const HeartButton({super.key, required this.onTap, this.productDetailsDM});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  late String heartIcon;
  late bool isClicked;

  @override
  void initState() {
    isClicked =
        UserDm.currentUser!.washList.contains(widget.productDetailsDM!.id);
    heartIcon = !isClicked ? IconsAssets.icHeart : IconsAssets.icClickedHeart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SharedLogicCubit, SharedLogicState>(
      listener: (context, state) {
        if (state is AddFavoritesFailure) {
          snackBar(context, state.errorMessage);
        }
        if (state is AddFavoritesLoading) {}
      },
      builder: (context, state) {
        return InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onTap: () async {
            if (!isClicked) {
              isClicked = !isClicked;
              heartIcon =
                  !isClicked ? IconsAssets.icHeart : IconsAssets.icClickedHeart;
              await BlocProvider.of<SharedLogicCubit>(context).addFavorites(
                  WashListRequest(productID: widget.productDetailsDM!.id!));
            } else {
              isClicked = !isClicked;
              heartIcon =
                  !isClicked ? IconsAssets.icHeart : IconsAssets.icClickedHeart;
              await BlocProvider.of<SharedLogicCubit>(context)
                  .removeFavorites(widget.productDetailsDM!.id!);
            }
            widget.onTap!();
          },
          child: Material(
            color: ColorManager.white,
            elevation: 5,
            shape: const StadiumBorder(),
            shadowColor: ColorManager.black,
            child: Padding(
                padding: const EdgeInsets.all(6),
                child: ImageIcon(
                  AssetImage(heartIcon),
                  color: ColorManager.primary,
                )),
          ),
        );
      },
    );
  }
}
