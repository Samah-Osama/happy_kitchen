import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/functions/toggle_between_pages.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/views/widgets/favorite_recipes_button.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/view_model/user_recipe_cubit/user_recipe_cubit.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/widgets/my_recipes_button.dart';

class CustomFavoriteAndUserRecipeViewAppBar extends StatelessWidget {
  const CustomFavoriteAndUserRecipeViewAppBar({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    var triggerUserRecipeCubit =
        BlocProvider.of<UserRecipeCubit>(context).getUserRecipes();
    return Padding(
      padding: EdgeInsets.only(top: 20.r, left: 15.r),
      child: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          FavoriteRecipesButton(onPressed: () {
            toggleBetweenPages(0, controller);
            // controller.animateToPage(0,
            //     duration: const Duration(milliseconds: 1),
            //     curve: Curves.bounceIn);
          }),
          MyRecipesButton(
            onPressed: () {
              triggerUserRecipeCubit;
              toggleBetweenPages(1, controller);
            },
          )
        ],
      ),
    );
  }
}
