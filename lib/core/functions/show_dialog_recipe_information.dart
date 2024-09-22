import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

Future<dynamic> showDialogRecipeInformation({required BuildContext context, required String title , required String content}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          backgroundColor: ThemeColorHelper.getDarkGreyAndPink(context),
          title: Text(
            title,
            style: Styles.textStyle28.copyWith(color: Colors.white),
          ),
          content: Text(content,
              style: Styles.textStyle18.copyWith(color: Colors.white)),
        );
      });
}
