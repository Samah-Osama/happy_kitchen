import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/functions/snack_bar.dart';
import 'package:happy_kitchen/core/widgets/custom_error_widget.dart';
import 'package:happy_kitchen/core/widgets/custom_loading_indicator.dart';
import 'package:happy_kitchen/features/home/presentation/view_model/all_recipe_cubit/all_recipes_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/views/dashboard_view.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_widget.dart';

class RecipesListBody extends StatefulWidget {
  const RecipesListBody({super.key});

  @override
  State<RecipesListBody> createState() => _RecipesListBodyState();
}

class _RecipesListBodyState extends State<RecipesListBody> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var data = BlocProvider.of<AllRecipesCubit>(context);
    return BlocConsumer<AllRecipesCubit, AllRecipesState>(
      listener: (BuildContext context, AllRecipesState state) {
        if (state is AllRecipesPaginationFailure) {
          showSnackBar(context, state.errorMessage);
        }
        // else if (state is NoMoreRecipeState) {
        //   thereIsMoreData = false;
        // }
      },
      builder: (context, state) {
        if (state is AllRecipesSuccess ||
            state is AllRecipesPaginationLoading ||
            state is AllRecipesPaginationFailure ||
            state is NoMoreRecipeState) {
          return Stack(
            children: [
              GridView.builder(
                clipBehavior: Clip.none,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.allRecipeList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 70.r,
                    crossAxisSpacing: 10.r,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.r),
                    child: RecipeWidget(recipeModel: data.allRecipeList[index]),
                  );
                },
              ),
              // if (state is AllRecipesPaginationLoading)
              //   const CustomLoadingIndicator(),
            ],
          );
        } else if (state is AllRecipesFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        return const CustomLoadingIndicator();
      },
    );
  }
}
