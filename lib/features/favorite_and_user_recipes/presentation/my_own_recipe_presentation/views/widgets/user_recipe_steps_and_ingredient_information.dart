import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/functions/show_dialog_recipe_information.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

class UserStepsAndIngredientsInformation extends StatelessWidget {
  const UserStepsAndIngredientsInformation({
    super.key,
    required this.title,
    required this.content,
  });
  final String title, content;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r),
      padding: EdgeInsets.symmetric(
        horizontal: 16.r,
        vertical: 16.r,
      ),
      decoration: BoxDecoration(
        color: ThemeColorHelper.getDarkGreyAndPink(context),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: GestureDetector(
        onTap: () {
          showDialogRecipeInformation(
            context: context,
            title: title,
            content: content,
          );
        },
        child: Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          content,
          style: Styles.textStyle18.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
