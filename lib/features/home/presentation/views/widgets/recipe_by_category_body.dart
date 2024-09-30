import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/widgets/custom_error_widget.dart';
import 'package:happy_kitchen/core/widgets/custom_loading_indicator.dart';
import 'package:happy_kitchen/features/home/presentation/view_model/recipe_by_category/recipe_by_category_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_widget.dart';

class RecipeByCategoryBody extends StatelessWidget {
  const RecipeByCategoryBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeByCategoryCubit, RecipeByCategoryState>(
      builder: (context, state) {
        if (state is RecipeByCategorySuccess) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 50.r,
                ),
              ),
               SliverFillRemaining(child:  GridView.builder(
                clipBehavior: Clip.none,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:state.recipes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 70.r,
                    crossAxisSpacing: 10.r,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.r),
                    child: RecipeWidget(recipeModel: state.recipes[index]),
                  );
                },
              ),)
            ],
          );
        } else if (state is RecipeByCategoryFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
