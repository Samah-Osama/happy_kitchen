import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/widgets/my_own_recipes_view_body.dart';

class MyOwnRecipesView extends StatelessWidget {
  const MyOwnRecipesView({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 80.h),
        ),
        const MyOwnRecipesViewBody()
      ],
    );
  }
}
