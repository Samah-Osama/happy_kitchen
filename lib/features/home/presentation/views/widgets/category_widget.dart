import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/assets.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/home/data/models/category_model/category_model.dart';
import 'package:happy_kitchen/features/home/presentation/view_model/recipe_by_category/recipe_by_category_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/views/recipe_by_category_view.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.categories,
  });
  final CategoryModel categories;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: GestureDetector(
        onTap: () {
          // BlocProvider.of<RecipeByCategoryCubit>(context)
          //     .getRecipesByCategory();
          Navigator.pushNamed(context, RecipeByCategoryView.id,
              arguments: categories);
        },
        child: Container(
          width: 160.r,
          height: 50.r,
          decoration: BoxDecoration(
              color: ThemeColorHelper.getPrimaryColor(context),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 45.r,
                width: 55.r,
                decoration: BoxDecoration(
                    color: ThemeColorHelper.getSecondaryColor(context),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(categories.image),
              ),
              Text(
                categories.categoryName,
                style: Styles.textStyle20
                    .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
