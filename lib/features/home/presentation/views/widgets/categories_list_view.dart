import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/category_widget.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> recipesCategory = ['SOUP' , 'MAIN_DISH' , 'SIDE_DISH'];
    return SizedBox(
      height: 70.r,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recipesCategory.length,
          itemBuilder: (context, index) {
            return CategoryWidget(categoryName: recipesCategory[index]);
          }),
    );
  }
}
