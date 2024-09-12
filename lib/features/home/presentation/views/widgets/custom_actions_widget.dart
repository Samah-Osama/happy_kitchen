import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

class CustomActionsWidget extends StatelessWidget {
  const CustomActionsWidget({
    super.key,
    this.onTap,
    this.child,
  });
  final void Function()? onTap;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: ThemeColorHelper.getLightGreyAndDarkPink(context),
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: child),
    );
  }
}
