import 'package:flutter/material.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_actions_widget.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_details_page_app_bar.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/my_own_recipe_data/models/add_recipe_model.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/widgets/user_recipes_details_view_body.dart';

class UserRecipesDetailsView extends StatelessWidget {
  const UserRecipesDetailsView({super.key});
  @override
  static String id = 'UserRecipesDetailsView';
  Widget build(BuildContext context) {
    var recipes = ModalRoute.of(context)!.settings.arguments as AddRecipeModel;
    return Scaffold(
      body: UserRecipeViewBody(recipeModel: recipes),
    );
  }
}
