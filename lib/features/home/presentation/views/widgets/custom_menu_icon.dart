import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

class CustomMenuIcon extends StatelessWidget {
  const CustomMenuIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.menu_rounded,
      size: 30.r,
      color: ThemeColorHelper.getGreyAndWhite(context),
    );
  }
}
