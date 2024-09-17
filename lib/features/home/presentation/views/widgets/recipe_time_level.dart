import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/vertical_circular_widget.dart';

class RecipeTimeAndLevelWidget extends StatelessWidget {
  const RecipeTimeAndLevelWidget({
    super.key,
    required this.recipeModel,
  });
  final AllRecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(recipeModel.preparationTime,
              textAlign: TextAlign.center,
              style: Styles.textStyle14..copyWith(fontWeight: FontWeight.bold)),
          const VerticalCircularWidget(length: 6),
          Text('Italian',
              textAlign: TextAlign.center,
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
