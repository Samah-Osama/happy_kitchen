import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

import 'package:happy_kitchen/features/home/presentation/views/widgets/all_recipes_body.dart';

class AllRecipesView extends StatelessWidget {
  const AllRecipesView({super.key});
  @override
  static String id = 'AllRecipes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeColorHelper.getPrimaryColor(context),
        centerTitle: true,
        title: Text(
          "Let's find something to cook",
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const AllRecipesBody(),
    );
  }
}
