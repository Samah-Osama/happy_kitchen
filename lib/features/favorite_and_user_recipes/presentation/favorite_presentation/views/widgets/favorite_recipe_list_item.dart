import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/favorite_data/models/favorite_model.dart';

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
                  BoxShadow(blurStyle: BlurStyle.outer, blurRadius: 2.r)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TitleWidget(recipe: recipe),
                SizedBox(height: 8.h),
                FavoriteRatingWidget(recipe: recipe),
                SizedBox(height: 15.h),
                //  RecipeTimeAndKitchenTypeWidget(),
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

class CustomFavoriteRecipeImage extends StatelessWidget {
  const CustomFavoriteRecipeImage({
    super.key,
    required this.recipe,
  });

  final FavoriteModel recipe;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      // errorWidget: (context, url, error) {
      //   return Container(
      //     height: 100.h,
      //     width: 200.w,
      //     decoration: const BoxDecoration(
      //         shape: BoxShape.circle,
      //         image: DecorationImage(
      //             fit: BoxFit.fill,
      //             image: AssetImage(AssetsData.kNoPhoto))),
      //   );
      // },
      imageBuilder: (context, imageProvider) {
        return Container(
          height: 100.h,
          width: 200.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill, image: imageProvider)),
        );
      },
      imageUrl: recipe.image,
    );
  }
}

class FavoriteRatingWidget extends StatelessWidget {
  const FavoriteRatingWidget({
    super.key,
    required this.recipe,
  });

  final FavoriteModel recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        recipe.rating,
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
