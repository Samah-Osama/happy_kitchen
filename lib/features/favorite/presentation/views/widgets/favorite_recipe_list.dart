import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritsRecipesList extends StatelessWidget {
  const FavoritsRecipesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(childCount: 3, (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('hhhh'),
            // child: RecipeWidget(
            //   color: ThemeColorHelper.getLightGreyAndDarkPink(context),
            // ),
          );
        }),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 30.r, mainAxisSpacing: 80.r, crossAxisCount: 2));
  }
}
