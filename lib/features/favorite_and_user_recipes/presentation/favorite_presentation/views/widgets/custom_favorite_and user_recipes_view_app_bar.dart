import 'package:flutter/material.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/views/widgets/favorite_recipes_button.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/widgets/my_recipes_button.dart';

class CustomFavoriteAndUserRecipeViewAppBar extends StatelessWidget {
  const CustomFavoriteAndUserRecipeViewAppBar({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        FavoriteRecipesButton(
          onPressed: () => controller.animateToPage(0,
              duration: const Duration(milliseconds: 1),
              curve: Curves.bounceIn),
        ),
        MyRecipesButton(
          onPressed: () => controller.animateToPage(1,
              duration: const Duration(milliseconds: 1),
              curve: Curves.bounceIn),
        ),
      ],
    );
  }
}
