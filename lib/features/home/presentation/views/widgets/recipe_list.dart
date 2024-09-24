import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_widget.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({
    super.key,
    required this.recipeList,
  });
  final List<AllRecipeModel> recipeList;

  @override
  State<RecipeList> createState() => _RecipeListState();
}
  // late final ScrollController scrollController;
  // int nextPage = 1;
  // @override
  // void initState() {
  //   scrollController = ScrollController();
  //   scrollController.addListener(scrollListener);
  //   super.initState();
  // }

  // void scrollListener() {
  //   var currentPosition = scrollController.position.pixels;
  //   if (currentPosition >= 0.8 * scrollController.position.maxScrollExtent) {
  //     const CustomLoadingIndicator();
  //     BlocProvider.of<AllRecipesCubit>(context).getAllRecipes(pageNumber: nextPage++);
  //   }
  // }

class _RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        // controller: scrollController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.recipeList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0, mainAxisSpacing: 80.r, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: RecipeWidget(recipeModel: widget.recipeList[index]),
          );
        });
  }
}
