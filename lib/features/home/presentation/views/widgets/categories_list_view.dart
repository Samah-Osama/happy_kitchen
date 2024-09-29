import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/category_widget.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  List<AllRecipeModel> recipeList = const[
    AllRecipeModel(category: 'SAUCE'),
     AllRecipeModel(category: 'SNACK'),
      AllRecipeModel(category: 'SALAD')
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.r,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recipeList.length,
          itemBuilder: (context, index) {
            return  CategoryWidget(recipeModel: recipeList[index]);
          }),
    );
  }
}
