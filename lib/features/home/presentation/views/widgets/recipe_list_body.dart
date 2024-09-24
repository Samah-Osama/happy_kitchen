import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_kitchen/core/widgets/custom_error_widget.dart';
import 'package:happy_kitchen/core/widgets/custom_loading_indicator.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/view_model/all_recipe_cubit/all_recipes_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_list.dart';

class RecipesListBody extends StatefulWidget {
  const RecipesListBody({super.key});

  @override
  State<RecipesListBody> createState() => _RecipesListBodyState();
}

class _RecipesListBodyState extends State<RecipesListBody> {
  List<AllRecipeModel> recipesList = [];
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllRecipesCubit, AllRecipesState>(
      listener: (BuildContext context, AllRecipesState state) {
        if (state is AllRecipesSuccess) {
          return recipesList.addAll(state.allRecipes);
        }
      },
      builder: (context, state) {
        if (state is AllRecipesSuccess ||
            state is AllRecipesPaginationLoading) {
          return RecipeList(recipeList: recipesList);
          // return SliverGrid(
          //   delegate: SliverChildBuilderDelegate(
          //       childCount: state.allRecipes.length, (context, index) {
          //     return Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 15.r),
          //       child: RecipeWidget(recipeModel: state.allRecipes[index]),
          //     );
          //   }),
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       childAspectRatio: 1.0,
          //       mainAxisSpacing: 80.r,
          //       crossAxisCount: 2),
          // );
        } else if (state is AllRecipesFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        return const CustomLoadingIndicator();
      },
    );
  }
}
