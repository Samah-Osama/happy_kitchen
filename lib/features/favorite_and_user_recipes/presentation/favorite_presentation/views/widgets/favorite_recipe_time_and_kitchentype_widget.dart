import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/view_model/favorite_recipe_cubit/favorite_recipe_cubit.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/vertical_circular_widget.dart';

class FavoriteRecipeTimeAndKitchenTypeWidget extends StatelessWidget {
  const FavoriteRecipeTimeAndKitchenTypeWidget({
    super.key,
     required this.recipeModel,
  });
  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${recipeModel.preparationTime} \nMinutes",
              textAlign: TextAlign.center,
              style: Styles.textStyle12..copyWith(fontWeight: FontWeight.bold)),
          const VerticalCircularWidget(length: 6),
          Text(("${recipeModel.kitchenType} \n Kitchen"),
              textAlign: TextAlign.center,
              style: Styles.textStyle12.copyWith(fontWeight: FontWeight.bold)),
          const VerticalCircularWidget(length: 6),
          IconButton(
              onPressed: () {
                recipeModel.delete();
                BlocProvider.of<FavoriteRecipeCubit>(context)
                    .getFavoriteRecipe();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
