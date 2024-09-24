import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_details_page_app_bar.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/recipe_details_widget.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.recipeModel});
  @override
  final AllRecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomDetailsPageAppBar(),
              AspectRatio(
                aspectRatio: 2.9 / 2.5,
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fill)),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return const Icon(
                      Icons.error,
                      size: 25,
                    );
                  },
                  imageUrl: recipeModel.image,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: RecipeDetailsWidget(recipeModel: recipeModel),
        )
      ],
    );
  }
}
