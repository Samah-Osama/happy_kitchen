import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/views/widgets/favorite_recipe_list.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 70.h),
        ),
        const FavoritesRecipesList(),
      ],
    );
  }
}
