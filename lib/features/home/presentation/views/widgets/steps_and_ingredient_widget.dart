import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/steps_and_Ingredients_Information.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/steps_and_ingredient_button.dart';

class StepsAndIngredientWidget extends StatefulWidget {
  const StepsAndIngredientWidget({
    super.key,
    required this.recipeModel,
  });
  final RecipeModel recipeModel;

  @override
  State<StepsAndIngredientWidget> createState() =>
      _StepsAndIngredientWidgetState();
}

class _StepsAndIngredientWidgetState extends State<StepsAndIngredientWidget> {
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
        SizedBox(height: 30.h),
        SizedBox(
          height: 100.h,
          child: PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: [
              StepsAndIngredientsInformation(
                  title: 'Steps',
                  content: widget.recipeModel.description ?? ''),
              const StepsAndIngredientsInformation(
                  title: 'Ingredients', content: 'kdmcldsmc')
            ],
          ),
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
