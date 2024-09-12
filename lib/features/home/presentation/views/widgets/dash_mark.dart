import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

class DashMark extends StatelessWidget {
  const DashMark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.0,
      width: 28.0,
      margin: const EdgeInsets.only(bottom: 32.0),
      decoration: BoxDecoration(
        color: ThemeColorHelper.getGreyAndWhite(context),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
