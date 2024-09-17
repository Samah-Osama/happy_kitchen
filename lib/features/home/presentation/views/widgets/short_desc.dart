import 'package:flutter/material.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_short_desc_item.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/vertical_circular_widget.dart';

class ShortDesc extends StatelessWidget {
  const ShortDesc({super.key, required this.recipeModel});
  @override
  final AllRecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CustomShortDescItem(text1: '30 Minutes', type: 'Cooking'),
        const VerticalCircularWidget(length: 12),
        CustomShortDescItem(text1: '${recipeModel.rating}', type: 'Rating'),
        const VerticalCircularWidget(length: 12),
        const CustomShortDescItem(text1: 'Hard Level', type: 'Level'),
      ],
    );
  }
}
