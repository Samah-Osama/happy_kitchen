import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/widgets/custom_error_widget.dart';
import 'package:happy_kitchen/core/widgets/custom_loading_indicator.dart';
import 'package:happy_kitchen/features/home/presentation/view_model/all_recipe_cubit/all_recipes_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_widget.dart';

class RecipesList extends StatefulWidget {
  const RecipesList({super.key});

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllRecipesCubit>(context).getAllRecipes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllRecipesCubit, AllRecipesState>(
      builder: (context, state) {
        if (state is AllRecipesSuccess) {
          return SliverGrid(
            delegate:
                SliverChildBuilderDelegate(childCount: 10, (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.r),
                child: const RecipeWidget(),
              );
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 80.r, crossAxisCount: 2),
          );
        } else if (state is AllRecipesFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errorMessage: state.errorMessage),
          );
        }
        return const SliverToBoxAdapter(
          child: CustomLoadingIndicator(),
        );
      },
    );
  }
}
