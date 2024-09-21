import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_kitchen/core/cubit/steps_and_ingredients_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_details_page_app_bar.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/my_own_recipe_data/models/add_recipe_model.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/view_model/user_recipe_cubit/user_recipe_cubit.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/widgets/user_recipe_details_widget.dart';

class UserRecipeViewBody extends StatelessWidget {
  const UserRecipeViewBody({super.key, required this.recipeModel});
  @override
  final AddRecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepsAndIngredientsCubit(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CustomDetailsPageAppBar(),
                AspectRatio(
                  aspectRatio: 3 / 1.9,
                  child: Image.asset('assets/images/dish.png'),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: UserRecipeDetailsWidget(recipeModel: recipeModel),
          )
        ],
      ),
    );
  }
}
