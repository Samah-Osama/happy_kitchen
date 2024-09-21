import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/views/widgets/favorite_view_body.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/my_own_recipes_view.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/views/widgets/custom_favorite_and%20user_recipes_view_app_bar.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/widgets/custom_add_recipe_icon.dart';

class FavoritesAndUserRecipesView extends StatefulWidget {
  const FavoritesAndUserRecipesView({super.key});

  @override
  State<FavoritesAndUserRecipesView> createState() =>
      _FavoritesAndUserRecipesViewState();
}

class _FavoritesAndUserRecipesViewState
    extends State<FavoritesAndUserRecipesView> {
  final controller = PageController(initialPage: 0);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.r),
        child: CustomFavoriteAndUserRecipeViewAppBar(controller: controller),
      ),
      floatingActionButton: const CustomAddRecipeIcon(),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: const [
          FavoritesViewBody(),
          MyOwnRecipesView(),
        ],
      ),
    );
  }
}
