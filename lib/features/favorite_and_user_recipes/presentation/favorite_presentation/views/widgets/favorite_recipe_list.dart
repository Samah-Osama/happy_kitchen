import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/view_model/favorite_recipe_cubit/favorite_recipe_cubit.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/views/widgets/favorite_recipe_list_item.dart';

class FavoritesRecipesList extends StatelessWidget {
  const FavoritesRecipesList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var recipe =
        BlocProvider.of<FavoriteRecipeCubit>(context).favoriteRecipeList ?? [];
    return BlocBuilder<FavoriteRecipeCubit, FavoriteRecipeState>(
        builder: (context, state) {
      return GridView.builder(
        itemCount: recipe.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
          
            return FavoriteRecipeListItem(recipe: recipe[index]);
          });
    });
  }
}
