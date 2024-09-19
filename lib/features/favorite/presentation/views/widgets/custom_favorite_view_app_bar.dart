import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

class CustomFavoriteViewAppBar extends StatelessWidget {
  const CustomFavoriteViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 15.r, top: 90.r),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FavoriteRecipesButton(),
          MyRecipesButton(),
          // AddRecipeIcon(),
        ],
      ),
    );
  }
}

class FavoriteRecipesButton extends StatelessWidget {
  const FavoriteRecipesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    width: 2,
                    color: ThemeColorHelper.getPrimaryColor(context)))),
        width: 150.w,
        height: 50.h,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Favorite',
            style: Styles.textStyle24.copyWith(
                fontWeight: FontWeight.bold,
                color: ThemeColorHelper.getPrimaryColor(context)),
          ),
        ),
      ),
    );
  }
}

class MyRecipesButton extends StatelessWidget {
  const MyRecipesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    width: 2,
                    color: ThemeColorHelper.getPrimaryColor(context)))),
        width: 150.w,
        height: 50.h,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'My Recipes',
            style: Styles.textStyle24.copyWith(
                fontWeight: FontWeight.bold,
                color: ThemeColorHelper.getPrimaryColor(context)),
          ),
        ),
      ),
    );
  }
}
