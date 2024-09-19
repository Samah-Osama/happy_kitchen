import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

class MyRecipeWidget extends StatelessWidget {
  const MyRecipeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String chiefIcon = '👩‍🍳';
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, DetailsView.id, arguments: recipeModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200.h,
            width: 190.w,
            // padding: EdgeInsets.only(bottom: 24.r),
            decoration: BoxDecoration(
                color: ThemeColorHelper.getLightGreyAndDarkPink(context),
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.outer,
                      blurRadius: 5.r,
                      color: ThemeColorHelper.getWhiteAndBlack(context))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                    textAlign: TextAlign.center,
                    'Recipe title $chiefIcon',
                    style: Styles.textStyle18
                        .copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 8.h),
                Text(
                    textAlign: TextAlign.center,
                    '40 Minuets',
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.normal)),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.only(bottom: 15.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(22.r),
                          bottomLeft: Radius.circular(22.r)),
                      boxShadow: [
                        BoxShadow(
                            blurStyle: BlurStyle.outer,
                            blurRadius: 3.r,
                            color: ThemeColorHelper.getWhiteAndBlack(context))
                      ]),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Steps\nIngredients',
                        style: Styles.textStyle18,
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: 30.r,
              bottom: 140.r,
              child: Image.asset('assets/images/dish.png', height: 93.h))
        ],
      ),
    );
  }
}
