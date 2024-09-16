import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_list.dart';

class RecipeByCategoryBody extends StatelessWidget {
  const RecipeByCategoryBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // clipBehavior: Clip.none,
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50.r,
          ),
        ),
        const RecipesList()
      ],
    );
  }
}
