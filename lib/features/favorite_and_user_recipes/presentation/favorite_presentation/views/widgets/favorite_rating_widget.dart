import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/recipe_model.dart';

class FavoriteRatingWidget extends StatelessWidget {
  const FavoriteRatingWidget({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) {
          return SizedBox(
              width: 20.r,
              height: 20.r,
              child: const Icon(
                Icons.star_rate_rounded,
                color: kPrimaryColorDarkMode,
              ));
        },
      ),
    );
  }
}
