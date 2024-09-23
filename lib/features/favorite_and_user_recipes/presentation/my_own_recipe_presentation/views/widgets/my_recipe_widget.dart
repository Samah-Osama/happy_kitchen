import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/core/widgets/custom_error_widget.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/my_own_recipe_data/models/add_recipe_model.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/view_model/picked_image/picked_image_cubit.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/user_recipes_details_view.dart';

class MyRecipeWidget extends StatelessWidget {
  const MyRecipeWidget({
    super.key,
    required this.recipeModel,
  });
  final AddRecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    String chiefIcon = '👩‍🍳';
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UserRecipesDetailsView.id,
            arguments: recipeModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200.h,
            width: 190.w,
            decoration: BoxDecoration(
                color: ThemeColorHelper.getLightGreyAndDarkPink(context),
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.outer,
                      blurRadius: 5.r,
                      color: ThemeColorHelper.getWhiteAndBlack(context))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                    textAlign: TextAlign.center,
                    '${recipeModel.title} $chiefIcon',
                    style: Styles.textStyle18
                        .copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 8.h),
                Text(
                    textAlign: TextAlign.center,
                    "${recipeModel.recipeTime} Minutes",
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.normal)),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.only(bottom: 15.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(22.r),
                          bottomLeft: Radius.circular(22.r)),
                      boxShadow: [
                        BoxShadow(
                            blurStyle: BlurStyle.outer,
                            blurRadius: 3.r,
                            color: ThemeColorHelper.getWhiteAndBlack(context))
                      ]),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Steps\nIngredients',
                        style: Styles.textStyle18,
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: 30.r,
              bottom: 140.r,
              child: BlocBuilder<PickedImageCubit, PickedImageState>(
                  builder: (context, state) {
                // var image = BlocProvider.of<PickedImageCubit>(context);
                if (state is PickedImageSuccess) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Image.file(File(recipeModel.image))
                  );
                } else {
                  return const Text('ooops');
                }
              }))
        ],
      ),
    );
  }
}
