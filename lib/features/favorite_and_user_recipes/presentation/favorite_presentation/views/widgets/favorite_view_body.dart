import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/widgets/custom_loading_indicator.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/view_model/favorite_recipe_cubit/favorite_recipe_cubit.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/views/widgets/favorite_recipe_widget_item.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/recipe_model.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<RecipeModel> recipe =
        BlocProvider.of<FavoriteRecipeCubit>(context).favoriteRecipeList ?? [];
    return BlocBuilder<FavoriteRecipeCubit, FavoriteRecipeState>(
      builder: (context, state) {
        if (state is FavoriteRecipeSuccess) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: 80.h),
              ),
              SliverFillRemaining(
                  child: GridView.builder(
                      clipBehavior: Clip.none,
                      itemCount: recipe.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.r,
                          mainAxisSpacing: 90.r,
                          crossAxisSpacing: 7.r,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return FavoriteRecipeWidgetItem(recipe: recipe[index]);
                      })),
            ],
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
