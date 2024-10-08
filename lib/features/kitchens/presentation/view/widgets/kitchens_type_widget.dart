import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/kitchens/data/models/kitchens_model/kitchens_model.dart';

class KitchensTypeWidget extends StatelessWidget {
  const KitchensTypeWidget({
    super.key,
    required this.kitchensModel,
  });
  final KitchensModel kitchensModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 170.r,
            width: 160.r,
            decoration: BoxDecoration(
              color: ThemeColorHelper.getLightGreyAndPink(context),
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 35.r),
                  child: Text(
                    kitchensModel.name ?? 'Other',
                    style: Styles.textStyle18
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Positioned(
              bottom: 80.r,
              height: 150.r,
              left: 20.r,
              child: Image.asset(
                'assets/images/women.png',
              ))
        ],
      ),
    );
  }
}
