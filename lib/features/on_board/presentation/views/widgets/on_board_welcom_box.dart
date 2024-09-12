import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/features/on_board/presentation/views/widgets/on_board_box_item.dart';

class OnBoardWelcomeBox extends StatelessWidget {
  const OnBoardWelcomeBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.r),
      child: Container(
        height: 330,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kDarkColor,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: const OnBoardBoxWelcomeItem(),
      ),
    );
  }
}
