import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/home/data/models/category_model/category_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_by_category_body.dart';

class RecipeByCategoryView extends StatelessWidget {
  const RecipeByCategoryView({super.key});
  static String id = 'RecipeByCategoryView';

  @override
  Widget build(BuildContext context) {
    CategoryModel categories =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeColorHelper.getPrimaryColor(context),
        title: Text(categories.categoryName, style: Styles.textStyle22),
        centerTitle: true,
      ),
      body: const RecipeByCategoryBody(),
    );
  }
}
