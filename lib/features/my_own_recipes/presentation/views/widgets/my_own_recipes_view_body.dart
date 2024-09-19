import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/my_own_recipes/data/models/add_recipe_model.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/view_model/user_recipe_cubit/user_recipe_cubit.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/views/widgets/my_recipe_widget.dart';

class MyOwnRecipesViewBody extends StatelessWidget {
  const MyOwnRecipesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserRecipeCubit, UserRecipeState>(
        builder: (context, state) {
      List<AddRecipeModel> recipe =
          BlocProvider.of<UserRecipeCubit>(context).recipe ?? [];
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
