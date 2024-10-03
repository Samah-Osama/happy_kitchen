import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/assets.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/favorite_data/models/favorite_model.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/views/widgets/custom_favorite_recipe_image.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/views/widgets/favorite_rating_widget.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/views/widgets/favorite_recipe_time_and_kitchentype_widget.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_time_kitchentype.dart';

class FavoriteRecipeListItem extends StatelessWidget {
  const FavoriteRecipeListItem({
    super.key,
    required this.recipe,
  });

  final FavoriteModel recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200.h,
            width: 190.w,
            padding: EdgeInsets.only(bottom: 5.r),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(blurStyle: BlurStyle.outer, blurRadius: 5.r)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TitleWidget(recipe: recipe),
                SizedBox(height: 8.h),
                FavoriteRatingWidget(recipe: recipe),
                SizedBox(height: 15.h),
                FavoriteRecipeTimeAndKitchenTypeWidget(favoriteModel: recipe),
              ],
            ),
          ),
          Positioned(
            left: 5.r,
            bottom: 130.r,
            child: CustomFavoriteRecipeImage(recipe: recipe),
          ),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.recipe,
  });

  final FavoriteModel recipe;

  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.center,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        recipe.title,
        style: Styles.textStyle16);
  }
}
