import 'package:flutter/material.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});
  static String id = 'DetailsView';
  @override
  Widget build(BuildContext context) {
    var recipeModel = ModalRoute.of(context)!.settings.arguments as RecipeModel;

    return Scaffold(
      body: DetailsViewBody(recipeModel: recipeModel),
    );
  }
}
