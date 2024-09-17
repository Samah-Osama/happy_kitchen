import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_details_page_app_bar.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_details_widget.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.recipeModel});
  @override
  final AllRecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          child: RecipeDetailsWidget(recipeModel: recipeModel),
        )
      ],
    );
  }
}
