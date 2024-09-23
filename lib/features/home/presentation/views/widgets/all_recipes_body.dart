import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/all_recipes_category_widget.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_list.dart';

class AllRecipesBody extends StatelessWidget {
  const AllRecipesBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30.r),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: AllRecipesCategoryWidget(),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 100.r)),
        const SliverFillRemaining(child: RecipesList()),
      ],
    );
  }
}
