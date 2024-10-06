import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/my_own_recipe_data/models/add_recipe_model.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/view_model/user_recipe_cubit/user_recipe_cubit.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/widgets/my_recipe_widget.dart';

class MyOwnRecipesViewBody extends StatelessWidget {
  const MyOwnRecipesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    List<AddRecipeModel> recipe =
        BlocProvider.of<UserRecipeCubit>(context).recipe ?? [];
    return BlocBuilder<UserRecipeCubit, UserRecipeState>(
        builder: (context, state) {
      // print(recipe);
      return SliverGrid(
        delegate: SliverChildBuilderDelegate(childCount: recipe.length,
            (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: MyRecipeWidget(recipeModel: recipe[index]),
          );
        }),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 30.r, mainAxisSpacing: 80.r, crossAxisCount: 2),
      );
    });
  }
}
