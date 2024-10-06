import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/functions/snack_bar.dart';
import 'package:happy_kitchen/features/home/presentation/view_model/all_recipe_cubit/all_recipes_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_dashboard_view_app_bar.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_slide_widget.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custome_text.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_list_body.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  static String id = 'DashBoardView';

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  late final ScrollController scrollController;
  int nextPage = 1;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {
    var thereIsMoreData =
        BlocProvider.of<AllRecipesCubit>(context).thereIsMoreData;
    var currentPosition = scrollController.position.pixels;
    if (currentPosition == scrollController.position.maxScrollExtent) {
      if (thereIsMoreData) {
        BlocProvider.of<AllRecipesCubit>(context)
            .getAllRecipes(pageNumber: nextPage++);
        print("this paaaage is $nextPage");
      } else {
        showSnackBar(context, 'There Is No More Recipes 😥');
      }
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
        const SliverToBoxAdapter(
          child: Column(
            children: [
              CustomDashBoardViewAppBar(),
              CustomSlideWidget(),
              CustomText(),
              CategoryListView(),
            ],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 50.r)),
        const SliverFillRemaining(child: RecipesListBody()),
        SliverToBoxAdapter(child: SizedBox(height: 10.r)),
      ],
    );
  }
}
