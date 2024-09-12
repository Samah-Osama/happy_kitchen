import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/styles.dart';

class CustomAppBarText extends StatelessWidget {
  const CustomAppBarText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello',
          style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          'Are u ready to cook ?',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
