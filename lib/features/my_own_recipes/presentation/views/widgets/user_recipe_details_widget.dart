import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/dash_mark.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/steps_and_ingredient_section.dart';
import 'package:happy_kitchen/features/my_own_recipes/data/models/add_recipe_model.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/view_model/user_recipe_cubit/user_recipe_cubit.dart';

class UserRecipeDetailsWidget extends StatelessWidget {
  const UserRecipeDetailsWidget({
    super.key,
    required this.recipeModel,
  });
  final AddRecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    var recipe = BlocProvider.of<UserRecipeCubit>(context).recipe;
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 28.0),
          padding: const EdgeInsets.symmetric(vertical: 28.0),
          decoration: BoxDecoration(
            color: ThemeColorHelper.getLightGreyAndDarkPink(context),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: Column(
            children: [
              const DashMark(),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                  recipeModel.title,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle28.copyWith(color: kWhiteColor),
                ),
              ),
              SizedBox(height: 30.h),
              Text('${recipeModel.recipeTime} Minutes',
                  style: Styles.textStyle16),
              SizedBox(height: 28.h),
              const StepsAndIngredientSection(),
              SizedBox(height: 28.h),
            ],
          ),
        ),
      ],
    );
  }
}
