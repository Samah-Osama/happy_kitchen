import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/Instructions_and_Ingredients_Information.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/instructions_and_ingredient_widget.dart';

class InstructionsAndIngredientSection extends StatelessWidget {
  const InstructionsAndIngredientSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          const InstructionsAndIngredientWidget(),
          SizedBox(height: 20.h),
          const InstructionsAndIngredientsInformation(text: details)
        ],
      ),
    );
  }
}
