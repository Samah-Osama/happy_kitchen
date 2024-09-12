import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';

class VerticalCircularWidget extends StatelessWidget {
  const VerticalCircularWidget({super.key, required this.length});
  final int length;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(length, (index) {
          return Container(
            height: 2.r,
            width: 2.r,
            margin: EdgeInsets.only(bottom: 3.r),
            decoration: BoxDecoration(
              color: kDarkGreyFontColor,
              borderRadius: BorderRadius.circular(2.0),
            ),
          );
        }));
  }
}
