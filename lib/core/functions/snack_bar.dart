import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 10,
      backgroundColor: ThemeColorHelper.getPrimaryColor(context),
      content: Text(
        style: const TextStyle(fontSize: 20),
        message,
      ),
    ),
  );
}
