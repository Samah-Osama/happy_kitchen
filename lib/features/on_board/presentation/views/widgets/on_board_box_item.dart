import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/features/on_board/presentation/views/widgets/lets_go_button.dart';

class OnBoardBoxWelcomeItem extends StatelessWidget {
  const OnBoardBoxWelcomeItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Simplify your \ncooking plan",
            style: Styles.textStyle28.copyWith(color: kLightFontColor)),
        SizedBox(height: 24.0.h),
        Text(
          textAlign: TextAlign.center,
          "No more confused about \nyour meal menu",
          style: Styles.textStyle18.copyWith(color: kDarkGreyFontColor),
        ),
        SizedBox(height: 28.0.h),
        const LetsGoButton(),
      ],
    );
  }
}
