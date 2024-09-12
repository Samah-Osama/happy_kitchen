import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/favorite/presentation/views/widgets/add_recipe_view_body.dart';

class AddRecipeView extends StatelessWidget {
  const AddRecipeView({super.key});
  static String id = 'AddRecipeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add a Recipe"),
        foregroundColor: ThemeColorHelper.getPrimaryColor(context),
      ),
      body: const AddRecipeViewBody(),
    );
  }
}
