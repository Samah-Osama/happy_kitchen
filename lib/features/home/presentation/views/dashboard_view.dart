import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_dashboard_view_app_bar.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_slide_widget.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custome_text.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_list.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});
  @override
  static String id = 'DashBoardView';
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
        SliverToBoxAdapter(child: SizedBox(height: 100.r)),
        const RecipesList(),
        SliverToBoxAdapter(child: SizedBox(height: 10.r)),
      ],
    );
  }
}
