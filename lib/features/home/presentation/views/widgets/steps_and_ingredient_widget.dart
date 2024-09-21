import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/functions/toggle_between_pages.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/steps_and_Ingredients_Information.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/steps_and_ingredient_button.dart';

class StepsAndIngredientWidget extends StatefulWidget {
  const StepsAndIngredientWidget({
    super.key,
  });

  @override
  State<StepsAndIngredientWidget> createState() =>
      _StepsAndIngredientWidgetState();
}

class _StepsAndIngredientWidgetState extends State<StepsAndIngredientWidget> {
  List<String> tabs = ["Steps", "Ingredients"];
  final controller = PageController(initialPage: 0);
  int currentIndex = 0;
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
          child: Row(
            children: List.generate(
              tabs.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    toggleBetweenPages(index, controller);
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10.r),
                    height: 45.h,
                    width: 140.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? ThemeColorHelper.getLightGreyAndPink(context)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    child: Text(
                      tabs[index],
                      style: Styles.textStyle18.copyWith(
                        color: currentIndex == index
                            ? ThemeColorHelper.getYellowAndBlack(context)
                            : ThemeColorHelper.getGreyAndWhite(context),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 100.h,
          child: PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: const [
              StepsAndIngredientsInformation(text: 'haha'),
              StepsAndIngredientsInformation(text: 'lalalalallamslksl')
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
