import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/details_view.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/rating_widget.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_time_level.dart';

class RecipeWidget extends StatelessWidget {
  const RecipeWidget({super.key, this.color, required this.recipeModel});
  @override
  final Color? color;
  final AllRecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsView.id, arguments: recipeModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200.h,
            width: 190.w,
            padding: EdgeInsets.only(bottom: 24.r),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(blurStyle: BlurStyle.outer, blurRadius: 2.r)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(recipeModel.title, style: Styles.textStyle16),
                SizedBox(height: 8.r),
                RatingWidget(recipeModel: recipeModel),
                SizedBox(height: 12.r),
                RecipeTimeAndLevelWidget(recipeModel: recipeModel),
              ],
            ),
          ),
          Positioned(
              left: 25.r,
              bottom: 130.r,
              child: Image.asset('assets/images/dish.png', height: 93.r))
        ],
      ),
    );
  }
}
