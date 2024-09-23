import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: Styles.textStyle20,
    );
  }
}
