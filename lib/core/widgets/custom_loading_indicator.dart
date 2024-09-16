import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .2,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [ThemeColorHelper.getPrimaryColor(context)],
        ),
      ),
    );
  }
}
