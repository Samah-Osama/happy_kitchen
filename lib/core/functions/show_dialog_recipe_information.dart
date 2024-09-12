import 'package:flutter/material.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

Future<dynamic> showDialogRecipeInformation(BuildContext context) {
    return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                backgroundColor: ThemeColorHelper.getDarkGreyAndPink(context),
                title: Text(
                  'Details',
                  style: Styles.textStyle28.copyWith(color: Colors.white),
                ),
                content: Text(details,
                    style: Styles.textStyle18.copyWith(color: Colors.white)),
              );
            });
  }
