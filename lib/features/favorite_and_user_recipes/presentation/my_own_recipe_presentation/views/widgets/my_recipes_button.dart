import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

class MyRecipesButton extends StatelessWidget {
  const MyRecipesButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    width: 2,
                    color: ThemeColorHelper.getPrimaryColor(context)))),
        width: 150.w,
        height: 50.h,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'My Recipes',
            style: Styles.textStyle24.copyWith(
                fontWeight: FontWeight.bold,
                color: ThemeColorHelper.getPrimaryColor(context)),
          ),
        ),
      ),
    );
  }
}
