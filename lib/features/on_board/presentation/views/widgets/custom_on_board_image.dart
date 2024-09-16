import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/assets.dart';

class OnBoardImage extends StatelessWidget {
  const OnBoardImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        AssetsData.kLogo,
        height: 400.0.r,
      ),
    );
  }
}
