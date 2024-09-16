import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_by_category_body.dart';

class RecipeByCategoryView extends StatelessWidget {
  const RecipeByCategoryView({super.key});
  static String id = 'RecipeByCategoryView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeColorHelper.getPrimaryColor(context),
        title: const Text('BreakFast', style: Styles.textStyle22),
        centerTitle: true,
      ),
      body: const RecipeByCategoryBody(),
    );
  }
}
