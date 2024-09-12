import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/features/favorite/presentation/views/widgets/add_Recipe_icon.dart';

class CustomFavoriteViewAppBar extends StatelessWidget {
  const CustomFavoriteViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 15.r, top: 90.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Favorits',
            style: Styles.textStyle24.copyWith(fontWeight: FontWeight.bold),
          ),
          const AddRecipeIcon()
        ],
      ),
    );
  }
}
