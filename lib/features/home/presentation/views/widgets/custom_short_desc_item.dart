import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_menu_icon.dart';

class CustomShortDescItem extends StatelessWidget {
  const CustomShortDescItem({
    super.key,
    required this.text1,
    required this.type,
  });
  final String text1;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomMenuIcon(),
        SizedBox(height: 12.h),
        Text(
          text1,
          style: Styles.textStyle16.copyWith(color: kWhiteColor),
        ),
        SizedBox(height: 4.r),
        Text(
          type,
          style: Styles.textStyle16.copyWith(
            color: ThemeColorHelper.getGreyAndWhite(context),
          ),
        ),
      ],
    );
  }
}
