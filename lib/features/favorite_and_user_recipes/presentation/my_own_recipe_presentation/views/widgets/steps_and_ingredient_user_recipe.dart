import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/functions/toggle_between_pages.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/my_own_recipe_data/models/add_recipe_model.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/widgets/user_recipe_steps_and_ingredient_information.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/steps_and_Ingredients_Information.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/steps_and_ingredient_button.dart';

class StepsAndIngredientUserRecipe extends StatefulWidget {
  const StepsAndIngredientUserRecipe({
    super.key,
    required this.recipeModel,
  });
  final AddRecipeModel recipeModel;

  @override
  State<StepsAndIngredientUserRecipe> createState() =>
      _StepsAndIngredientWidgetState();
}

class _StepsAndIngredientWidgetState
    extends State<StepsAndIngredientUserRecipe> {
  final controller = PageController(initialPage: 0);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.r),
          padding: EdgeInsets.symmetric(vertical: 12.r),
          decoration: BoxDecoration(
            color: ThemeColorHelper.getDarkGreyAndPink(context),
            borderRadius: BorderRadius.circular(36.r),
          ),
          child: StepsAndIngredientButton(controller: controller),
          // child: Row(
          //   children: List.generate(
          //     tabs.length,
          //     (index) {
          //       return GestureDetector(
          //         onTap: () {
          //           currentIndex = index;
          //           toggleBetweenPages(index, controller);
          //           setState(() {});
          //         },
          //         child: Container(
          //           margin: EdgeInsets.only(left: 10.r),
          //           height: 45.h,
          //           width: 140.w,
          //           alignment: Alignment.center,
          //           decoration: BoxDecoration(
          //             color: currentIndex == index
          //                 ? ThemeColorHelper.getLightGreyAndPink(context)
          //                 : Colors.transparent,
          //             borderRadius: BorderRadius.circular(28.0),
          //           ),
          //           child: Text(
          //             tabs[index],
          //             style: Styles.textStyle18.copyWith(
          //               color: currentIndex == index
          //                   ? ThemeColorHelper.getYellowAndBlack(context)
          //                   : ThemeColorHelper.getGreyAndWhite(context),
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 100.h,
          child: PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: [
              UserStepsAndIngredientsInformation(
                title: 'Steps',
                  content: widget.recipeModel.steps),
              UserStepsAndIngredientsInformation(
                title: 'Ingredients',
                  content: widget.recipeModel.ingredients)
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
