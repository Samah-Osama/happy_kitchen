import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/view_model/user_recipe_cubit/user_recipe_cubit.dart';

class MyRecipesButton extends StatelessWidget {
  const MyRecipesButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
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
