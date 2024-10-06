import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/assets.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/recipe_model.dart';

class CustomFavoriteRecipeImage extends StatelessWidget {
  const CustomFavoriteRecipeImage({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      errorWidget: (context, url, error) {
        return Container(
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AssetsData.kNoPhoto))),
        );
      },
      imageBuilder: (context, imageProvider) {
        return Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(fit: BoxFit.fill, image: imageProvider)),
        );
      },
      imageUrl: recipe.image ?? AssetsData.kNoPhoto,
    );
  }
}
