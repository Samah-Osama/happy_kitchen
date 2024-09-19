import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/view_model/user_recipe_cubit/user_recipe_cubit.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/views/widgets/my_recipe_widget.dart';

class MyOwnRecipesViewBody extends StatelessWidget {
  const MyOwnRecipesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserRecipeCubit, UserRecipeState>(
        builder: (context, state) {
      return SliverGrid(
        delegate: SliverChildBuilderDelegate(
            childCount: state is UserRecipeSuccess ? state.recipe.length : 0,
            (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: MyRecipeWidget(),
          );
        }),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 30.r, mainAxisSpacing: 80.r, crossAxisCount: 2),
      );
    });
  }
}
