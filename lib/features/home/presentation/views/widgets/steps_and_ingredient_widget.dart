import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/cubit/steps_and_ingredients_cubit.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/steps_and_Ingredients_Information.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/steps_and_ingredient_button.dart';

class StepsAndIngredientWidget extends StatelessWidget {
  const StepsAndIngredientWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.r),
          padding: EdgeInsets.symmetric(vertical: 12.r),
          decoration: BoxDecoration(
            color: ThemeColorHelper.getDarkGreyAndPink(context),
            borderRadius: BorderRadius.circular(36.r),
          ),
          child: const StepsAndIngredientButton(),
        ),
        const SizedBox(height: 30),
        BlocBuilder<StepsAndIngredientsCubit, StepsAndIngredientsState>(
          builder: (context, state) {
            if (State is StepsAndIngredientButton) {
              return const StepsAndIngredientsInformation(text: 'kpwdl');
            } else {
              return const StepsAndIngredientsInformation(text: ',owkdoddddd');
            }
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
