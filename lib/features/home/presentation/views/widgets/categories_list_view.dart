import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/assets.dart';
import 'package:happy_kitchen/features/home/data/models/category_model/category_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/category_widget.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
  @override
  Widget build(BuildContext context) {
    // final List<String> recipesCategory = ['SOUP', 'MAIN_DISH', 'SIDE_DISH'];
    List<CategoryModel> categoryModel = [
      CategoryModel(categoryName: 'SAUCE', image: AssetsData.kLogo),
      CategoryModel(categoryName: 'SNACK', image: AssetsData.kLogo),
      CategoryModel(categoryName: 'SALAD', image: AssetsData.kLogo)
    ];
    return SizedBox(
      height: 70.r,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryModel.length,
          itemBuilder: (context, index) {
            return CategoryWidget(
              categories: categoryModel[index],
            );
          }),
    );
  }
}
