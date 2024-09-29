// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
// import 'package:happy_kitchen/features/home/presentation/view_model/all_recipe_cubit/all_recipes_cubit.dart';
// import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_widget.dart';

// class RecipeList extends StatefulWidget {
//   const RecipeList({
//     super.key,
//     required this.recipeList,
//   });
//   final List<AllRecipeModel> recipeList;

//   @override
//   State<RecipeList> createState() => _RecipeListState();
// }

// class _RecipeListState extends State<RecipeList> {
//   // late final ScrollController scrollController;
//   // int nextPage = 1;

//   // @override
//   // void initState() {
//   //   scrollController = ScrollController();
//   //   scrollController.addListener(scrollListener);
//   //   super.initState();
//   // }

//   // void scrollListener() {
//   //   var currentPosition = scrollController.position.pixels;
//   //   if (currentPosition == scrollController.position.maxScrollExtent) {

//   //     BlocProvider.of<AllRecipesCubit>(context)
//   //         .getAllRecipes(pageNumber: nextPage++);
//   //     print(nextPage);
//   //   }
//   // }

 
//   // void dispose() {
//   //   scrollController.dispose();
//   //   super.dispose();
//   // }


//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         //  controller: scrollController,
//          physics: const NeverScrollableScrollPhysics(),
//         itemCount: widget.recipeList.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             childAspectRatio: 1.0, mainAxisSpacing: 80.r, crossAxisCount: 2),
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.r),
//             child: RecipeWidget(recipeModel: widget.recipeList[index]),
//           );
//         });
//   }
// }
