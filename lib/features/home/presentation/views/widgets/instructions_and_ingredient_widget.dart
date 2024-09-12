import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/instruction_and_infredient_button.dart';

class InstructionsAndIngredientWidget extends StatelessWidget {
  const InstructionsAndIngredientWidget({
    super.key,
  });
  final int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.r),
      padding: EdgeInsets.symmetric(vertical: 12.r),
      decoration: BoxDecoration(
        color: ThemeColorHelper.getDarkGreyAndPink(context),
        borderRadius: BorderRadius.circular(36.r),
      ),
      child: const InstructionsAndIngredientButton(),
    );
  }
}
