import 'package:flutter/material.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_by_category_body.dart';

class RecipeByCategoryView extends StatelessWidget {
  const RecipeByCategoryView({super.key});
  static String id = 'RecipeByCategoryView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RecipeByCategoryBody(),
    );
  }
}
