import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/favorite_data/models/favorite_model.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/view_model/favorite_recipe_cubit/favorite_recipe_cubit.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/views/widgets/favorite_recipe_list_item.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  get favoriteModel => null;

  @override
  @override
  Widget build(BuildContext context) {
    List<FavoriteModel> recipe =
        BlocProvider.of<FavoriteRecipeCubit>(context).favoriteRecipeList ?? [];
    return BlocBuilder<FavoriteRecipeCubit, FavoriteRecipeState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 70.h),
            ),
            SliverFillRemaining(
                child: GridView.builder(
                    clipBehavior: Clip.none,
                    itemCount: recipe.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.0,
                        mainAxisSpacing: 70.r,
                        crossAxisSpacing: 10.r,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return FavoriteRecipeListItem(recipe: recipe[index]);
                    })),
          ],
        );
      },
    );
  }
}
