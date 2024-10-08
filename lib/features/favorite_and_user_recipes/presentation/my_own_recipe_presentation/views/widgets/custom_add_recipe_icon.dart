import 'package:flutter/material.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/add_recipe_view.dart';

class CustomAddRecipeIcon extends StatelessWidget {
  const CustomAddRecipeIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, AddRecipeView.id);
      },
      backgroundColor: ThemeColorHelper.getPrimaryColor(context),
      child: const Icon(
        Icons.add,
        color: kWhiteColor,
      ),
    );
  }
}
