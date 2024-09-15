import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/on_board/presentation/views/widgets/custom_on_board_image.dart';
import 'package:happy_kitchen/features/on_board/presentation/views/widgets/on_board_welcom_box.dart';

class OnBoardViewBody extends StatelessWidget {
  const OnBoardViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        const Stack(
          children: [
            OnBoardImage(),
          ],
        ),
        const OnBoardWelcomeBox(),
      ],
    );
  }
}




