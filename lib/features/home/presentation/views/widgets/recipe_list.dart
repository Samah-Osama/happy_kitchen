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
  // late final ScrollController scrollController;
  // int nextPage = 1;
  // @override
  // void initState() {
  //   scrollController = ScrollController();
  //   scrollController.addListener(scrollListener);
  //   super.initState();
  // }

  // void scrollListener() {
  //   var currentPosition = scrollController.position.pixels;
  //   if (currentPosition >= 0.8 * scrollController.position.maxScrollExtent) {
  //     const CustomLoadingIndicator();
  //     BlocProvider.of<AllRecipesCubit>(context).getAllRecipes(pageNumber: nextPage++);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllRecipesCubit, AllRecipesState>(
      builder: (context, state) {
        if (state is AllRecipesSuccess) {
          return GridView.builder(
              // controller: scrollController,
             physics: const NeverScrollableScrollPhysics(),
              itemCount: state.allRecipes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 80.r,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.r),
                  child: RecipeWidget(recipeModel: state.allRecipes[index]),
                );
              });
          // return SliverGrid(
          //   delegate: SliverChildBuilderDelegate(
          //       childCount: state.allRecipes.length, (context, index) {
          //     return Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 15.r),
          //       child: RecipeWidget(recipeModel: state.allRecipes[index]),
          //     );
          //   }),
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       childAspectRatio: 1.0,
          //       mainAxisSpacing: 80.r,
          //       crossAxisCount: 2),
          // );
        } else if (state is AllRecipesFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        return const CustomLoadingIndicator();
      },
    );
  }
}
