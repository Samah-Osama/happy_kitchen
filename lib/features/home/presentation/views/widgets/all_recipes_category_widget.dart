import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/assets.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

class AllRecipesCategoryWidget extends StatefulWidget {
  const AllRecipesCategoryWidget({
    super.key,
  });

  @override
  State<AllRecipesCategoryWidget> createState() =>
      _AllRecipesCategoryWidgetState();
}

class _AllRecipesCategoryWidgetState extends State<AllRecipesCategoryWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(5, (index) {
      return GestureDetector(
        onTap: () {
          currentIndex = index;
          setState(() {});
        },
        child: Container(
          margin: EdgeInsets.only(left: 15.r),
          width: 130.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? ThemeColorHelper.getSeconderyColor(context)
                : ThemeColorHelper.getLightGreyAndDarkPink(context),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 35.r,
                width: 35.r,
                decoration: BoxDecoration(
                    color: currentIndex == index
                        ? ThemeColorHelper.getPrimaryColor(context)
                        : ThemeColorHelper.getDarkGreyAndPink(context),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(AssetsData.kLogo),
              ),
              Text(
                'Breakfast',
                style: Styles.textStyle18
                    .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
              )
            ],
          ),
        ),
      );
    }));
  }
}
