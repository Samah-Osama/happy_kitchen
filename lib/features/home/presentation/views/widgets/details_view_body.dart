import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_details_page_app_bar.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_details_widget.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomDetailsPageAppBar(),
              AspectRatio(
                aspectRatio: 3 / 1.9,
                child: Image.asset('assets/images/dish.png'),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: RecipeDetailsWidget(),
        )
      ],
    );
  }
}
