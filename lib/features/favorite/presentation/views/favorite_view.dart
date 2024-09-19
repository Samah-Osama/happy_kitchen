import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/views/my_own_recipes_view.dart';
import 'package:happy_kitchen/features/favorite/presentation/views/widgets/custom_favorite_view_app_bar.dart';
import 'package:happy_kitchen/features/favorite/presentation/views/widgets/favorite_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: const CustomFavoriteViewAppBar(),
      ),
       body: MyOwnRecipesView(),
      // body: const FavoritesViewBody(),
    );
  }
}
