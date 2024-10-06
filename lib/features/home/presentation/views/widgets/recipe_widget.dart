import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/assets.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/details_view.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/rating_widget.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_time_kitchentype.dart';

class RecipeWidget extends StatelessWidget {
  const RecipeWidget({super.key, this.color, required this.recipeModel});
  @override
  final Color? color;
  final RecipeModel recipeModel;
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
            height: 300.h,
            width: 190.w,
            padding: EdgeInsets.only(bottom: 5.r),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(blurStyle: BlurStyle.outer, blurRadius: 5.r),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    recipeModel.title,
                    style: Styles.textStyle16),
                SizedBox(height: 8.r),
                RatingWidget(recipeModel: recipeModel),
                SizedBox(height: 15.r),
                RecipeTimeAndKitchenTypeWidget(recipeModel: recipeModel),
              ],
            ),
          ),
          Positioned(
            left: 25.r,
            bottom: 130.r,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) {
                return Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(AssetsData.kNoPhoto))),
                );
              },
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: imageProvider)),
                );
              },
              imageUrl: recipeModel.image ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
