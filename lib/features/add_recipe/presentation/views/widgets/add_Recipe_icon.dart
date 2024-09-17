import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/add_recipe/presentation/views/add_recipe_view.dart';

class AddRecipeIcon extends StatelessWidget {
  const AddRecipeIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.r),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ThemeColorHelper.getPrimaryColor(context)),
          onPressed: () {
            Navigator.pushNamed(context, AddRecipeView.id);
          },
          child: Text(
            'Add Recipe',
            style: Styles.textStyle16
                .copyWith(color: ThemeColorHelper.getBlackAndWhite(context)),
          )),
    );
  }
}
