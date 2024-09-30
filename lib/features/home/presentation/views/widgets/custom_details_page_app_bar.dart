import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/functions/snack_bar.dart';
import 'package:happy_kitchen/core/utils/assets.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/favorite_data/models/favorite_model.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/view_model/add_recipe_to_favorite_cubit/add_recipe_to_favorite_cubit.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_actions_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomDetailsPageAppBar extends StatelessWidget {
  const CustomDetailsPageAppBar({
    super.key,
    this.recipeModel,
  });
  final AllRecipeModel? recipeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 25.r, right: 25.r, top: 60.r, bottom: 20.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomActionsWidget(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 24.0,
            ),
          ),
          BlocConsumer<AddRecipeToFavoriteCubit, AddRecipeToFavoriteState>(
            listener: (context, state) {
              if (state is AddRecipeToFavoriteSuccess) {
                showSnackBar(context, 'Recipe has been added to favorite');
              } else if (state is AddRecipeToFavoriteFailure) {
                showSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return CustomActionsWidget(
                onTap: () {
                  var favoriteRecipe = FavoriteModel(
                      id: recipeModel!.id,
                      title: recipeModel!.title,
                      description: recipeModel!.description,
                      image: recipeModel!.image ?? AssetsData.kLogo,
                      preparationTime: recipeModel!.preparationTime,
                      category: recipeModel!.category,
                      rating: recipeModel!.rating ?? 0,
                      kitchenType: recipeModel!.kitchenType ?? 'Other');
                  BlocProvider.of<AddRecipeToFavoriteCubit>(context)
                      .addRecipeToFavorite(favoriteRecipe);
                },
                child: state is AddRecipeToFavoriteSuccess
                    ? Icon(
                        Icons.favorite,
                        size: 24.r,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.favorite,
                        size: 24.r,
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
