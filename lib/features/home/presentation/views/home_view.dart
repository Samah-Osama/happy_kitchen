import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/Favorits.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/home/presentation/views/dashboard_view.dart';
import 'package:happy_kitchen/features/favorite/presentation/views/favorite_view.dart';
import 'package:happy_kitchen/features/kitchens/presentation/view/all_kitchen_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  State<HomeView> createState() => _HomeViewState();
}

int selectedItem = 0;
List<Widget> views = [
  // DashboardScreen(),
  const DashBoardView(),
  const AllKitchensView(),
  const FavoritesView(),
  const FavoritsScreen(),
//  AllRecipesScreen()
  // const AllRecipes()
];

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 90.h,
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: ThemeColorHelper.getPrimaryColor(context),
          unselectedItemColor: kDarkGreyFontColor,
          currentIndex: selectedItem,
          onTap: (value) {
            selectedItem = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 30.r), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.food_bank_outlined, size: 30.r),
                label: 'Kitchen'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border, size: 30.r),
                label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline_outlined, size: 30.r),
                label: '.'),
          ],
        ),
      ),
      body: views[selectedItem],
    );
  }
}
