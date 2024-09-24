import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/widgets/custom_loading_indicator.dart';
import 'package:happy_kitchen/features/home/presentation/view_model/all_recipe_cubit/all_recipes_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/all_recipes_category_widget.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_list_body.dart';

class AllRecipesBody extends StatefulWidget {
  const AllRecipesBody({super.key});

  @override
  State<AllRecipesBody> createState() => _AllRecipesBodyState();
}

class _AllRecipesBodyState extends State<AllRecipesBody> {
   late final ScrollController scrollController;
  int nextPage = 1;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {
    var currentPosition = scrollController.position.pixels;
    if (currentPosition >= 0.8 * scrollController.position.maxScrollExtent) {
      const CustomLoadingIndicator();
      BlocProvider.of<AllRecipesCubit>(context)
          .getAllRecipes(pageNumber: nextPage++);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30.r),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: AllRecipesCategoryWidget(),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 100.r)),
        const SliverFillRemaining(child: RecipesListBody()),
      ],
    );
  }
}
