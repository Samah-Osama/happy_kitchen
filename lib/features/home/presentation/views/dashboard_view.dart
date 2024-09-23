import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/home/presentation/view_model/all_recipe_cubit/all_recipes_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_dashboard_view_app_bar.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_slide_widget.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custome_text.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_list.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});
  @override
  static String id = 'DashBoardView';

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllRecipesCubit>(context).getAllRecipes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
        const SliverFillRemaining(child: RecipesList()),
        SliverToBoxAdapter(child: SizedBox(height: 10.r)),
      ],
    );
  }
}
