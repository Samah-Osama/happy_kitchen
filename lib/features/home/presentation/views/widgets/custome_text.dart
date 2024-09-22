import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/all_recipes_view.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 25.r, right: 25.r, bottom: 25.r, top: 10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Meal Category", style: Styles.textStyle22),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AllRecipesView.id);
            },
            child: Text("See All",
                style:
                    Styles.textStyle18.copyWith(fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }
}
