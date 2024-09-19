import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/view_model/user_recipe_cubit/user_recipe_cubit.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/views/add_recipe_view.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/views/my_own_recipes_view.dart';
import 'package:happy_kitchen/features/favorite/presentation/views/widgets/custom_favorite_view_app_bar.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/views/widgets/custom_add_recipe_icon.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: const CustomFavoriteViewAppBar(),
      ),
      floatingActionButton: const CustomAddRecipeIcon(),
      body: const MyOwnRecipesView(),
      // body: const FavoritesViewBody(),
    );
  }
}
