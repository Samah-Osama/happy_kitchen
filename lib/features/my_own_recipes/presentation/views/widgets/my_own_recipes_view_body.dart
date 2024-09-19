import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/views/widgets/my_recipe_widget.dart';

class MyOwnRecipesViewBody extends StatelessWidget {
  const MyOwnRecipesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: 10, (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: MyRecipeWidget(),
        );
      }),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 30.r, mainAxisSpacing: 80.r, crossAxisCount: 2),
    );
  }
}