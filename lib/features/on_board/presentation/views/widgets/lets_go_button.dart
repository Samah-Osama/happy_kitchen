import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/features/home/presentation/views/home_view.dart';

class LetsGoButton extends StatelessWidget {
  const LetsGoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HomeView.id);
      },
      child: Container(
        height: 50.h,
        width: 220.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kPrimaryColorDarkMode,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: const Text("Let's Go", style: Styles.textStyle20),
      ),
    );
  }
}
