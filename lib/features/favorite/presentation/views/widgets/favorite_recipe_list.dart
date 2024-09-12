import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_widget.dart';

class FavoritsRecipesList extends StatelessWidget {
  const FavoritsRecipesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(childCount: 3, (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RecipeWidget(
              color: ThemeColorHelper.getLightGreyAndDarkPink(context),
            ),
          );
        }),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 30.r, mainAxisSpacing: 80.r, crossAxisCount: 2));
  }
}
