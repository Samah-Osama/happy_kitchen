import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/assets.dart';
import 'package:happy_kitchen/features/home/data/models/category_model/category_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/category_widget.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  // List<AllRecipeModel> recipeList = const[
  //   AllRecipeModel(category: 'SAUCE'),
  //    AllRecipeModel(category: 'SNACK'),
  //     AllRecipeModel(category: 'SALAD')
  // ];
  List<CategoryModel> categories = [
    CategoryModel(categoryName: 'SAUCE', image: AssetsData.kLogo),
    CategoryModel(categoryName: 'SNACK', image: AssetsData.kLogo),
    CategoryModel(categoryName: 'SALAD', image: AssetsData.kLogo),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.r,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryWidget(
              categoryModel: categories[index],
            );
          }),
    );
  }
}
