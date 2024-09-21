import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/dash_mark.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/short_desc.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/steps_and_ingredient_widget.dart';

class RecipeDetailsWidget extends StatelessWidget {
  const RecipeDetailsWidget({
    super.key,
    required this.recipeModel,
  });
  final AllRecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
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
              ShortDesc(recipeModel: recipeModel),
              SizedBox(height: 28.h),
              const StepsAndIngredientWidget(),
              SizedBox(height: 28.h),
            ],
          ),
        ),
      ],
    );
  }
}
