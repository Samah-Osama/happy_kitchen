import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/assets.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/view_model/favorite_recipe_cubit/favorite_recipe_cubit.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/views/widgets/favorite_recipe_list_item.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/rating_widget.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_time_kitchentype.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_widget.dart';

class FavoritesRecipesList extends StatelessWidget {
  const FavoritesRecipesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteRecipeCubit, FavoriteRecipeState>(
      builder: (context, state) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(childCount: 3, (context, index) {
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
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30.r),
                        boxShadow: [
                          BoxShadow(blurStyle: BlurStyle.outer, blurRadius: 2.r)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            'title',
                            style: Styles.textStyle16),
                        SizedBox(height: 8.r),
                        // RatingWidget(recipeModel: recipeModel),
                        SizedBox(height: 15.r),
                        // RecipeTimeAndKitchenTypeWidget(recipeModel: recipeModel),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 5.r,
                    bottom: 130.r,
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) {
                        return const Icon(
                          Icons.error,
                          size: 25,
                        );
                        //   //const CustomImageErrorWidget(
                        //   //   hight: 100,
                        //   //   width: 200,
                        //   // );
                      },
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
                      imageUrl: AssetsData.kLogo,
                    ),
                  ),
                ],
              ),
            );
          }),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 30.r, mainAxisSpacing: 80.r, crossAxisCount: 2),
        );
      },
    );
  }
}
