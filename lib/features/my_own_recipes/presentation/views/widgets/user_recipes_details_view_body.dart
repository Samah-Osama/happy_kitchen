import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_details_page_app_bar.dart';
import 'package:happy_kitchen/features/my_own_recipes/data/models/add_recipe_model.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/view_model/user_recipe_cubit/user_recipe_cubit.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/views/widgets/user_recipe_details_widget.dart';

class UserRecipeViewBody extends StatelessWidget {
  const UserRecipeViewBody({super.key, required this.recipeModel});
  @override
  final AddRecipeModel recipeModel;
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
          child: UserRecipeDetailsWidget(recipeModel: recipeModel),
        )
      ],
    );
  }
}
