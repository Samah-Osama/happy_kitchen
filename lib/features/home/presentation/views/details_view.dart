import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/favorite_presentation/view_model/add_recipe_to_favorite_cubit/add_recipe_to_favorite_cubit.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});
  static String id = 'DetailsView';
  @override
  Widget build(BuildContext context) {
    var recipeModel =
        ModalRoute.of(context)!.settings.arguments as AllRecipeModel;

    return Scaffold(
      body: DetailsViewBody(recipeModel: recipeModel),
    );
  }
}
