import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_widget.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(childCount: 10, (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: const RecipeWidget(
              
            ),
          );
        }),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 80.r, crossAxisCount: 2));
  }
}
